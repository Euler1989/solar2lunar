clc;
clear;


rep_N=12;

save('net.mat','rep_N');

load('damat3.mat');




inputs = datas(:,2:end)';
targets = datas(:,1)';
logi1=inputs(4,:)>0;
logi2=inputs(6,:)>0;
logi3=inputs(1,:)>2016;
logi4=targets>8e4&targets<1.1e5;
inputs=[repmat(inputs(:,logi1),[1,3]),repmat(inputs(:,logi2),[1,1]),repmat(inputs(:,logi3),[1,2]),repmat(inputs(:,logi4),[1,0]),repmat(inputs(:,end-15:end),[1,35])];
targets=[repmat(targets(:,logi1),[1,3]),repmat(targets(:,logi2),[1,1]),repmat(targets(:,logi3),[1,2]),repmat(targets(:,logi4),[1,0]),repmat(targets(:,end-15:end),[1,35])];








save('trainset.mat','inputs','targets');

% inputs=[inputs,inputs(:,datas(:,2)==2017),inputs(:,datas(:,2)==2018)];
% targets=[targets,targets(:,datas(:,2)==2017),targets(:,datas(:,2)==2018)];

% Create a Fitting Network

net = fitnet([12,4],'trainbr');
% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 0.65;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.20;
net.trainParam.max_fail = 60;
% net.trainParam.goal = 8e6;

% net.trainParam.showWindow = false; 
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'logsig';
net.layers{3}.transferFcn = 'tansig';

% Train the Network

% [Xs,Xi,Ai,Ts] = preparets(net,mat2cell(inputs,size(inputs,1),ones(1,size(inputs,2))),mat2cell(targets,size(targets,1),ones(1,size(targets,2))));

threshold='1.9e7';
i=1;j=1;
while(i<=rep_N)
    if j>36
       rep_N=i-1;
       save('net.mat','rep_N','-append');
       break 
    end
    fid = fopen('repnet.m','wt');
    fprintf(fid,'%s\n',['net_',num2str(i),' = train(net,inputs,targets);']);
    fprintf(fid,'%s\n',['disp(perform(net_',num2str(i),',targets, net_',num2str(i),'(inputs)));']);
    fprintf(fid,'%s\n',['if perform(net_',num2str(i),',targets, net_',num2str(i),'(inputs))< ',threshold]);    
    fprintf(fid,'\t%s\n',['save(''net.mat'',''net_',num2str(i),''',''-append'');']);
    fprintf(fid,'\t%s\n','i=i+1;');    
    fprintf(fid,'\t%s\n',['clear(''net_',num2str(i),''');']);
    fprintf(fid,'%s\n','end');
    fclose(fid);
    run('repnet.m');    
    j=j+1;
end


% [Xs,Xi,Ai,Ts] = preparets(net,mat2cell(inputs,size(inputs,1),ones(1,size(inputs,2))),mat2cell(targets,size(targets,1),ones(1,size(targets,2))));
% net = train(net,Xs,Ts,Xi,Ai);
% % view(net)
% Y = net(Xs,Xi,Ai);
% perf = perform(net,Ts,Y);
% disp(perf)
% net_1=net;
% save('net.mat','rep_N','-append');
% save('net.mat','net_1','-append');