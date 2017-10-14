function [ Weight ] = LikelihoodB(Target, ETP, Index, ETPSGL, Type , t_gap)
    Weight=0;
    GIndx=logical(zeros(size(ETP,1),1));
    for i=1:length(Target)
        Inds=Index(Target(i),1);
        Inde=Index(Target(i),2);
        if Inds>0&Inde>0
            GIndx(Inds:Inde)=1;
            Weight=Weight-ETPSGL(Target(i));
        end
    end
    ETPSUB=ETP(GIndx,:);
    Weight_Add=LikelihoodMixB(ETPSUB, t_gap,Type);
    Weight=Weight+Weight_Add;
%     Weight=Weight+sum(ETPSGL);

    prior=log2(prod(Type(Target,2)));
    Weight=Weight+prior;
end

