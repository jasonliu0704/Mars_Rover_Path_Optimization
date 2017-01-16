clear all
clc
constrain='constraints.ini';
fid=fopen(constrain,'r');
a=textscan(fid,'%s','Delimiter','\n');
closeresult=fclose(fid);
