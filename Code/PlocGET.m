function [ cookie ] = PlocGET( cookie,t_gap,ProbMat)
% load PlocMat;
scale=0.1;
% cookie=cookie(cookie(:,2)>=latR(1)&cookie(:,3)>=lngR(1)&cookie(:,2)<latR(2)&cookie(:,3)<lngR(2),:);

N=size(cookie,1);
PlocVec=zeros(N,1);

for i=1:size(cookie,1)
        mx=floor(cookie(i,2)/scale)+901;
        my=floor(cookie(i,3)/scale)+1801;
        PlocVec(i)=ProbMat(mx,my);
end
cookie=[cookie PlocVec.*t_gap];
% PlocVec
% PlocVec>0
% cookie=cookie(cookie(:,end)>0,:);

end