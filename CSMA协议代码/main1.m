clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numbern=50;
AllFrame = zeros(1,numbern);                                                    %发的帧的总数
SuccessFrame = zeros(1,numbern);                                                %发送成功的帧的数量
SER_Nodes = zeros(1,numbern);                                                   %误码率
AllFrame1 = zeros(1,numbern);                                                    %发的帧的总数
SuccessFrame1 = zeros(1,numbern);                                                %发送成功的帧的数量
SER_Nodes1 = zeros(1,numbern);                                                   %误码率
ConWindow = 0;                                                              %争用期窗口一定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%：计算节点个数对系统性能的影响
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:numbern
    [AllFrame(i) SuccessFrame(i)] = Csmaca(i,ConWindow);
     temp1=(AllFrame(i)-SuccessFrame(i))/AllFrame(i);
    [AllFrame(i) SuccessFrame(i)] = Csmaca(i,ConWindow);
     temp2=(AllFrame(i)-SuccessFrame(i))/AllFrame(i);
    [AllFrame(i) SuccessFrame(i)] = Csmaca(i,ConWindow);
     temp3=(AllFrame(i)-SuccessFrame(i))/AllFrame(i);
     SER_Nodes(i)=(temp1+temp2+temp3)/3;
end
for i=1:numbern
    [AllFrame1(i) SuccessFrame1(i)] = Csmaca2(i,ConWindow);
     temp1=(AllFrame1(i)-SuccessFrame1(i))/AllFrame1(i);
    [AllFrame1(i) SuccessFrame1(i)] = Csmaca2(i,ConWindow);
     temp2=(AllFrame1(i)-SuccessFrame1(i))/AllFrame1(i);
    [AllFrame1(i) SuccessFrame1(i)] = Csmaca2(i,ConWindow);
     temp3=(AllFrame1(i)-SuccessFrame1(i))/AllFrame1(i);
     SER_Nodes1(i)=(temp1+temp2+temp3)/3;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AllFrame2 = zeros(1,numbern);                                                   %发送总的帧数
SuccessFrame2 = zeros(1,numbern);                                               %发送成功的帧数
SER_Window2 = zeros(1,numbern);                                                  %误码率
AllFrame3 = zeros(1,numbern);                                                   %发送总的帧数
SuccessFrame3 = zeros(1,numbern);                                               %发送成功的帧数
SER_Window3 = zeros(1,numbern);                                                  %误码率
NumberNodes1 = 4;                                                          %节点数一定为4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%：计算争用期长短对系统性能的影响
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:numbern
    [AllFrame2(i) SuccessFrame2(i)] = Csmaca(NumberNodes1,i);
     temp1=(AllFrame2(i)-SuccessFrame2(i))/AllFrame2(i);
    [AllFrame2(i) SuccessFrame2(i)] = Csmaca(NumberNodes1,i);
     temp2=(AllFrame2(i)-SuccessFrame2(i))/AllFrame2(i);
    [AllFrame2(i) SuccessFrame2(i)] = Csmaca(NumberNodes1,i);
     temp3=(AllFrame2(i)-SuccessFrame2(i))/AllFrame2(i);
     SER_Window2(i)=(temp1+temp2+temp3)/3;
end
for i=1:numbern
    [AllFrame3(i) SuccessFrame3(i)] = Csmaca2(NumberNodes1,i);
     temp1=(AllFrame3(i)-SuccessFrame3(i))/AllFrame3(i);
    [AllFrame3(i) SuccessFrame3(i)] = Csmaca2(NumberNodes1,i);
     temp2=(AllFrame3(i)-SuccessFrame3(i))/AllFrame3(i);
    [AllFrame3(i) SuccessFrame3(i)] = Csmaca2(NumberNodes1,i);
     temp3=(AllFrame3(i)-SuccessFrame3(i))/AllFrame3(i);
     SER_Window3(i)=(temp1+temp2+temp3)/3;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%：画图展示
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(2,1,1);
plot(1:numbern,SER_Nodes(:));
hold on
plot(1:numbern,SER_Nodes1(:));
box on;
grid on;
xlabel('Nodes');
ylabel('SER');
title('CSMA_CA: Nodes-SER');
legend({'BEB退避','BEB+LB退避'},'Location','southeast')
subplot(2,1,2);
plot(1:numbern,SER_Window2(:));
hold on
plot(1:numbern,SER_Window3(:));
box on;
grid on;
xlabel('ConWindow');
ylabel('SER');
title('CAMA_CA: ConWindow-SER');
legend({'BEB退避','BEB+LB退避'},'Location','southeast')