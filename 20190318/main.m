% run('loaddata.m');
% run('trainnet.m');

clc;
clear;

load('net.mat');
load('damat3.mat');
temp_datas=datas(end-6:end,:);

% load('trainset.mat');
% 
% preinputs=inputs(:,1128:1492);
% 
% for i=1:size(preinputs,2)
%     preinputs(7:8,i)=mean(inputs(7:8,inputs(3,:)==preinputs(3,i)&inputs(2,:)==preinputs(2,i)),2);
% end
% 
% for i=1:size(preinputs,2)
%     preinputs(1,i)= (i>334) + 2019;
%     preinputs(4,i)=mod(i+3,7)+1;
%     [preinputs(5,i),preinputs(6,i)]=lunar2solar(preinputs(1,i),preinputs(2,i),preinputs(3,i));    
% end
% 
% figure(5);
% clf(gcf);
% plot(1:length(targets),targets,'r');hold on
% 
% nets=nan(rep_N,size(preinputs,2)+size(inputs,2));
% for i=1:rep_N
%     fid = fopen('reppre.m','wt');
%     fprintf(fid,'%s\n',['nets(i,:)=net_',num2str(i),'([inputs,preinputs]);']);
%     fclose(fid);
%     run('reppre.m');    
% end
% 
% prepow=mean(nets(:,size(inputs,2)+1:end),1)';
% plot(1:length(targets),mean(nets(:,1:size(inputs,2)),1),'r');hold on
% plot(length(targets)+1:length(targets)+size(preinputs,2),prepow,'b');
% 
% 
% 
% powd=[];
% for i=6:-1:1
%     pow=xlsread('.\浙江省发用电汇总.xlsx',i,'E5:E370');
%     powd=[powd;pow];    
% end
% powd=powd(~isnan(powd));
% plot(1:length(powd),powd,'g');
%     
% hold off
% axis([0,inf,0,inf])

% datas=[2019;3;1;4];th=rand(1);tl=rand(1);

filename='输入数据.xlsx';
datasrange='A1:B31';
thrange='C1:C31';
tlrange='D1:D31';


[~,datascell]=xlsread(filename,1,datasrange);
th=xlsread(filename,1,thrange)';
tl=xlsread(filename,1,tlrange)';
datas=nan(6,size(datascell,1));
dow='一二三四五六日';
for i=1:size(datascell)
    p=regexp(datascell{i,1},'/');
    datas(1,i)=str2double(datascell{i,1}(1:p(1)-1));
    datas(2,i)=str2double(datascell{i,1}(p(1)+1:p(2)-1));
    datas(3,i)=str2double(datascell{i,1}(p(2)+1:end));
    datas(4,i)=regexp(dow,datascell{i,2});
    [datas(5,i),datas(6,i)]=lunar2solar(datas(1,i),datas(2,i),datas(3,i));
end
datas(4,datas(4,:)>5)=datas(4,datas(4,:)>5);
preinputs_pool=[datas;th;tl];
preinputs=[preinputs_pool(1,:);59+(1:size(preinputs_pool,2));[repmat([0;1;2;0;0;0;0]',[1,4]),0,1,2];zeros(7,size(preinputs_pool,2));preinputs_pool(7:8,:)];

% N_need=15;prepow=nan(1,N_need+1);prepow(1)=temp_datas(end);
% for j=2:N_need
%     preinputs=[preinputs_pool(:,j);prepow(j-1)];
%     nets=nan(rep_N,size(preinputs,2));
%     for i=1:rep_N
%         fid = fopen('reppre.m','wt');
%         fprintf(fid,'%s\n',['nets(i,:)=net_',num2str(i),'([preinputs]);']);
%         fclose(fid);
%         run('reppre.m');
%     end
%     prepow(j)=mean(nets,1);
% end
% prepow=prepow(2:end);

nets=nan(rep_N,size(preinputs,2));
for i=1:rep_N
    fid = fopen('reppre.m','wt');
    fprintf(fid,'%s\n',['nets(i,:)=net_',num2str(i),'([preinputs]);']);
    fclose(fid);
    run('reppre.m');    
end
prepow=mean(nets,1);

plot([109019,109751,104012 ,102457 ,110667 ,108027 ,108365,110024 ,110843 ,99910 ]);hold on
plot(prepow);hold off
