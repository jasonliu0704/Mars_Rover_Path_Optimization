function[h dist]=calc_dist(x,y,h,xs,xe,ys,ye,segment,nwp,wp)
if nwp==0
    [h dist] = calc_distf( x,y,h,xs,xe,ys,ye,segment(1,1));
elseif nwp==1
    [h_1 dist_1]=calc_distf( x,y,h,xs,wp(1,1),ys,wp(1,2),segment(1,1));
    [h_2 dist_2]=calc_distf( x,y,h,wp(1,1),xe,wp(1,2),ye,segment(1,2));
    dist=dist_1+dist_2;
    h=h_1+h_2;
    else
   [h_1 dist_1]=calc_distf( x,y,h,xs,wp(1,1),ys,wp(1,2),segment(1,1));
   [h_2 dist_2]=calc_distf( x,y,h,wp(1,1),wp(2,1),wp(1,2),wp(2,2),segment(1,2));
   [h_3 dist_3]=calc_distf( x,y,h,wp(2,1),xe,wp(2,2),ye,segment(1,3));
    dist=dist_1+dist_2+dist_3;
    h=h_1+h_2+h_3;
    end
end
end


function [ hp_f distf ] = calc_distf( x,y,h,xs,xe,ys,ye,n )
path=direct_path(x,y,h,xs,xe,ys,ye,n);
xp_f=path(1,:);
yp_f=path(2,:);
hp_f=path(3,:);
distf=0;
for ii=2:length(xp_f)
distf=distf+sqrt((xp_f(ii)-xp_f(ii-1)).^2+(yp_f(ii)-yp_f(ii-1)).^2+(hp_f(ii)-hp_f(ii-1)).^2);
end
end


