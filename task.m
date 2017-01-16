clear all;
close all;
clc;
format long;
name='Jiacheng Liu';
id='A99075279';

%task 1A
load ProjectTerrain.mat
V=0.01/1000;
h=T/1000;
%Task 1A: Compute the Direct Path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[xp_direct,yp_direct,hp_direct,dist_1A,hplus_1A,hminus_1A]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
time_1A=dist_1A/V;
%plot 3d
figure(1);
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30);
 plot3(yp_direct,xp_direct,hp_direct,'-m','LineWidth',4);
 legend('Task 1A: Compute the Direct Path','direct path');
xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
 
 %plot 2d
dist_directa(1)=0;
 for ii=2:length(xp_direct)
dist_directa(ii)=dist_directa(ii-1)+sqrt((xp_direct(ii)-xp_direct(ii-1)).^2+(yp_direct(ii)-yp_direct(ii-1)).^2);
end
 figure(11)
  set(gca,'FontSize',20)
 plot(dist_directa,hp_direct);
 legend('Task 1D: Along Track Elevation for the Direct Path with horizontal distance')
 xlabel('horizontal distance km');
 ylabel('elevation km');
 
 
dist_directb(1)=0;
 for ii=2:length(xp_direct)
dist_directb(ii)=dist_directb(ii-1)+sqrt((xp_direct(ii)-xp_direct(ii-1)).^2+(yp_direct(ii)-yp_direct(ii-1)).^2+(hp_direct(ii)-hp_direct(ii-1)).^2);
 end

figure(12)
  set(gca,'FontSize',20)
 plot(dist_directb,hp_direct);
 legend('Task 1D: Along Track Elevation for the Direct Path with total distance')
 xlabel('total distance km');
 ylabel('elevation km');

%Task 1B: Prescribed Path 1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1,yp_path1,hp_path1,dist_1B1,hplus_1B1,hminus_1B1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
time_1B1=dist_1B1/V;
%plot 2d
dist_path1a(1)=0;
 for ii=2:length(xp_path1)
dist_path1a(ii)=dist_path1a(ii-1)+sqrt((xp_path1(ii)-xp_path1(ii-1)).^2+(yp_path1(ii)-yp_path1(ii-1)).^2);
end
 figure(13)
 set(gca,'FontSize',20)
 plot(dist_path1a,hp_path1);
  legend('Task 1D: Along Track Elevation for the Path1 with horizontal distance')
 xlabel('horizontal distance km');
 ylabel('elevation km');
 
 
dist_path1b(1)=0;
 for ii=2:length(xp_path1)
dist_path1b(ii)=dist_path1b(ii-1)+sqrt((xp_path1(ii)-xp_path1(ii-1)).^2+(yp_path1(ii)-yp_path1(ii-1)).^2+(hp_path1(ii)-hp_path1(ii-1)).^2);
 end

figure(14)
set(gca,'FontSize',20)
 plot(dist_path1b,hp_path1);
   legend('Task 1D: Along Track Elevation for the Path1 with total distance')
 xlabel('total distance km');
 ylabel('elevation km');

%plot 3d
figure(2);
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30);
 plot3(yp_path1,xp_path1,hp_path1,'-m','LineWidth',4);
 xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('Task 1A: Compute the Path1','path1');

%Task 1B: Prescribed Path 2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
[xp_path2,yp_path2,hp_path2,dist_1B2,hplus_1B2,hminus_1B2]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
time_1B2=dist_1B2/V;
%plot 3d
figure(3);
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30);
 plot3(yp_path2,xp_path2,hp_path2,'-m','LineWidth',4);
 xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('Task 1A: Compute the Path2','path2');
 %plot 2d
dist_path2a(1)=0;
 for ii=2:length(xp_path2)
dist_path2a(ii)=dist_path2a(ii-1)+sqrt((xp_path2(ii)-xp_path2(ii-1)).^2+(yp_path2(ii)-yp_path2(ii-1)).^2);
end
 figure(15)
 set(gca,'FontSize',20)
 plot(dist_path2a,hp_path2);
   legend('Task 1D: Along Track Elevation for the Path2 with horizontal distance')
 xlabel('horizontal distance km');
 ylabel('elevation km');
 
 
dist_path2b(1)=0;
 for ii=2:length(xp_path2)
