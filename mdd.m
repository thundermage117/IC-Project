function [estimate_code,errors] = mdd(Codewords,input_code)
for k=1:size(Codewords,1)
    check_code=Codewords(k,:);
    check_sum=sum(xor(check_code,input_code));
    if(k==1 ||check_sum<min_dist)
        estimate_code=check_code;
        min_dist=check_sum;
    end
    if min_dist==0
        break;
    end
end
errors=min_dist;
end

