clear all
clc
load ProjectTerrain
h=T/1000;
C=1/20000;
g=3.7;
cg=1;
V=0.01;
cycles=100;
constrain='constraints.ini';
[dhdx dhdy]=calc_gradients(x,y,h);
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1,yp_path1,hp_path1,dist_1B1,hplus_1B1,hminus_1B1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
[ xf,yf,Tp] = boundary( x,y,h,xp_path1,yp_path1 );
[ xf,yf,hf] = block( xf,yf,constrain,x,y,h );


figure(1)
surf(y,x,h)
hold on
shading interp
plot3(yf,xf,hf)
xlabel('y axis');
ylabel('x axis');
legend('background','path');