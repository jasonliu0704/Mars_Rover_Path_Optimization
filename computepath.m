function [xpf,ypf,hpf,distf,hplusf,hminusf]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment)
if nwp==0
    [xpf,ypf,hpf,distf,hplusf,hminusf]=calc_task1( x,y,h,xs,xe,ys,ye,segment(1));
else
wp=[xs ys;wp;xe ye];
for ww=1:nwp+1
[xp{ww},yp{ww},hp{ww},dist{ww},hplus{ww},hminus{ww}]=calc_task1( x,y,h,wp(ww,1),wp(ww+1,1),wp(ww,2),wp(ww+1,2),segment(ww));
end
xpf=cell2mat(xp);
ypf=cell2mat(yp);
hpf=cell2mat(hp);
distf=sum(cell2mat(dist));
hplusf=sum(cell2mat(hplus));
hminusf=sum(cell2mat(hminus));
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

