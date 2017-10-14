function [ seq ] = SeqGEN(length)
    N=2^length;
    seq=zeros(N,length);
    NumList=[1:N];
    seqS=str2num(dec2bin(0:N-1))
    for i=1:length
        seq(:,i)=mod(floor(seqS/10^(i-1)),2);
    end
end

