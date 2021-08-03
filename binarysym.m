function output_code = binarysym(input_code,prob)
len=length(input_code);
c=rand(1,len);
output_code=input_code;
for k=1:len
    if c(k)<prob
        output_code(k)=1-output_code(k);
    end
end
end

