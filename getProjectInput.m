function [ segment,TerrainFile,xs,ys,xe,ye,nwp,wp ] = getProjectInput( filename )
%This function should be called getProjectInput and take a single
%input, the project file name, project.ini. It should have multiple outputs which are: TerrainFile, StartPoint,
%EndPoint, NumWayPoints, and WayPoints (if NumWayPoints is greater than zero). StartPoint and
%EndPoint should be a 1x2 or 2x1 vector. WayPoints should be a NumWayPoints x 2 or 2 x
%NumWayPoints matrix.
wp=0;
fid=fopen(filename, 'r');
if fid == -1
disp('File open not successful')
else
a=textscan(fid,'%s','Delimiter','\n');
TerrainFile=a{1}{4};
StartPoint=str2num(a{1}{7});
EndPoint=str2num(a{1}{10});
xs=StartPoint(1);
ys=StartPoint(2);
xe=EndPoint(1);
ye=EndPoint(2);
NumWayPoints=str2num(a{1}{13});
nwp=NumWayPoints;

if (nwp~=0)
WayPoints=zeros(NumWayPoints,2);
for n=1:NumWayPoints
    WayPoints(n,:)=str2num(a{1}{n+15});
    for k=n+1:-1:1
    segment(k)=str2num(a{1}{end+1-k});
    end
end
wp=WayPoints;
else
    segment=str2num(a{1}{end});
    wp=[];
end
end

closeresult=fclose(fid);
if closeresult~=0
    disp('error closing file');
end

end

