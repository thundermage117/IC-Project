%% PART A
n=15;
k=10;

p=0.015;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end
fprintf("\na.");
P_e=E/N

%% PART B
n=15;
k=10;
p=0.1;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end

fprintf("\nb.");
P_e=E/N

%% PART C
n=15;
k=10;
p=0.45;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end

fprintf("\nc.");
P_e=E/N

%% PART D
n=20;
k=10;
p=0.015;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end

fprintf("\nd.");
P_e=E/N

%% PART E
n=20;
k=10;
p=0.1;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end

fprintf("\ne.");
P_e=E/N

%% PART F
n=20;
k=10;
p=0.45;
N=2000;

C=randi([0 1],2^k,n); % Generates a randome code C:a binary matrix with 2^k rows and n col
E=0;
for L=1:N
    c=C(randi(size(C,1)),:); % Chooses a random c from C
    y=binarysym(c,p); % BSC code
    c_cap=mdd(C,y); % Min Dist Decoder, returns closest codeword
    if sum(xor(c,c_cap))>0 % Comparing original and approximate codewords.
        E=E+1;
    end
end

fprintf("\nf.");
P_e=E/N

%% min P_E
 
% a. 0.0495
% b. 0.4590
% c. 0.9955
% d. 0.0060
% e. 0.2570
% f. 0.9950

min_P_E= [0.0495 0.4590 0.9955 0.0060 0.2570 0.9950];

subplot(2,1,1);
x=[0.015 0.1 0.45];
plot(x,min_P_E(1:3));
title('n=15, k=10');
xlabel('p');
ylabel('P_E(n,k,p)');

subplot(2,1,2);

plot(x,min_P_E(4:6));
title('n=20, k=10');
xlabel('p');
ylabel('P_E(n,k,p)');