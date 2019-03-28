clc;
clear;

load('damat2.mat');
days=zeros(size(datas,1),9);

for i=2014:2019
    logi=datas(:,2)==i;
    if mod(i,400)==0||(mod(i,4)==0 && mod(i,100)~=0)
        b=[1:59,59.5,60:365];
        days(logi,1)=1:sum(logi);        
    else
        days(logi,1)=1:sum(logi);
    end
end

days(datas(:,5)>5,2)=datas(datas(:,5)>5,5)-5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2014
days((datas(:,2)==2014)&(datas(:,3)==1)&(datas(:,4)==1),3)=1;

days((datas(:,2)==2014)&(datas(:,3)==1)&(datas(:,4)==31),4)=1;
days((datas(:,2)==2014)&(datas(:,3)==2)&(datas(:,4)<7),4)=2:7;
days((datas(:,2)==2014)&(datas(:,3)==1)&(datas(:,4)==26),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==2)&(datas(:,4)==8),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==2)&(datas(:,4)==1),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==2)&(datas(:,4)==2),2)=0;

days((datas(:,2)==2014)&(datas(:,3)==4)&(datas(:,4)>4&datas(:,4)<8),5)=1:3;
days((datas(:,2)==2014)&(datas(:,3)==4)&(datas(:,4)==5),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==4)&(datas(:,4)==6),2)=0;

days((datas(:,2)==2014)&(datas(:,3)==5)&(datas(:,4)<4),6)=1:3;
days((datas(:,2)==2014)&(datas(:,3)==5)&(datas(:,4)==3),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==5)&(datas(:,4)==4),2)=0;

days((datas(:,2)==2014)&(datas(:,3)==5)&(datas(:,4)==31),7)=1;
days((datas(:,2)==2014)&(datas(:,3)==6)&(datas(:,4)<3),7)=2:3;
days((datas(:,2)==2014)&(datas(:,3)==5)&(datas(:,4)==31),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==6)&(datas(:,4)==1),2)=0;

days((datas(:,2)==2014)&(datas(:,3)==9)&(datas(:,4)>5&datas(:,4)<9),8)=1:3;
days((datas(:,2)==2014)&(datas(:,3)==9)&(datas(:,4)==6),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==9)&(datas(:,4)==7),2)=0;

days((datas(:,2)==2014)&(datas(:,3)==10)&(datas(:,4)<8),9)=1:7;
days((datas(:,2)==2014)&(datas(:,3)==9)&(datas(:,4)==28),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==10)&(datas(:,4)==11),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==10)&(datas(:,4)==4),2)=0;
days((datas(:,2)==2014)&(datas(:,3)==10)&(datas(:,4)==5),2)=0;

% 2015
days((datas(:,2)==2015)&(datas(:,3)==1)&(datas(:,4)<4),3)=1:3;
days((datas(:,2)==2015)&(datas(:,3)==1)&(datas(:,4)==3),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==1)&(datas(:,4)==4),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==2)&(datas(:,4)>17&datas(:,4)<25),4)=1:7;
days((datas(:,2)==2015)&(datas(:,3)==2)&(datas(:,4)==15),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==2)&(datas(:,4)==28),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==2)&(datas(:,4)==21),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==2)&(datas(:,4)==22),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==4)&(datas(:,4)>3&datas(:,4)<7),5)=1:3;
days((datas(:,2)==2015)&(datas(:,3)==4)&(datas(:,4)==5),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==4)&(datas(:,4)==6),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==5)&(datas(:,4)<4),6)=1:3;
days((datas(:,2)==2015)&(datas(:,3)==5)&(datas(:,4)==2),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==5)&(datas(:,4)==3),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==6)&(datas(:,4)>19&datas(:,4)<23),7)=1:3;
days((datas(:,2)==2015)&(datas(:,3)==6)&(datas(:,4)==20),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==6)&(datas(:,4)==21),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==9)&(datas(:,4)>25&datas(:,4)<28),8)=1:2;
days((datas(:,2)==2015)&(datas(:,3)==9)&(datas(:,4)==26),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==9)&(datas(:,4)==27),2)=0;

