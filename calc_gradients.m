function [dfdx dfdy] = calc_gradients(x,y,f)
 %calc_gradients: Calculates the x and y derivatives
 % of a two-dimensional field f.
 %Inputs: x,y are the one-dimensional grids, and f is the two-dimensional field.
 %Outputs: dfdx and dfdy are the two-dimensional fields of the derivatives.
 %
 %Comments: This function uses the central difference approximation and Neuman BCs.

 %preallocate 
 dfdy=zeros(length(x),length(y));
 dfdx=zeros(length(x),length(y));

 %compute derivative dfdx
 for i=2:length(x)-1
        dx = x(i+1)-x(i-1);
        for j=1:length(y)
                dfdx(i,j) = (f(i+1,j) - f(i-1,j) )/dx;
        end
 end
 %Boundary Conditions
 dfdx(1,:)=dfdx(2,:);
 dfdx(length(x),:)=dfdx(length(x)-1,:);   

 %compute derivative dfdx
 for i=1:length(x)
        for j=2:length(y)-1
                dy = y(j+1)-y(j-1);
                dfdy(i,j) = (f(i,j+1) - f(i,j-1) )/dy;
        end
 end
 %Boundary Conditions
 dfdy(:,1)=dfdy(:,2);
 dfdy(:,length(y))=dfdy(:,length(y)-1);   

end %function 