dist_path2b(ii)=dist_path2b(ii-1)+sqrt((xp_path2(ii)-xp_path2(ii-1)).^2+(yp_path2(ii)-yp_path2(ii-1)).^2+(hp_path2(ii)-hp_path2(ii-1)).^2);
 end

figure(16)
set(gca,'FontSize',20)
 plot(dist_path2b,hp_path2);
   legend('Task 1D: Along Track Elevation for the Path2 with total distance')
 xlabel('total distance km');
 ylabel('elevation km');

%Task 1B: Prescribed Path 3
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[xp_path3,yp_path3,hp_path3,dist_1B3,hplus_1B3,hminus_1B3]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment);
time_1B3=dist_1B3/V;
%plot 3d
figure(4);
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30);
 plot3(yp_path3,xp_path3,hp_path3,'-m','LineWidth',4);
 xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('Task 1A: Compute the Path3','path3');
%plot 2d
dist_path3a(1)=0;
 for ii=2:length(xp_path3)
dist_path3a(ii)=dist_path3a(ii-1)+sqrt((xp_path3(ii)-xp_path3(ii-1)).^2+(yp_path3(ii)-yp_path3(ii-1)).^2);
end
 figure(17)
 set(gca,'FontSize',20)
 plot(dist_path3a,hp_path3);
   legend('Task 1D: Along Track Elevation for the Path3 with horizontal distance')
 xlabel('horizontal distance km');
 ylabel('elevation km');
 
 
dist_path3b(1)=0;
 for ii=2:length(xp_path3)
dist_path3b(ii)=dist_path3b(ii-1)+sqrt((xp_path3(ii)-xp_path3(ii-1)).^2+(yp_path3(ii)-yp_path3(ii-1)).^2+(hp_path3(ii)-hp_path3(ii-1)).^2);
 end

figure(18)
set(gca,'FontSize',20)
 plot(dist_path3b,hp_path3);
 legend('Task 1D: Along Track Elevation for the Path3 with total distance')
 xlabel('total distance km');
 ylabel('elevation km');

% make table 

% contour arrow
figure(99)
[dhdx dhdy]=calc_gradients(x,y,h);
contour(y,x,h);
hold on
quiver(y,x,-dhdy,-dhdx);
legend('arrows to a surface or contour plot in the direction of grad(h)');
xlabel('arrow for the grad(h) along y');
ylabel('arrow for the grad(h) along x');
set(gca,'FontSize',50);

%max.min(h)
%direct
max_directo=max(hp_direct);
min_directo=min(hp_direct);
%path1
max_path1o=max(hp_path1);
min_path1o=min(hp_path1);
%path2
max_path2o=max(hp_path2);
min_path2o=min(hp_path2);
%path3
max_path3o=max(hp_path3);
min_path3o=min(hp_path3);





               
               
%task1:Re-compute the paths with 200%, 50% and 25% and 10% of the points per segment and discuss the difference.
k1=2;
    %direct path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[xp_directa,yp_directa,hp_directa,dist_dik1,hplus_dik1,hminus_dik1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k1);
time_dik1=dist_dik1/V;
minhdik1=min(hp_directa);
maxhdik1=max(hp_directa);
%Task 1B: Prescribed Path 1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1a,yp_path1a,hp_path1a,dist_1k1,hplus_1k1,hminus_1k1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k1);
time_1k1=dist_1k1/V;
minh1k1=min(hp_path1a);
maxh1k1=max(hp_path1a);


%Task 1B: Prescribed Path 2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
[xp_path2a,yp_path2a,hp_path2a,dist_2k1,hplus_2k1,hminus_2k1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k1);
time_2k1=dist_2k1/V;
minh2k1=min(hp_path2a);
maxh2k1=max(hp_path2a);

%Task 1B: Prescribed Path 3
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[xp_path3a,yp_path3a,hp_path3a,dist_3k1,hplus_3k1,hminus_3k1]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k1);
time_3k1=dist_3k1/V;
minh3k1=min(hp_path3a);
maxh3k1=max(hp_path3a);


k2=0.5;
    %direct path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[xp_directb,yp_directb,hp_directb,dist_dik2,hplus_dik2,hminus_dik2]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k2);
