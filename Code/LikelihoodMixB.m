function [ Weight ] = LikelihoodMixB(ETPSUB, t_gap,Type)
    dis=10;
    Weight=0;
    ETPSUB=ETPSUB(ETPSUB(:,2)>0,:);
    [NU IND]=sort(ETPSUB(:,2));
    ETPSUB=ETPSUB(IND,:);
    [NU IND]=sort(ETPSUB(:,4));
    ETPSUB=ETPSUB(IND,:);
    NodeAll=unique(ETPSUB(:,1));
    i=1;
    while i<=size(ETPSUB,1)
        time_cur=ETPSUB(i,4);
        is=i;
        while i<=size(ETPSUB,1)&&TimeSimGap(time_cur,ETPSUB(i,4),t_gap)==1
            i=i+1;
        end
        ie=i-1;
        Weight=Weight+NCoLoc(ETPSUB(is:ie,1:5),dis,Type,NodeAll);
    end
%     for i=1:size(ETPSUB,1)-1
%         Weight=Weight+logGauss(ETPSUB(i,2:3),ETPSUB(i,4),ETPSUB(i+1,2:3),ETPSUB(i+1,4), sigma);
%     end
end