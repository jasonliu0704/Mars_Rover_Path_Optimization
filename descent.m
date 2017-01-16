function [xp,yp,hp] = descent(x,y,h,dhdx,dhdy,xp,yp,g,C,V,cg,cycles)
% Computes the optimal path (xp,yp) with height hp for a cost function 
% of the form J = sum(distance*(1 + (2*g*C*h/V^2)^2) on a terrain. 
% Inputs:  xp and yp are the path. The  gravitational constant (g), the constant
%          (C), and velocity are (V) are needed to evaluate the gradient of the cost function.
%          cg=0 is steepest descent and cg =1 is conjugate gradient.  cycles is the number
%          of optimization cycles to perform.
% Outputs: The optimal path (xp,yp) with height (hp) after cycles number of either conjugate
%          gradient or steepest descent optimziation. 

 %
 %Parameters
 %
 %astep: vary a from 0 to amax using this interval size
 %amax: maximum displacement of any point during each optimization call
 %dmax: The maximum horizontal distance between points.  If d > dmax a point is added
 %      in between.  Used in check_path_points.
 %disp_cost: if set to true the cost after each optimization cycle is output to the 
 %      screen

 astep=0.001;
 amax=0.03;
 dmax=0.2;
 disp_cost=true;

 %
 %Check inputs and outputs are correct
 %
 if (nargin ~= 12)
   disp('(descent) Error wrong number of inputs');
   fprintf('nargin = %d \n',nargin);
   xp= nan; yp= nan; hp= nan; 
   return
 end
 if (nargout ~= 3)
   disp('(descent) Error wrong number of outputs');
   fprintf('nargout = %d \n',nargout);
   return
 end

 %
 %Perform advanced checks to ensure fields and parameters are correct
 %
 a=advanced_checks();
 if ( ~a )
   disp('(descent) Fields are not correct size');
   xp= nan; yp= nan; hp= nan; 
   return
 end

 %
 %Set limits of domain based on terrain extents 
 %
 xmax=x(end-1);
 xmin=x(2);
 ymax=y(end-1);
 ymin=y(2);

 %
 %Preallocate
 %
 sx=zeros(1,length(xp));
 sy=zeros(1,length(xp));

 %
 %Perform optimization cycles
 %
 for kk = 1:cycles %f0  %variable number of cycles determined by input

   %
   %Define height along path and gradients dhdxp dhdyp dJdxp dJdyp
   %
   [hp dhdxp dhdyp dJdxp dJdyp]=path_gradients(x,y,h,dhdx,dhdy,xp,yp,g,C,V);

   %
   %Compute dxm, dym dhm
   % 
   %Preallocate, path length may have changed 
   dxm=zeros(1,length(xp));
   dym=zeros(1,length(xp));
   dhm=zeros(1,length(xp));

   for ii = 2:length(xp)
     dxm(ii)   = xp(ii)-xp(ii-1); 
     dym(ii)   = yp(ii)-yp(ii-1);
     dhm(ii)   = hp(ii)-hp(ii-1);
   end
   dxm(1)=dxm(2);
   dym(1)=dym(2);
   dhm(1)=dhm(2);

   %
   %Set gradient of cost at path points
   %
   if (kk > 1 && cg==1 ) 
     beta =( dJdxp(2:length(xp)-1)*( dJdxp(2:length(xp)-1)' - dJdxo(2:length(xp)-1)' ) + ...
             dJdyp(2:length(yp)-1)*( dJdyp(2:length(yp)-1)' - dJdyo(2:length(yp)-1)' ) )/...
           ( dJdxo(2:length(xp)-1)*dJdxo(2:length(xp)-1)' + ...
             dJdyo(2:length(yp)-1)*dJdyo(2:length(yp)-1)' );
     beta = max([0 beta]);
   end 
   for ii = 2:length(xp)-1  %f1
     if (kk == 1 || cg==0 ) 
       %Steepest Descent or 1st iteration of Conjugate Gradient
       sx(ii) = dJdxp(ii);
       sy(ii) = dJdyp(ii);
     else 
       %Conjugate Gradient
       sx(ii) = dJdxp(ii) + beta*dJdxo(ii);
       sy(ii) = dJdyp(ii) + beta*dJdyo(ii);
     end
   end %f1

   %
   %Test moving certain distances in direction -sx,-sy 
   %   
   al = [0:astep:amax]/sqrt(max(dJdxp.^2 + dJdyp.^2));
   for jj = 1:length(al)  %f2 loop over distances to move at path point 
    xs(1) = xp(1);
    xs(length(xp)) = xp(length(xp));
    ys(1) = yp(1);
    ys(length(yp)) = yp(length(yp));
    hs(1) = hp(1);
    hs(length(hp)) = hp(length(hp));
    for ii = 2:length(xp)-1
      xs(ii) = xp(ii)-al(jj)*sx(ii); 
      ys(ii) = yp(ii)-al(jj)*sy(ii);
      dx22(ii) = (dxm(ii+1)+al(jj)*sx(ii))^2 + (dxm(ii)-al(jj)*sx(ii))^2;
      dy22(ii) = (dym(ii+1)+al(jj)*sy(ii))^2 + (dym(ii)-al(jj)*sy(ii))^2;
      if ( xs(ii) >= xmin && xs(ii) <= xmax && ys(ii) >= ymin && ys(ii) <= ymax )
        hs(ii) = bilinear(x,y,h,xs(ii),ys(ii));
      else
        hs(ii) = 10;
      end
    end
    for ii = 2:length(xp)-1 
      dh22 = (hs(ii+1) - hs(ii))^2 + (hs(ii) - hs(ii-1))^2;
      dJ(ii,jj) = sqrt((dx22(ii) + dy22(ii) + dh22)*(1 + (2*g*C*hs(ii)/V^2)^2));
    end
   end %f2 loop over test distances to move

   %
   % Select path with minimum cost function and update x, y, and h
   %
   J(1:length(al)) = sum(dJ(2:length(xp)-1,1:length(al)));
   for ii = 2:length(xp)-1
     [Jmin,Jind] = min(J);
     alpha = al(Jind);
     xp(ii) = xp(ii) - alpha*sx(ii);
     yp(ii) = yp(ii) - alpha*sy(ii);
     hp(ii)=bilinear(x,y,h,xp(ii),yp(ii));
     %Save old cost gradient 
     dJdxo(ii) = dJdxp(ii);
     dJdyo(ii) = dJdyp(ii);
   end
   if (disp_cost)
    fprintf('Cost on iteration %d = %f  alpha = %f  path length= %d \n',kk,min(J),Jind/length(al),length(xp));
   end

   %
   %Check path points to ensure they do not exceed distance apart threshold
   %
   check_path_points();

 end % f0 kk loop

 function check_path_points()
  %Local nested function to check whether two points on the path
  % have become too far apart.
   for iii=2:length(xp)
    ds(iii) = sqrt((xp(iii)-xp(iii-1))^2+(yp(iii)-yp(iii-1))^2);
   end
   for iii=2:length(xp)-1
     if (ds(iii) > dmax)
       %
       %Add storage for an extra point
       %
       xp(iii+1:length(xp)+1) = xp(iii:length(xp));
       yp(iii+1:length(yp)+1) = yp(iii:length(yp));
       hp(iii+1:length(hp)+1) = hp(iii:length(hp));
       ds(iii+1:length(ds)+1) = ds(iii:length(ds));
       dJdxo(iii+1:length(dJdxo)+1) = dJdxo(iii:length(dJdxo));
       dJdyo(iii+1:length(dJdyo)+1) = dJdyo(iii:length(dJdyo));

       %
       %Compute the coordinates and hp, dhdxp dhdyp at new point
       %
       xp(iii) = 0.5*(xp(iii+1)+xp(iii-1));
       yp(iii) = 0.5*(yp(iii+1)+yp(iii-1));
       %bilinear
       hp(iii) =bilinear(x,y,h,xp(iii),yp(iii));
       dhdxp(iii) =bilinear(x,y,dhdx,xp(iii),yp(iii));
       dhdyp(iii) =bilinear(x,y,dhdy,xp(iii),yp(iii));
       %
       %Compute ds and dJdxp dJdyp and new point
       %
       ds(iii)    = sqrt((xp(iii)-xp(iii-1))^2+(yp(iii)-yp(iii-1))^2);
       ds(iii+1)  = sqrt((xp(iii+1)-xp(iii))^2+(yp(iii+1)-yp(iii))^2);
       [a b]=compute_dJ(xp(iii-1:iii+1),yp(iii-1:iii+1),hp(iii-1:iii+1),dhdxp(iii-1:iii+1),dhdyp(iii-1:iii+1),g,C,V);
       dJdxo(iii)=a(2);
       dJdyo(iii)=b(2);
     end
   end 

  end %check_path_points

  function [input_passes_checks]=advanced_checks()
   %This local nested function checks all the inputs

   input_passes_checks=logical(1); %Set to true
   
   if ( length(x)~=size(h,1) )
         disp('(descent>advanced_checks) Error length(x)~=size(h,1)');
         input_passes_checks=false; %Set to false
         return
   end

   if ( length(y)~=size(h,2) )
         disp('(descent>advanced_checks) Error length(y)~=size(h,2)');
         input_passes_checks=false; %Set to false
         return
   end

   if ( size(h)~=size(dhdx) )
         disp('(descent>advanced_checks) Error size(h)~=size(dhdx)');
         input_passes_checks=false; %Set to false
         return
   end

   if ( size(h)~=size(dhdy) )
         disp('(descent>advanced_checks) Error size(h)~=size(dhdy)');
         input_passes_checks=false; %Set to false
         return
   end

   if ( length(xp)~=length(yp) )
         disp('(descent>advanced_checks) Error length(xp)~=length(yp)');
         input_passes_checks=false; %Set to false
         return
   end

   if ( g<=0 )
         disp('(descent>advanced_checks) Error g<=0');
         input_passes_checks=false; %Set to false
         return
   end
 
  if ( C<=0 )
         disp('(descent>advanced_checks) Error C<=0');
         input_passes_checks=false; %Set to false
         return
   end

   if ( V<=0 )
         disp('(descent>advanced_checks) Error V<=0');
         input_passes_checks=false; %Set to false
         return
   end
  end %advanced_checks
end %descent_analytic

function [hp dhdxp,dhdyp,dJdxp,dJdyp] = path_gradients(x,y,h,dhdx,dhdy,xp,yp,g,C,V)
% Computes the gradients of the height and cost along a path for a cost 
% function of the form J = sum(distance*(1 + (2*g*C*h/V^2)^2) on a two-dimensional terrain field.
% Inputs: x, y are the x- and y-grids corresponding to the h, dhdx, and dhdy fields.
%         xp and yp are the path. Additionally, the  gravitational constant (g), and velocity 
%          are (V) are needed to evaluate the gradient of the cost function.
%Outputs: along track derivatives of h and J dhdxp, dhdyp, dJdxp, dJdyp.

   if (nargin ~= 10)
         disp = '(path_gradients) Error wrong number of inputs';
         fprintf('nargin = %d \n',nargin);
         dhdxp= nan; dhdyp= nan; dJdxp= nan; dJdyp= nan;
         return
   end

  if (nargout ~= 5)
        disp = '(path_gradients) Error wrong number of outputs';
        fprintf('nargout = %d \n',nargout);
        return
  end

  %Pre-allocate 
  hp=zeros(1,length(xp));
  dhdxp=zeros(1,length(xp));
  dhdyp=zeros(1,length(xp));
  dJdxp=zeros(1,length(xp));
  dJdyp=zeros(1,length(xp));

  %Interpolate height along path
  %Interpolate the derivatives of the height along the path
  for ii = 1:length(xp)
   hp(ii)=bilinear(x,y,h,xp(ii),yp(ii));
   dhdxp(ii)=bilinear(x,y,dhdx,xp(ii),yp(ii));
   dhdyp(ii)=bilinear(x,y,dhdy,xp(ii),yp(ii));
  end

  [dJdxp dJdyp]=compute_dJ(xp,yp,hp,dhdxp,dhdyp,g,C,V);

end %descent

function [dJdxp dJdyp]=compute_dJ(xp,yp,hp,dhdxp,dhdyp,g,C,V)
  %
  %Compute dJdxp and dJdyp
  %

  if (nargin ~= 8)
        disp = '(compute_dJ) Error wrong number of inputs';
        fprintf('nargin = %d \n',nargin);
        dhdxp= nan; dhdyp= nan; dJdxp= nan; dJdyp= nan;
        return
  end

  if (nargout ~= 2)
        disp = '(compute_dJ) Error wrong number of outputs';
        fprintf('nargout = %d \n',nargout);
        return
  end

  for ii = 2:length(xp)
    dxm(ii)   = xp(ii)-xp(ii-1);
    dym(ii)   = yp(ii)-yp(ii-1);
    dhm(ii)   = hp(ii)-hp(ii-1);
    dist(ii)  = dxm(ii)^2+dym(ii)^2+dhm(ii)^2;
    dddx(ii)  = 2*dxm(ii) + 2*dhm(ii)*dhdxp(ii);
    dddy(ii)  = 2*dym(ii) + 2*dhm(ii)*dhdyp(ii);
    W(ii)     = 1+(2*g*C*hp(ii)/V^2)^2;
    dWdx(ii)  = 2*(2*g*C*hp(ii)/V^2)*(g*C/V^2)*dhdxp(ii);
    dWdy(ii)  = 2*(2*g*C*hp(ii)/V^2)*(g*C/V^2)*dhdyp(ii);
  end
  for ii = 2:length(xp)-1
    dJdxp(ii) = ((dddx(ii)-dddx(ii+1))*W(ii)+(dist(ii)+dist(ii+1))*dWdx(ii))/...
                (2*sqrt((dist(ii)+dist(ii+1))*W(ii)));
    dJdyp(ii) = ((dddy(ii)-dddy(ii+1))*W(ii)+(dist(ii)+dist(ii+1))*dWdy(ii))/...
                (2*sqrt((dist(ii)+dist(ii+1))*W(ii)));
  end
end
