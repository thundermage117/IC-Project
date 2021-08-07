function output_code = binarysym(input_code,prob)
len=length(input_code);
c=rand(1,len); % Creates an array of random values in [0,1].
output_code=input_code;
for k=1:len
    if c(k)<prob
        output_code(k)=1-output_code(k); % Flip's the k'th bit if random value is less than the probability.
    end
end
end

