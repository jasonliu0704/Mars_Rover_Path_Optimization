function [Tp] = bilinear(x,y,T,Px,Py) 
 %bilinear: Bilinear of interpolation of T(x,y) to get Tp(Px,Py)
 %Input: x, y, T, Px, Py -one dimensional xgrid, ygrid and 
 %           two dimensional T and target point Px, Py
 %                       
 %Output: Tp- Temperature at Px, Py
 if (nargin ~= 5) 
  	 Tp = 'Error wrong number of inputs';
         return
 end

 [i1,j1] = bound_target(x,y,Px,Py); 

 Tp = interp_target(x,y,i1,j1,T,Px,Py);

end
%Local Functions (Need to pass in variables )

 function [Tpxpy] = interp_target(x,y,i1,j1,T,Px,Py) 
 %Performs the binear interpolation given i1 and j1
  if ( i1 < 0 || j1 < 0 )
	 Tpxpy = 'Error Px or Py out of range';
         return
  end

  Tpxpy = (T(i1  ,j1  )*(x(i1+1)-Px)*(y(j1+1)-Py) ... 
        +  T(i1+1,j1  )*(Px-x(i1))*(y(j1+1)-Py) ... 
        +  T(i1  ,j1+1)*(x(i1+1)-Px)*(Py-y(j1)) ... 
        +  T(i1+1,j1+1)*(Px-x(i1))*(Py-y(j1)) ) ...
        / ( (x(i1+1)-x(i1))*(y(j1+1)-y(j1)) );
 end

 function [ iloc,jloc ] = bound_target(x,y,Px,Py)
 %Finds iloc and jloc

  if ( Px > x(end) || Px < x(1) )
   iloc = -1;
   jloc = -1;
   disp ('Error Px out of bounds bound_target')
   return
  end
  if ( Py > y(end) || Py < y(1) )
   iloc = -1;
   jloc = -1;
   disp ('Error Py out of bounds bound_target')
   return
  end

  [val iloc] = min(abs(Px-x));
  if (Px<x(iloc)); iloc=iloc-1; end

  [val jloc] = min(abs(Py-y));
  if (Py<y(jloc)); jloc=jloc-1; end
  
 end 