days((datas(:,2)==2015)&(datas(:,3)==10)&(datas(:,4)<8),9)=1:7;
days((datas(:,2)==2015)&(datas(:,3)==10)&(datas(:,4)==10),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==10)&(datas(:,4)==3),2)=0;
days((datas(:,2)==2015)&(datas(:,3)==10)&(datas(:,4)==4),2)=0;

% 2016
days((datas(:,2)==2016)&(datas(:,3)==1)&(datas(:,4)<4),3)=1:3;
days((datas(:,2)==2016)&(datas(:,3)==1)&(datas(:,4)==2),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==1)&(datas(:,4)==3),2)=0;

days((datas(:,2)==2016)&(datas(:,3)==2)&(datas(:,4)>6&datas(:,4)<14),4)=1:7;
days((datas(:,2)==2016)&(datas(:,3)==2)&(datas(:,4)==6),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==2)&(datas(:,4)==14),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==2)&(datas(:,4)==7),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==2)&(datas(:,4)==13),2)=0;

days((datas(:,2)==2016)&(datas(:,3)==4)&(datas(:,4)>1&datas(:,4)<5),5)=1:3;
days((datas(:,2)==2016)&(datas(:,3)==4)&(datas(:,4)==5),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==4)&(datas(:,4)==6),2)=0;

days((datas(:,2)==2016)&(datas(:,3)==4)&(datas(:,4)==30),6)=1;
days((datas(:,2)==2016)&(datas(:,3)==5)&(datas(:,4)<3),6)=2:3;
days((datas(:,2)==2016)&(datas(:,3)==4)&(datas(:,4)==30),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==5)&(datas(:,4)==1),2)=0;


days((datas(:,2)==2016)&(datas(:,3)==6)&(datas(:,4)>8&datas(:,4)<12),7)=1:3;
days((datas(:,2)==2016)&(datas(:,3)==6)&(datas(:,4)==11),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==6)&(datas(:,4)==12),2)=0;

days((datas(:,2)==2016)&(datas(:,3)==9)&(datas(:,4)>14&datas(:,4)<18),8)=1:3;
days((datas(:,2)==2016)&(datas(:,3)==9)&(datas(:,4)==17),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==9)&(datas(:,4)==18),2)=0;

days((datas(:,2)==2016)&(datas(:,3)==10)&(datas(:,4)<8),9)=1:7;
days((datas(:,2)==2016)&(datas(:,3)==10)&(datas(:,4)==8),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==10)&(datas(:,4)==9),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==10)&(datas(:,4)==1),2)=0;
days((datas(:,2)==2016)&(datas(:,3)==10)&(datas(:,4)==2),2)=0;

% 2017
days((datas(:,2)==2016)&(datas(:,3)==12)&(datas(:,4)==31),3)=1;
days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)<3),3)=2:3;
days((datas(:,2)==2016)&(datas(:,3)==12)&(datas(:,4)==31),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)==1),2)=0;

days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)>26),4)=1:5;
days((datas(:,2)==2017)&(datas(:,3)==2)&(datas(:,4)<3),4)=6:7;
days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)==22),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==2)&(datas(:,4)==4),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)==28),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==1)&(datas(:,4)==29),2)=0;

days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)>1&datas(:,4)<5),5)=1:3;
days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)==1),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)==2),2)=0;

days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)>28),6)=1:2;
days((datas(:,2)==2017)&(datas(:,3)==5)&(datas(:,4)==1),6)=3;
days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)==30),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==4)&(datas(:,4)==29),2)=0;

days((datas(:,2)==2017)&(datas(:,3)==5)&(datas(:,4)>27&datas(:,4)<31),7)=1:3;
days((datas(:,2)==2017)&(datas(:,3)==5)&(datas(:,4)==27),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==5)&(datas(:,4)==28),2)=0;

