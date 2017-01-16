function [ xf,yf,h] = boundary( xi,yi,hi,x,y,h)
[ xf,yf ] = refine( x,y );
for ii=1:length(xf)
    if xf(ii)~=x(ii)||yf(ii)~=y(ii)
h(ii)= bilinear(xi,yi,hi,xf(ii),yf(ii));
    end
end
end
function [ x,y ] = refine( x,y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%condition 1:restrict 0.15km from boundary
for ii=1:length(x)
    for jj=1:length(y)
if x(ii)<-4.85
    x(ii)=-4.85;
elseif x(ii)>4.85
    x(ii)=4.85;
end
if y(jj)<-4.85
    y(jj)=-4.85;
elseif y(jj)>4.85
    y(jj)=4.85;
    end
    end
end
end