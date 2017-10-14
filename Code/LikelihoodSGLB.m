function [ Weight ] = LikelihoodSGLP(Target, ETP, Index, t_gap,Type)
	Inds=Index(Target,1);
	Inde=Index(Target,2);
    if Inds>0&Inde>0
        ETPSUB=ETP(Inds:Inde,:);
        Weight=LikelihoodMixB(ETPSUB, t_gap,Type);
    else
        Weight=0;
    end
end