days((datas(:,2)==2017)&(datas(:,3)==10)&(datas(:,4)<9),9)=1:8;
days((datas(:,2)==2017)&(datas(:,3)==10)&(datas(:,4)==1),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==10)&(datas(:,4)==7),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==10)&(datas(:,4)==8),2)=0;
days((datas(:,2)==2017)&(datas(:,3)==9)&(datas(:,4)==30),2)=0;

% 2018
days((datas(:,2)==2017)&(datas(:,3)==12)&(datas(:,4)>29),3)=1:2;
days((datas(:,2)==2018)&(datas(:,3)==1)&(datas(:,4)<4),3)=3;
days((datas(:,2)==2017)&(datas(:,3)==12)&(datas(:,4)>29),2)=0;

days((datas(:,2)==2018)&(datas(:,3)==2)&(datas(:,4)>14&datas(:,4)<22),4)=1:7;
days((datas(:,2)==2018)&(datas(:,3)==2)&(datas(:,4)==11),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==2)&(datas(:,4)==24),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==2)&(datas(:,4)==17),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==2)&(datas(:,4)==18),2)=0;

days((datas(:,2)==2018)&(datas(:,3)==4)&(datas(:,4)>4&datas(:,4)<8),5)=1:3;
days((datas(:,2)==2018)&(datas(:,3)==4)&(datas(:,4)==7),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==4)&(datas(:,4)==8),2)=0;

days((datas(:,2)==2018)&(datas(:,3)==4)&(datas(:,4)>28),6)=1:2;
days((datas(:,2)==2018)&(datas(:,3)==5)&(datas(:,4)==1),6)=3;
days((datas(:,2)==2018)&(datas(:,3)==4)&(datas(:,4)>28),2)=0;


days((datas(:,2)==2018)&(datas(:,3)==6)&(datas(:,4)>15&datas(:,4)<19),7)=1:3;
days((datas(:,2)==2018)&(datas(:,3)==6)&(datas(:,4)==16),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==6)&(datas(:,4)==17),2)=0;

days((datas(:,2)==2018)&(datas(:,3)==9)&(datas(:,4)>21&datas(:,4)<25),8)=1:3;
days((datas(:,2)==2018)&(datas(:,3)==9)&(datas(:,4)==22),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==9)&(datas(:,4)==23),2)=0;

days((datas(:,2)==2018)&(datas(:,3)==10)&(datas(:,4)<8),9)=1:7;
days((datas(:,2)==2018)&(datas(:,3)==9)&(datas(:,4)==29),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==9)&(datas(:,4)==30),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==10)&(datas(:,4)==6),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==10)&(datas(:,4)==7),2)=0;

% 2019
days((datas(:,2)==2018)&(datas(:,3)==12)&(datas(:,4)>29),3)= 1:2;
days((datas(:,2)==2019)&(datas(:,3)==1)&(datas(:,4)==1),3)= 3;
days((datas(:,2)==2018)&(datas(:,3)==12)&(datas(:,4)==30),2)=0;
days((datas(:,2)==2018)&(datas(:,3)==12)&(datas(:,4)==29),2)=0;

days((datas(:,2)==2019)&(datas(:,3)==2)&(datas(:,4)>3&datas(:,4)<11),4)=1:7;
days((datas(:,2)==2019)&(datas(:,3)==2)&(datas(:,4)==2),2)=0;
days((datas(:,2)==2019)&(datas(:,3)==2)&(datas(:,4)==3),2)=0;
days((datas(:,2)==2019)&(datas(:,3)==2)&(datas(:,4)==9),2)=0;
days((datas(:,2)==2019)&(datas(:,3)==2)&(datas(:,4)==10),2)=0;

datas=[datas(:,1:2),days,datas(:,8:9)];
save('damat3.mat','datas')


