function [ seq ] = SeqGEN(length, Npositive)
    if Npositive==0
        seq=zeros(1,length);
        return;
    end
    if Npositive==1
        seq=eye(length);
        return;
    end
    if Npositive>length
        seq=[];
        return;
    end
    seqP=SeqGEN(length-1, Npositive-1);
    seqP=[seqP,zeros(size(seqP,1),1)+1];
    seqN=SeqGEN(length-1, Npositive);
    seqN=[seqN,zeros(size(seqN,1),1)];
    seq=[seqP;seqN];
end

