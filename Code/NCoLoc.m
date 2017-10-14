function [weight_slot] = NCoLoc(Loc,dis,Type,NodeAll)
Nd=size(Loc,1);
Ncll=cell(Nd,1);
%flag=zeros(Nd,1);
for i=1:Nd
    for j=1:i
        if Geo_dis(Loc(i,2),Loc(i,3),Loc(j,2),Loc(j,3))<=dis
            Ncll{j}=[Ncll{j};Loc(i,1)];
            break;
        end
    end
end
% Ncll
Plist=Type(:,2);
% W0
 weight_slot=0;
for i=1:Nd
    if length(Ncll{i})>0
        ploc=Loc(i,5);
        if ploc<=0
            continue;
        end
        W0=log2(ploc*prod(1-Plist(NodeAll))+1-ploc);
        ListLog=unique(Ncll{i});
        ListUnlog=setdiff(NodeAll,ListLog);
        W_pie=log2(ploc)+sum(log2(Plist(ListLog)))+sum(log2(1-Plist(ListUnlog)))-W0;
%         log2(ploc)+sum(log2(Plist(ListLog)))+sum(log2(1-Plist(ListUnlog)))
%         W_pie
        weight_slot=weight_slot+W_pie;
    end
end
end

