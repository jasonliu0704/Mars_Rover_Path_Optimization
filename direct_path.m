function [RoverPath]=direct_path(x,y,h,xs,xe,ys,ye,n)
 %Computes the x- and y-cooridnates and elevation on the
 % straight line path between start point and end point.
 %Inputs:
 %xs,ys is starting location
 %xe,ye is ending location
 %x,y are grids
 %h is the elevation
 %n is the number of segments
 %Outputs:
 %RoverPath: The xp,yp,hp as a 3xn matrix

 %
 %Preallocate
 % 
 RoverPath=zeros(3,n); 

 method=1;
 if (method==1) 
  %
  %Method 1
  %

  RoverPath(1,:)=linspace(xs,xe,n);
  RoverPath(2,:)=linspace(ys,ye,n);
  for step=1:n
   RoverPath(3,step)=bilinear(x,y,h,RoverPath(1,step),RoverPath(2,step));
  end %for loop

 else % (method==2)
  %
  %Method #2
  %

  %Compute the heading
  dx=(xe-xs);
  dy=(ye-ys);
  dr2=dx.^2+dy.^2;
  dr=sqrt(dr2);
  heading(1)=dx/dr;
  heading(2)=dy/dr;
  dx_step=heading(1)*dr/(n-1); %This is how far to move in x
  dy_step=heading(2)*dr/(n-1); %This is how far to move in y 
 
  %Set the starting point as the first point on the path
  step=1;
  RoverPath(1,step)=xs;
  RoverPath(2,step)=ys;
  RoverPath(3,step)=bilinear(x,y,h,RoverPath(1,step),RoverPath(2,step));

  %Compute the rest of the path
  for step=2:n
   RoverPath(1,step)=RoverPath(1,step-1)+dx_step;
   RoverPath(2,step)=RoverPath(2,step-1)+dy_step;
   RoverPath(3,step)=bilinear(x,y,h,RoverPath(1,step),RoverPath(2,step));
  end 

 end %method if

end %function
