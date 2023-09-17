%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SetBackoffTime函数功能：根据退避次数生成退避时间
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ret = SetBackoffTime2(CountBackoff)
MaxCountBackoff = 15 ;                                                     %退避次数上限值
if CountBackoff>  MaxCountBackoff                                          %退避次数大于上限值                                                      
   CountBackoff  = 15;                                                      %退避次数置不变
end
if CountBackoff>10
n = CountBackoff+1;                                                    %生成退避时间的上限值
else 
    n = 2^(2+CountBackoff);
end
%n = CountBackoff+1;                                                    %生成退避时间的上限值
t = randperm(n)-1;                                                         %在退避时间的上限值范围内生成退避时间序列
BackoffTime = t(1);                                                        %随机找一个作为退避时间
ret = BackoffTime;                                                         %返回随机退避时间
end
 