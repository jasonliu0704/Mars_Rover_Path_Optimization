function [a,parameter,xs,ys,hs] = block( x,y,h,constrain,xi,yi,Ti )
%xi,yi,hi are initial terrian data
%x,y are path data needed to be modified
[a parameter xc yc r n]=cons(constrain);
for c=1:n
for ii=1:length(x)
if (((x(ii)-xc(c))^2+(y(ii)-yc(c))^2)<r(c)^2)
    if y(ii)<yc(c)
xs(ii)=sqrt(r(c)^2-(y(ii)-yc(c))^2)+xc(c);
ys(ii)=y(ii);
end
end
end
xs(xs==0)=[];
ys(ys==0)=[];
for kk=1:length(xs)
    if xs(kk)~=xi(kk)
hs(kk)=bilinear(xi,yi,Ti,xs(kk),ys(kk)); 
    end
end
hs(hs==0)=[];
end
end




function[a Parameter xc yc r n]=cons(constrain)
%This function get output data from the constrain file
fid=fopen(constrain,'r');
a=textscan(fid,'%s','Delimiter','\n');
n=str2num(a{1}{4});
Parameter=zeros(n,3);
    for k=1:n
    Parameter(k,:)=str2num(a{1}{end-k});
    end
xc=Parameter(:,1);
yc=Parameter(:,2);
r=Parameter(:,3);
closeresult=fclose(fid);
if closeresult~=0
    disp('error closing file');
end
end


