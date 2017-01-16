function [xpf,ypf,hpf,distf,hplusf,hminusf]=compute_path(xs,ys,xe,ye,nwp,wp,x,y,h,segment)
wp=[xs ys;wp;xe ye];
For ww=1:nwp+1
[xp{ww},yp{ww},hp{ww},dist{ww},hplus{ww},hminus{ww}]=calc_task1( x,y,h,wp(ww,1),wp(ww+1,1),wp(ww,2),wp(ww+1,2),segment(ww));
end
xpf=xp{1:nwp+1};
ypf=yp{1:nwp+1};
distf=dist{1:nwp+1};
hplusf=hplus{1:nwp+1};
hminusf=hminus{1:nwp+1};


if nwp==0
    [xp,yp,hp,dist,hplus,hminus]=calc_task1( x,y,h,xs,xe,ys,ye,segment(1));
    
elseif nwp==1
    [xp_f1,yp_f1,hp_f1,dist_1,hplus_1,hminus_1]=calc_task1( x,y,h,xs,wp(1,1),ys,wp(1,2),segment(1));
    [xp_f2,yp_f2,hp_f2,dist_2,hplus_2,hminus_2]=calc_task1( x,y,h,wp(1,1),xe,wp(1,2),ye,segment(2));
    dist=dist_1+dist_2;
    hplus=hplus_1+hplus_2;
    hminus=hminus_1+hminus_2;
    xp=[xp_f1 xp_f2];
    yp=[yp_f1 yp_f2];
    hp=[hp_f1 hp_f2];
else
   [xp_f1,yp_f1,hp_f1,dist_1,hplus_1,hminus_1]=calc_task1( x,y,h,xs,wp(1,1),ys,wp(1,2),segment(1));
   [xp_f2,yp_f2,hp_f2,dist_2,hplus_2,hminus_2]=calc_task1( x,y,h,wp(1,1),wp(2,1),wp(1,2),wp(2,2),segment(2));
   [xp_f3,yp_f3,hp_f3,dist_3,hplus_3,hminus_3]=calc_task1( x,y,h,wp(2,1),xe,wp(2,2),ye,segment(3));
    dist=dist_1+dist_2+dist_3;
    hplus=hplus_1+hplus_2+hplus_3;
    hminus=hminus_1+hminus_2+hminus_3;
    xp=[xp_f1 xp_f2 xp_f3];
    yp=[yp_f1 yp_f2 yp_f3];
    hp=[hp_f1 hp_f2 hp_f3];
    end
end

function [ xp_f,yp_f,hp_f,distf,hplusf,hminusf ] = calc_task1( x,y,h,xs,xe,ys,ye,n)
path=direct_path(x,y,h,xs,xe,ys,ye,n);
xp_f=path(1,:);
yp_f=path(2,:);
hp_f=path(3,:);
distf=0;
hplusf=0;
hminusf=0;
for ii=2:length(xp_f)
distf=distf+sqrt((xp_f(ii)-xp_f(ii-1)).^2+(yp_f(ii)-yp_f(ii-1)).^2+(hp_f(ii)-hp_f(ii-1)).^2);
delta_hf=hp_f(ii)-hp_f(ii-1);
if delta_hf>0
    hplusf=hplusf+delta_hf;
end
if delta_hf<0
    hminusf=hminusf-delta_hf;
end
end

end

