clc;
clear;

load('damat2.mat');
X=datas(:,1);
x=1:3000;
w=linf_v1(x(1:length(X)),X);
Xx=X-x(1:length(X))'*w(2);


Y=fft(Xx);

logi=abs(Y)<7e6;
logi([1:5,end-4:end])=false;
Y(logi)=0;


% phi=linspace(0,2*pi,length(Y));
% theta=angle(Y);
% mos=cos(phi'*x+repmat(theta,[1,length(x)]));
% A=2*abs(Y(2:floor(length(Y)/2)))'*mos(2:floor(length(Y)/2),:)/length(Y)+abs(Y(1))/length(Y);

pre=repmat(ifft(Y),[2,1]);
pre=pre(1:length(x))+x'*w(2);


plot(X,'r');hold on
plot(pre,'b');hold off


% plot(length(Y)./(1:floor(length(Y)/2)),abs(Y(1:floor(length(Y)/2))));
% axis([2,400,0,1.2e7]);
