function [ res ] = TimeSimGap(time1, time2, t_gap)
    res=logical(0);
    tmax=max([time1 time2]);
    tmin=min([time1 time2]);
    day=floor(tmax/100)-floor(tmin/100);
    if day~=0
        res=0;
        return;
    end
    hour1=mod(tmax,100);
    hour2=mod(tmin,100);
    hour_intval=floor(hour1/t_gap)-floor(hour2/t_gap);
    if hour_intval~=0
        res=0;
    else
        res=1;
    end
end

