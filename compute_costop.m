function [ cost] = compute_costop( dhdx,dhdy,cg,cycles,C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp )
for kk=0:cycles
[ xp yp hp ] =optimize( x,y,h,dhdx,dhdy,g,C,V,cg,kk,nwp,wp,xs,ys,xe,ye,segment );
for ii=2:length(xp)
d(ii)=sqrt((xp(ii)-xp(ii-1)).^2+(yp(ii)-yp(ii-1)).^2+(hp(ii)-hp(ii-1)).^2);
end
for ii=2:length(hp)-1
    W(ii)=1+((C*2*g*hp(ii))^2)/((V^2)^2);
    J(ii)=sqrt(((d(ii)+d(ii+1))*W(ii)));
end
cost(kk)=sum(J);
end
end
