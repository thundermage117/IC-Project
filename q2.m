%% PART A
n=15;
k=10;
p=0.015;
N=1000;

C=randi([0 1],2^k,n);
E=0;
for L=1:N
    c=C(randi(size(C,1)),:);
    y=binarysym(c,p);
    [~,err]=mdd(C,y);
    if err>0
        E=E+1;
    end
end
P_e=E/N