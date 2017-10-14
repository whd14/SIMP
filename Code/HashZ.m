function [ data_new IDremap ] = HashZ( data )
IDlist=unique(data(:,1));
IDlist=sort(IDlist,'descend');
IDmap=containers.Map(0,0);
TIDlist=1:length(IDlist);
for i=1:length(IDlist)
    IDmap(IDlist(i))=TIDlist(i);
end
for i=1:size(data,1)
    data(i,1)=IDmap(data(i,1));
end
data_new=data;
IDremap=IDlist;
end

