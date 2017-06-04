function [cell]=readChordtxt(file)

f=fopen(file);
data=textscan(f,'%f %f %s');
col1=data{1,1};
col1=num2cell(col1);
col2=data{1,2};
col2=num2cell(col2);
col3=data{1,3};

cell(:,1)={col1{:,1}};
cell(:,2)={col2{:,1}};
cell(:,3)={col3{:,1}};

fclose(f);

end