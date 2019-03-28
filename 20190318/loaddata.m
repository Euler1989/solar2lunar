clc;
clear;

dataset=[];
for i=6:-1:1
    [~,data]=xlsread('.\省公司发用电汇总.xlsx',i,'A5:B370');
    pow=xlsread('.\省公司发用电汇总.xlsx',i,'E5:E370');
    tempr=xlsread('.\温度统计.xls',i,'C1:D366');
    mlen=min(size(pow,1),size(tempr,1));
    if size(data,1)==mlen
        dataset=[dataset;[data,num2cell(pow),num2cell(tempr)]];
    else
        dataset=[dataset;[data(1:mlen,:),num2cell(pow(1:mlen,:)),num2cell(tempr(1:mlen,:))]];
    end
end

save('damat.mat','dataset');

load('damat.mat');

dataset=dataset(~isnan([dataset{:,3};]),:);

datas=nan(size(dataset,1),9);
dow='一二三四五六日';

for i=1:size(dataset,1)        
    p=regexp(dataset{i,1},'/');
    datas(i,2)=str2double(dataset{i,1}(1:p(1)-1));
    datas(i,3)=str2double(dataset{i,1}(p(1)+1:p(2)-1));
    datas(i,4)=str2double(dataset{i,1}(p(2)+1:end));
    datas(i,5)=regexp(dow,dataset{i,2});
    datas(i,1)=dataset{i,3};
    datas(i,8)=dataset{i,4};
    datas(i,9)=dataset{i,5};
end

datas(1:365,2)=2014;
datas(1462:1826,2)=2018;
datas(1827:end,2)=2019;

for i=1:size(dataset,1)
    [datas(i,6),datas(i,7)]=lunar2solar(datas(i,2),datas(i,3),datas(i,4));
end


datas(datas(:,6)>100,6)=0;
datas=datas(1:1885,:);


%%%%%%%%%%%% batch on 20190312 %%%%%%%%%%%%%
lag=[];
if ~isempty(lag)
    datas(:,10)=0;    
    for i=lag
        datas(lag(end)+1:end,10)=datas(lag(end)+1:end,10)+datas((lag(end)+1:end)-i,1);
    end
    datas(:,10)=datas(:,10)/length(lag);    
    datas=datas(lag(end)+1:end,:);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


save('damat2.mat','datas');