time_dik2=dist_dik2/V;
minhdik2=min(hp_directb);
maxhdik2=max(hp_directb);
%Task 1B: Prescribed Path 1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1b,yp_path1b,hp_path1b,dist_1k2,hplus_1k2,hminus_1k2]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k2)
time_1k2=dist_1k2/V;
minh1k2=min(hp_path1b);
maxh1k2=max(hp_path1b);

%Task 1B: Prescribed Path 2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
[xp_path2b,yp_path2b,hp_path2b,dist_2k2,hplus_2k2,hminus_2k2]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k2);
time_2k2=dist_2k2/V;
minh2k2=min(hp_path2b);
maxh2k2=max(hp_path2b);

%Task 1B: Prescribed Path 3
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[xp_path3b,yp_path3b,hp_path3b,dist_3k2,hplus_3k2,hminus_3k2]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k2);
time_3k2=dist_3k2/V;
minh3k2=min(hp_path3b);
maxh3k2=max(hp_path3b);

k3=0.25;

 %direct path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[xp_directb,yp_directb,hp_directb,dist_dik3,hplus_dik3,hminus_dik3]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k3);
time_dik3=dist_dik3/V;
minhdik3=min(hp_directb);
maxhdik3=max(hp_directb);
%Task 1B: Prescribed Path 1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1b,yp_path1b,hp_path1b,dist_1k3,hplus_1k3,hminus_1k3]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k3)
time_1k3=dist_1k3/V;
minh1k3=min(hp_path1b);
maxh1k3=max(hp_path1b);


%Task 1B: Prescribed Path 2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
[xp_path2b,yp_path2b,hp_path2b,dist_2k3,hplus_2k3,hminus_2k3]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k3);
time_2k3=dist_2k3/V;
minh2k3=min(hp_path2b);
maxh2k3=max(hp_path2b);

%Task 1B: Prescribed Path 3
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[xp_path3b,yp_path3b,hp_path3b,dist_3k3,hplus_3k3,hminus_3k3]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k3);
time_3k3=dist_3k3/V;
minh3k3=min(hp_path3b);
maxh3k3=max(hp_path3b);

k4=0.1;
 %direct path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[xp_directb,yp_directb,hp_directb,dist_dik4,hplus_dik4,hminus_dik4]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k4);
time_dik4=dist_dik4/V;
minhdik4=min(hp_directb);
maxhdik4=max(hp_directb);
%Task 1B: Prescribed Path 1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[xp_path1b,yp_path1b,hp_path1b,dist_1k4,hplus_1k4,hminus_1k4]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k4);
time_1k4=dist_1k4/V;
minh1k4=min(hp_path1b);
maxh1k4=max(hp_path1b);


%Task 1B: Prescribed Path 2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
[xp_path2b,yp_path2b,hp_path2b,dist_2k4,hplus_2k4,hminus_2k4]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k4);
time_2k4=dist_2k4/V;
minh2k4=min(hp_path2b);
maxh2k4=max(hp_path2b);

%Task 1B: Prescribed Path 3
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[xp_path3b,yp_path3b,hp_path3b,dist_3k4,hplus_3k4,hminus_3k4]=computepath(xs,ys,xe,ye,nwp,wp,x,y,h,segment*k4);
time_3k4=dist_3k4/V;
minh3k4=min(hp_path3b);
maxh3k4=max(hp_path3b);


% tabulating data







%task2A
load ProjectTerrain.mat
h=T/1000;
C=1/20000;
V=0.01;
g=3.711;
%direct path
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
cost_pathdirect= compute_cost( C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp );

%path1
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
cost_path1= compute_cost( C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp );

%path2
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ]= getProjectInput( 'path2.ini' );
cost_path2= compute_cost( C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp);

%path3
n=100;
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
cost_path3= compute_cost( C,V,g,x,y,h,xs,xe,ys,ye,segment,nwp,wp);


%task 2B



cycles=500;
%direct path
%with flag on
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[dhdx dhdy]=calc_gradients(x,y,h);
 xp=linspace(xs,xe,segment(1));
 yp=linspace(ys,ye,segment(1));
%with flug on
cg=1;
[ xdirect_op ydirect_op hdirect_op cost_pathdirecton hplusdirectop,hminusdirectop] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment);
%with flag off
cg=0;
[xdirect_nop ydirect_nop hdirect_nop cost_pathdirectoff]=descentwithcost(x,y,h,dhdx,dhdy,xp,yp,g,C,V,cg,cycles);


