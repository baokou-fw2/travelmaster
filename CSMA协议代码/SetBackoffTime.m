%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SetBackoffTime�������ܣ������˱ܴ��������˱�ʱ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ret = SetBackoffTime(CountBackoff)
MaxCountBackoff = 15 ;                                                     %�˱ܴ�������ֵ
if CountBackoff>  MaxCountBackoff                                          %�˱ܴ�����������ֵ                                                      
   CountBackoff  = 15;                                                      %�˱ܴ�����0
end
n = 2^(2+CountBackoff);                                                    %�����˱�ʱ�������ֵ
%n = CountBackoff+1;                                                    %�����˱�ʱ�������ֵ
t = randperm(n)-1;                                                         %���˱�ʱ�������ֵ��Χ�������˱�ʱ������
BackoffTime = t(1);                                                        %�����һ����Ϊ�˱�ʱ��
ret = BackoffTime;                                                         %��������˱�ʱ��
end
 