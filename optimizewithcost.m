function [ xpf ypf hpf cost hplusf hminusf] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment)
[xp,yp,hp,dist,hplus,hminus]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);

[xpf,ypf,hpf,cost]= descentwithcost(x,y,h,dhdx,dhdy,xp,yp,g,C,V,cg,cycles);
hplusf=0;
hminusf=0;
for ii=2:length(xpf)
delta_hf=hpf(ii)-hpf(ii-1);
if delta_hf>0
    hplusf=hplusf+delta_hf;
end
if delta_hf<0
    hminusf=hminusf-delta_hf;
end
end