%plot Cost v. Optimization cycless for the Direct Path
cycles=1:500;
figure(40)
plot(cycles,cost_pathdirecton,cycles,cost_pathdirectoff);
xlabel('cost [km]','FontSize',20);
ylabel('optimization cycles[km]','FontSize',20);
legend('conjugate gradient','steepest descent');




%task 2C:repeat B for path1
cycles=500;
%path 1
%with flag on
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[dhdx dhdy]=calc_gradients(x,y,h);
%with flug on
cg=1;

[ xpath1_op ypath1_op hpath1_op cost_path1on hplus1op,hminus1op] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment);
%with flag off
cg=0;
[ xpath1_nop ypath1_nop hpath1_nop cost_path1off] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment );

%plot Cost v. Optimization cycles 
cycles=1:500;
figure(41)
plot(cycles,cost_path1on,cycles,cost_path1off);
xlabel('cost [km]','FontSize',20);
ylabel('optimization cycles[km]','FontSize',20);
legend('conjugate gradient','steepest descent');

%task 2C:repeat B for path2
cycles=500;
%path 2
%with flag on
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path2.ini' );
[dhdx dhdy]=calc_gradients(x,y,h);
%with flug on
cg=1;

[ xpath2_op ypath2_op hpath2_op cost_path2on hplus2op,hminus2op] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment);
%with flag off
cg=0;
[ xpath2_nop ypath2_nop hpath2_nop cost_path2off] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment );

%plot Cost v. Optimization cycles 
cycles=1:500;
figure(42)
plot(cycles,cost_path1on,cycles,cost_path1off);
xlabel('cost [km]','FontSize',20);
ylabel('optimization cycles[km]','FontSize',20);
legend('conjugate gradient','steepest descent');

%task 2C:repeat B for path3
cycles=500;
%path 3
%with flag on
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[dhdx dhdy]=calc_gradients(x,y,h);
%with flug on
cg=1;

[ xpath3_op ypath3_op hpath3_op cost_path3on hplus3op,hminus3op] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment);

%with flag off
cg=0;
[ xpath3_nop ypath3_nop hpath3_nop cost_path3off] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment );

%plot Cost v. Optimization cycles 
cycles=1:500;
figure(43)
plot(cycles,cost_path3on,cycles,cost_path3off);
xlabel('cost [km]','FontSize',20);
ylabel('optimization cycles[km]','FontSize',20);
legend('conjugate gradient','steepest descent');






%task 2D for along track path
cycles=500;
cg=1;
%direct path
figure(30)
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30)
 plot3(ydirect_op,xdirect_op,hdirect_op,'-r',yp_direct,xp_direct,hp_direct,'-b','LineWidth',2);
xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('direct path','optimized path','original path');


%path 1
figure(31)
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30)
 plot3(ypath1_op, xpath1_op, hpath1_op,'-r',yp_path1, xp_path1, hp_path1,'-b','LineWidth',2);
xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('path1','optimized path','original path');
%path 2
figure(32)
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30)
 plot3(ypath2_op ,xpath2_op ,hpath2_op,'-r',yp_path2, xp_path2, hp_path2,'-b','LineWidth',2);
xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('path2','non','non','optimized path','original path');
%path 3
figure(33)
 surf(y,x,h);
 hold on
 shading interp;
 set(gca,'FontSize',30)
 plot3(ypath3_op, xpath3_op, hpath3_op,'-r',yp_path3, xp_path3, hp_path3,'-b','LineWidth',2);
xlabel('y axis km');
ylabel('x axis km');
zlabel('elevation km');
legend('path3','optimized path','original path');




%Task 2C-2: Distance versus Elevation 
%Direct path
distdirect_op(1)=0;
for ii=2:length(xdirect_op)
distdirect_op(ii)=distdirect_op(ii-1)+sqrt((xdirect_op(ii)-xdirect_op(ii-1)).^2+(ydirect_op(ii)-ydirect_op(ii-1)).^2+(hdirect_op(ii)-hdirect_op(ii-1)).^2);
end
 figure(21)
 plot(distdirect_op,hdirect_op,dist_directb,hp_direct);
 ylabel('Elevation [km]');
 xlabel('Total distance traveled [km]');
 legend('optimized','original');
 set(gca,'FontSize',30)
 

