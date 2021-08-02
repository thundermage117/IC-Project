text= fileread('Word.txt');
split=double(text);
count = histcounts( split, [1:128] );
%bar(count/length(split));
unique_count=[1:127;count]; %storing as (ascii, times occured)

unique_count=unique_count(:,~any(unique_count==0)); %removes all symbols which don't occur(can be easily done using a loop)
prob=unique_count(2,:)/length(split);
%sum(prob)

data= [prob;unique_count(1,:)];
data=sortrows(data','ascend')'; %make ascending order

code = huff(data(2,:),data(1,:));
%% PART 3
for k=1:length(code)
    if code{2,k}==13
        fprintf("\\n");
    else
        fprintf("%c",char(code{2,k}));
    end
    disp(code{1,k});
end

%% PART 4

fileID = fopen('compressed.txt','w+');
for k=1:length(split)
    for L=1:length(code)
        if split(k)==code{2,L}
            break;
        end
    end
    t=code{1,L};
    for J=1:length(t)
        fwrite(fileID,t(J),'bit1');
    end
end
fclose(fileID);

