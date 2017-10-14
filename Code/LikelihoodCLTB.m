function [ likeli ] = LikelihoodCLTB( Indicator, cookie, Index, ETPSGL, Type, t_gap)
    N_CLT=max(Indicator);
    N_AC=length(Indicator);
    dex=[1:N_AC];
    likeli=0;
    for i=1:uint32(N_CLT)
        likeli=likeli+LikelihoodB(dex(Indicator==i), cookie, Index, ETPSGL, Type, t_gap);
    end
end

