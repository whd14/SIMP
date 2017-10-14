function [Nodelist Likelilist ETPSGL] = WeightCmpt(cookie, Index, t_gap, Type,setsize, flag)
    N_max=4;
    N_ID=size(Index,1);
    if N_ID>N_max
        flag=1;
    end
    if flag==1
        Dex=1:N_ID;
        Nodelist=[];
        Likelilist=[];
        ETPSGL=zeros(N_ID,1);
        for i=1:N_ID
            ETPSGL(i)=LikelihoodSGLB(i,cookie,Index, t_gap,Type);
        end
        IndicatorList=SeqGEN(N_ID-1,setsize-1);
        IndicatorList=logical([zeros(size(IndicatorList,1),1)+1 IndicatorList]);
        for k=1:size(IndicatorList,1)
            Indicator=IndicatorList(k,:);
            likeli=LikelihoodCLTB(Indicator, cookie, Index, ETPSGL, Type, t_gap);
            Nodelist=[Nodelist;Dex(Indicator)];
            Likelilist=[Likelilist;likeli];
        end
    else
        load partseq;
        Dex=1:N_ID;        
        ETPSGL=zeros(N_ID,1);
        for i=1:N_ID
            ETPSGL(i)=LikelihoodSGLB(i,cookie,Index, t_gap,Type);
        end
        IndicatorListA=partseq{N_ID};
        IndicatorListT=SeqGEN(N_ID-1,setsize-1);
        IndicatorListT=logical([zeros(size(IndicatorListT,1),1)+1 IndicatorListT]);
        Nodelist=zeros(size(IndicatorListT,1),setsize);
        for k=1:size(IndicatorListT,1)
            Dex(IndicatorListT(k,:))
            Nodelist(k,:)
            Nodelist(k,:)=Dex(IndicatorListT(k,:));
        end
        Likelilist=zeros(size(Nodelist,1),1);
        for k=1:size(IndicatorListA,1)
            Indicator=IndicatorListA(k,:);
            likeli=LikelihoodCLTB(Indicator, cookie, Index, ETPSGL, Type, t_gap);
            for l=1:size(Nodelist,1)
                if var(Indicator(IndicatorListT(l,:)))==0
                    Likelilist(l)=Likelilist(l)+2^likeli;
                end
            end
        end
    end
end
