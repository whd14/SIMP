function [ s ] = Geo_dis( lat1, lng1, lat2, lng2 )
        EARTH_RADIUS = 6378.137;
		radLat1=deg2rad(lat1);%double radLat1 = rad(lat1);
		radLat2=deg2rad(lat2);%double radLat2 = rad(lat2);
		a=radLat1-radLat2;%double a = radLat1 - radLat2;
		b=deg2rad(lng1)-deg2rad(lng2);%double b = rad(lng1) - rad(lng2);
		s=2*asin(sqrt(power(asin(a/2),2)+cos(radLat1)*cos(radLat2)*power(sin(b/2),2)));
        %double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + 
		%Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
		s = s * EARTH_RADIUS;
		s = round(s * 10000) / 10000;
end

