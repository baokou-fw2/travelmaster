function [n0,n1,n2,Ncal]=calTn(n,N);
%计算预计的剩余量,n个节点争用，时隙空闲数n0，成功数n1，碰撞数n2
Pn=binopdf(0,n,1/N);
Ps=binopdf(1,n,1/N);
Pe=1-Pn-Ps;
% if Pe<0
%     Pe=0;
% end
Ncal=n-n*Ps;
n0=n*Pn;
n1=n*Ps;
n2=n*Pe;

end