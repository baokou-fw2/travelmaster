clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numbern=50;
AllFrame = zeros(1,numbern);                                                    %����֡������
SuccessFrame = zeros(1,numbern);                                                %���ͳɹ���֡������
SER_Nodes = zeros(1,numbern);                                                   %������
AllFrame1 = zeros(1,numbern);                                                    %����֡������
SuccessFrame1 = zeros(1,numbern);                                                %���ͳɹ���֡������
SER_Nodes1 = zeros(1,numbern);                                                   %������
ConWindow = 0;                                                              %�����ڴ���һ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������ڵ������ϵͳ���ܵ�Ӱ��
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
AllFrame2 = zeros(1,numbern);                                                   %�����ܵ�֡��
SuccessFrame2 = zeros(1,numbern);                                               %���ͳɹ���֡��
SER_Window2 = zeros(1,numbern);                                                  %������
AllFrame3 = zeros(1,numbern);                                                   %�����ܵ�֡��
SuccessFrame3 = zeros(1,numbern);                                               %���ͳɹ���֡��
SER_Window3 = zeros(1,numbern);                                                  %������
NumberNodes1 = 4;                                                          %�ڵ���һ��Ϊ4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�����������ڳ��̶�ϵͳ���ܵ�Ӱ��
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
%����ͼչʾ
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
legend({'BEB�˱�','BEB+LB�˱�'},'Location','southeast')
subplot(2,1,2);
plot(1:numbern,SER_Window2(:));
hold on
plot(1:numbern,SER_Window3(:));
box on;
grid on;
xlabel('ConWindow');
ylabel('SER');
title('CAMA_CA: ConWindow-SER');
legend({'BEB�˱�','BEB+LB�˱�'},'Location','southeast')