%path1
distpath1_op(1)=0;
for ii=2:length(xpath1_op)
distpath1_op(ii)=distpath1_op(ii-1)+sqrt((xpath1_op(ii)-xpath1_op(ii-1)).^2+(ypath1_op(ii)-ypath1_op(ii-1)).^2+(hpath1_op(ii)-hpath1_op(ii-1)).^2);
end
 figure(22)
 plot(distpath1_op,hpath1_op,dist_path1b,hp_path1);
 ylabel('Elevation [km]');
 xlabel('Total distance traveled [km]');
 legend('optimized','original');
 set(gca,'FontSize',30)
 
 %path2
 distpath2_op(1)=0;
for ii=2:length(xpath2_op)
distpath2_op(ii)=distpath2_op(ii-1)+sqrt((xpath2_op(ii)-xpath2_op(ii-1)).^2+(ypath2_op(ii)-ypath2_op(ii-1)).^2+(hpath2_op(ii)-hpath2_op(ii-1)).^2);
end
 figure(23)
 plot(distpath2_op,hpath2_op,dist_path2b,hp_path2);
ylabel('Elevation [km]');
 xlabel('Total distance traveled [km]');
legend('optimized','original');
 set(gca,'FontSize',30)
 
 %path3
 distpath3_op(1)=0;
for ii=2:length(xpath3_op)
distpath3_op(ii)=distpath3_op(ii-1)+sqrt((xpath3_op(ii)-xpath3_op(ii-1)).^2+(ypath3_op(ii)-ypath3_op(ii-1)).^2+(hpath3_op(ii)-hpath3_op(ii-1)).^2);
end
 figure(24)
 plot(distpath3_op,hpath3_op,dist_path3b,hp_path3);
ylabel('Elevation [km]');
 xlabel('Total distance traveled [km]');
 legend('optimized','original');
 set(gca,'FontSize',30)
 
 %Re-compute the optimized paths with 50% and 25% and 10% of the points
%per  segment  and  discuss  the  differences  observed
[dhdx dhdy]=calc_gradients(x,y,h);
cycles=500;

k1=0.5;
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[ xdirect_k1 ydirect_k1 hdirect_k1 cost_directk1] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k1);

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[ xpath1_k1 ypath1_k1 hpath1_k1 cost_path1k1] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k1 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path2.ini' );
[ xpath2_k1 ypath2_k1 hpath2_k1 cost_path2k1] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k1 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[ xpath3_k1 ypath3_k1 hpath3_k1 cost_path3k1] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k1 );

k2=0.25;
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[ xdirect_k2 ydirect_k2 hdirect_k2 cost_directk2] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k2);

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[ xpath1_k2 ypath1_k2 hpath1_k2 cost_path1k2] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k2 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path2.ini' );
[ xpath2_k2 ypath2_k2 hpath2_k2 cost_path2k2] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k2 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[ xpath3_k2 ypath3_k2 hpath3_k2 cost_path3k2] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k2 );

k3=0.1;
[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'direct_path.ini' );
[ xdirect_k3 ydirect_k3 hdirect_k3 cost_directk3] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k3);

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path1.ini' );
[ xpath1_k3 ypath1_k3 hpath1_k3 cost_path1k3] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k3 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path2.ini' );
[ xpath2_k3 ypath2_k3 hpath2_k3 cost_path2k3] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k3 );

[ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( 'path3.ini' );
[ xpath3_k3 ypath3_k3 hpath3_k3 cost_path3k3] =optimizewithcost( x,y,h,dhdx,dhdy,g,C,V,cg,cycles,nwp,wp,xs,ys,xe,ye,segment*k3 );


 

%Task 2B:Compare  the  cost  on  the  same  path  with  250  initial  points  and
%a  constant dmax
xp=linspace(xs,xe,50);
yp=linspace(ys,ye,50);
refine=0.991;
dmax_ini=0.2;
cycles=100;
%modified
[xp250,yp250,hp250,cost_250] = descentop(x,y,h,dhdx,dhdy,xp,yp,g,C,V,cg,cycles,refine,dmax_ini);
cost_250=cost_250(end);
%constant dmax
[xpc,ypc,hpc,costc] = descentwithcost(x,y,h,dhdx,dhdy,xp,yp,g,C,V,cg,cycles);
costc=costc(end);

%make table




