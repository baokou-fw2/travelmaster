clc
clear all
close all
Ndist=[4,8,16,32,64,128,256];
N=64;
k=2;
n012=zeros(5*N,4);%三列构造一个输入数组和理论输出值
for j=1:5*N
    [n012(j,1),n012(j,2),n012(j,3),n012(j,4)]=calTn(j,N);%构造帧长为N的理论输出值
end
 [nre,preGR]=grnnett(n012,N,1,5*N);
 [nre,preBP]=PSOBP(n012,N,1,5*N);%分别使用两种网络进行拟合和预测对比

%grnn_prediction_result=sim(nre,[2;3;4])
%S-ALOHA算法的吞吐量
S1=zeros(1,k*N);
S3=zeros(1,k*N);
S2=zeros(1,k*N);
for i=1:k*N
    G=i/N;%i个包除n个时隙得到平均每个时隙发送的包
    S2(1,i)=G*exp(-G);
    S1(1,i)=G*exp(-2*G);
      S3(1,i)=binopdf(1,i,1/N);%DFSA理论值

end
figure(1)%绘制三种aloha的吞吐量对比
plot(1:k*N,S1,'r')
hold on
plot(1:k*N,S2,'b')
hold on
plot(1:k*N,S3,'g')
title('aloha协议对比图')
xlabel('待发送节点数量')
ylabel('吞吐率')
legend({'纯aloha','S-aloha','DFS-aloha'},'Location','northwest')


figure(2)%使用GRNN拟合的效果图
subplot(2,1,1)
plot(1:5*N,n012(:,4)','g');
hold on 
plot(1:5*N,preGR,'*');
title('GRNN剩余包拟合预测效果图')
xlabel('待发送节点数量')
ylabel('剩余包数量')
legend({'理论值','拟合值'},'Location','northwest')
subplot(2,1,2)
plot(1:5*N,n012(:,4),'g');
hold on 
plot(1:5*N,preBP,'*');
title('BP剩余包拟合预测效果图')
xlabel('待发送节点数量')
ylabel('剩余包数量')
legend({'理论值','拟合值'},'Location','northwest')


%碰撞误码率对比
ne=100;
Pes=zeros(1,ne);
Pe=zeros(1,ne);
for i=1:ne
    Pes(i)=1-exp(-1*i/N);
    Pe(i)=1-(1-1/N)^i-((1-1/N)^(i-1))*i/N;
end
figure(3)
plot(1:ne,Pes,'g')
hold on
plot(1:ne,Pe,'r')
title('S-aloha和DFS-aloha碰撞率对比图')
xlabel('待发送节点数量')
ylabel('碰撞率')
legend({'S-aloha','DFS-aloha'},'Location','northwest')
% %时延数对比
% %n=20;%假设有20个节点参与竞争
% k=zeros(1,20);%消耗时隙数的计数器
% for n=1:20
%     i=n;%初始化剩余节点量
%     k0=1;%初始化每次消耗时隙数
% while i
%    G=i;%每次传输过后剩余节点量平均分布在某一轮读取中
%    i=i-i*G*exp(-G);%更新每次传输后剩余量
%    if i<0.1
%        i=0;
%    end
%    k0=k0+1;
% end
% k(1,n)=k0;
% end
% %GRNNdfsa仿真
% 
% pre20all=zeros(7,20);%存储所有Tn网络的输出，每一行的意义为帧长为n的情况下，上一次的剩余量为多少
% %构造理论值输出矩阵
% for i=1:4
%     N=Ndist(i);
%     n012=zeros(5*N,4);%三列构造一个输入数组和理论输出值
% for j=1:5*N
%     [n012(j,1),n012(j,2),n012(j,3),n012(j,4)]=calTn(j,N);%构造帧长为N的理论输出值
% end
% % [nre,pre20]=grnnett(n012,N);
% % pre20all(i,1:2*N)=pre20;
% end
% %进行传递
% k2=zeros(1,20);%消耗时隙数的计数器
% for n=1:20%竞争节点数
%     i=n;%剩余
%     k0=1;%第n次的计数器
%     N1=4;%初始帧长度为4
%     while i
%        if i<=1
%             i=0;
%             break
%         end
% %         i=pre20all(log2(N1),ceil(i)-1);%得到剩余量
% 
% 
%         k0=k0+1;
%         %根据本轮剩余量选择下一轮的帧长
%         if i<=4
%             N1=4;
%         elseif (5<=i)&(i<=10)
%                 N1=8;
%         elseif (11<=i)&(i<=22)
%             N1=16;
%         end
%         %判断什么时候结束
% 
%     end
%     k2(1,n)=k0;
% end
% figure(3)
% plot(1:20,k)

