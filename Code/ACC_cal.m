clear all, close all, clc;
load RES_Likelihood
AUC=zeros(size(REScell,1),1);
ct=0;
for i=1:220
    Weight=REScell{i};
    Nset=size(Weight,1);
    if Nset==0
        continue
    end
    [NU IND]=sort(Weight(:,3),'descend');
    Weight=Weight(IND,:);
    DEX=1:length(IND);
    rank=DEX(abs(Weight(:,2))==i);
    k_top=10;
    n0=1;
    n1=k_top-n0;
    if (length(rank)==0)||rank>k_top
        rank=k_top;
    end
    AUC(i)=(k_top+1-rank-n0*(n0+1)/2)/n0/n1;
    ct=ct+1;
end
sum(AUC)/ct