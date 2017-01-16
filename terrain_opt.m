
format long;
name='Jiacheng Liu';
id='A99075279';
pathname='path1.ini';
load ProjectTerrain.mat
V=0.01/1000;
h=T/1000;
C=1/20000;
g=3.7;
cycles=50;
%Metrics for the original path: d_orig,  J_orig,  hmin_orig,  hmax_orig,  eplus_orig,  eminus_orig
%The original path:xp_orig,  yp_orig,  hp_orig
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( pathname );
[xp_orig,yp_orig,hp_orig,d_orig,eplus_orig,eminus_orig]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
hmin_orig=min(hp_orig);
hmax_orig=max(hp_orig);
[J_orig] = compute_cost( C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp );

%Metrics for the optimized  path:d_opt, J_opt, hmin_opt,  hmax_opt,  eplus_opt,  eminus_opt,
%The optimized  path:xp_opt,  yp_opt, hp_opt
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( pathname );
[dhdx dhdy]=calc_gradients(x,y,h);
cg=1;
cycle=50;
[xp_opt yp_opt hp_opt cost eplus_opt eminus_opt]=optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment );
hmin_opt=min(hp_opt);
hmax_opt=max(hp_opt);
J_opt=cost(end);

figure(888)
surf(y,x,h);
shading interp
hold on
plot3(yp_orig,xp_orig,hp_orig,yp_opt,xp_opt,hp_opt,'-b','LineWidth',3);




