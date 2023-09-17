function [npre,pre20]=grnnett(n012,N,n1,n2)
% p_train=n012(1:3,1:40);
% t_train=n012(1:3,40:50);
% p_test=n012(4,1:40);
% t_test=n012(4,40:50);
p_train=n012(1:4*N,1:3);
t_train=n012(1:4*N,4);
p_test=n012(n1:n2,1:3);
t_test=n012(n1:n2,4);
% 交叉验证
desired_spread=[];
mse_max=10e20;
desired_input=[];
desired_output=[];
result_perfp=[];
indices = crossvalind('Kfold',length(p_train),4);
h=waitbar(0,'正在寻找最优化参数....');
k=1;
for i = 1:4
    perfp=[];
    disp(['以下为第',num2str(i),'次交叉验证结果'])
    test = (indices == i); train = ~test;
    p_cv_train=p_train(train,:);
    t_cv_train=t_train(train,:);
    p_cv_test=p_train(test,:);
    t_cv_test=t_train(test,:);
    p_cv_train=p_cv_train';
    t_cv_train=t_cv_train';
    p_cv_test= p_cv_test';
    t_cv_test= t_cv_test';
    [p_cv_train,minp,maxp,t_cv_train,mint,maxt]=premnmx(p_cv_train,t_cv_train);
    p_cv_test=tramnmx(p_cv_test,minp,maxp);
    for spread=0.01:0.01:0.1;
        net=newgrnn(p_cv_train,t_cv_train,spread);
        waitbar(k/80,h);
        disp(['当前spread值为', num2str(spread)]);
        test_Out=sim(net,p_cv_test);
        test_Out=postmnmx(test_Out,mint,maxt);
        error=t_cv_test-test_Out;
        disp(['当前网络的mse为',num2str(mse(error))])
        perfp=[perfp mse(error)];
        if mse(error)<mse_max
            mse_max=mse(error);
            desired_spread=spread;
            desired_input=p_cv_train;
            desired_output=t_cv_train;
        end
        k=k+1;
    end
    result_perfp(i,:)=perfp;
end;
close(h)
disp(['最佳spread值为',num2str(desired_spread)])
disp(['当前网络的mse为',num2str(mse_max)])
% 采用最佳方法建立GRNN网络
net=newgrnn(desired_input,desired_output,desired_spread);
desired_spread
p_test=p_test';
p_test=tramnmx(p_test,minp,maxp);
grnn_prediction_result=sim(net,p_test);
grnn_prediction_result=postmnmx(grnn_prediction_result,mint,maxt);
% grnn_error=mse(t_test-grnn_prediction_result');
% disp('均方误差为：')
% disp(grnn_error)
npre=net;
pre20=grnn_prediction_result;%训练集和预测集的结果

end