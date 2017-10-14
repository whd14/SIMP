clear all, close all, clc;
tt=textread('tt_data.txt','','delimiter','\t,_');
fs=textread('fs_data.txt','','delimiter','\t,_');
Nut=max(tt(:,1)); %The number of twitter user
Nuf=max(fs(:,1)); %The number of foursquare user
adj_mat=logical(zeros(Nut,Nuf)); %Denote whether two user have encountered
Dth=0.05; %LengthMaximum distance regarded as an encounter
Tth=10^8;% Indicate for temporal resolution of 1 hour
fs(:,1)=-1.*fs(:,1); %Foursquare user ID are set to negetive
data=[tt;fs];
data(:,2)=floor(data(:,2)./Tth).*Tth;
data(:,3)=floor(data(:,3)./Dth).*Dth;
data(:,4)=floor(data(:,4)./Dth).*Dth;
datas = sortrows(data,4);
datas = sortrows(datas,3);
datas = sortrows(datas,2);
i_pre=1;
t_pre=0;
lat_pre=0;
lon_pre=0;
for i=1:size(datas,1)
    t_cur=datas(i,2);
    lat_cur=datas(i,3);
    lon_cur=datas(i,4);
    if i==1
        t_pre=datas(i,2);
        lat_pre=datas(i,3);
        lon_pre=datas(i,4);
    else if lon_cur~=lon_pre || lat_cur~=lat_pre || t_cur~=t_pre
%             i
            for j=i_pre:i-1
                id1=datas(j,1);
                for k=i_pre:j-1
                    id2=datas(k,1);
                    if id1*id2<0
                        id_t=max([id1 id2]);
                        id_f=-1*min([id1 id2]);
                        adj_mat(id_t,id_f)=1;
                    end
                end
            end
            i_pre=i;
            t_pre=t_cur;
            lat_pre=lat_cur;
            lon_pre=lon_cur;
        end
    end
end
save adj_mat adj_mat
