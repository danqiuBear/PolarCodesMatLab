function u_hat=decoder_tree(y,free_index,frozen_index,b,var)
%译码函数
%输入y为信道输出,Z为信道Bhattacharyya矩阵,k为信息长度,b为frozenbit的值,var为噪声方差/功率

N=length(y);                        %码长N



isfrozen(frozen_index)=1;           %frozenbit标记
isfrozen(free_index)=0;             %信息比特


u_hat(1:N)=0;
for i=1:N
    if isfrozen(i)==1;
        u_hat(i)=b;
    else
       M0=logAPP1(y,u_hat,0,N,i,var);
       M1=logAPP1(y,u_hat,1,N,i,var);
        if M0>=M1
            u_hat(i)=0;
        else
            u_hat(i)=1;
        end
    end
end

end
        

