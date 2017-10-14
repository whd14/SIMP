function [ Index ] = IND_GEN( data )
    Nuser=max(data(:,1));
    Index=zeros(Nuser,2);
    jt=1;
    while jt<=size(data,1)
        jt_s=jt;
        User_cur=data(jt,1);
        while jt<=size(data,1)&&data(jt,1)==User_cur
            jt=jt+1;
        end
        Index(User_cur,1)=jt_s;
        Index(User_cur,2)=jt-1;
    end
end

