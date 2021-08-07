text= fileread('Line.txt'); %Loading file, change to Line.txt or Paragraph.txt

split=double(text); %Converts char array to corresponding ascii double

%% PART 2

count = histcounts( split, [1:128] ); %Counts the occurence of each symbol
%bar(count/length(split));
unique_count=[1:127;count]; %storing as table of (ascii, times occured)

unique_count=unique_count(:,~any(unique_count==0)); %removes all symbols which don't occur(can be easily done using a loop)

prob=unique_count(2,:)/length(split); %Creates probability array
%sum(prob) %To check probability was 1

data= [prob;unique_count(1,:)]; %data contains probability and ascii value of each symbol

data=sortrows(data','ascend')'; %make ascending order in probability

%% PART 3

code = huff(data(2,:),data(1,:)); %Returns a cell list containing codewords.

% If working on windows, notepad creates a \n and \r while going to a new
% line unlike linux, which uses just \n. \n=13 and \r=10
% This code prints all symbols and codewords used.
for k=1:length(code)
    if code{2,k}==13
        fprintf("\\n");
    else
        fprintf("%c",char(code{2,k}));
    end
    disp(code{1,k});
end

%% PART 4

fileID = fopen('compressed.bin','w+'); % w+ removes old content and creates a new output file. 
for k=1:length(split) % goes over all symbols in the input file
    for L=1:length(code)
        if split(k)==code{2,L} % finding a match for the current symbol in the input file and codewords list.
            break;
        end
    end
    t=code{1,L}; % Storing the code for the alphabet(symbol)
    for J=1:length(t)
        fwrite(fileID,t(J),'ubit1'); % writing to file in binary
% This is the most important step; by default, our computer decides to use 
% 8 bits to write any character to a file, i.e it would use 8 bits to
% denote 0 which would essentially make our compression code futile.
    end
end
fclose(fileID);

%% PART 5
fileID = fopen('compressed.bin');
fnew=fopen('decoded.txt','w+');
A = fread(fileID,Inf,'ubit1');
k=0;
% Since we are using P-F code, we take bit by bit imput from the compressed
% file and check all our codewords to find a match and store it in the new
% file.
while ~isempty(A)
    k=k+1;
    for L=1:length(unique_count)
        if length(A(1:k))==length(code{1,L})
            if A(1:k)==code{1,L}'
            fprintf(fnew,'%c',char(code{2,L}));
            A(1:k)=[];
            k=1;
            break;
            end
        end
    end
end
