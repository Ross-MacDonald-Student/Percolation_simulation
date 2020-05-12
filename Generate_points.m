function [points,sheet_center_vector,Range,length] = Generate_points(width,aspect_ratio,packing_fraction,sheet_no) 

length = width*aspect_ratio;
Range = ceil(width*((sheet_no*aspect_ratio^2)/(packing_fraction))^(1/3));
sheet_center_vector = zeros(3,sheet_no);
points = zeros(sheet_no,8,3);
perc = [1,1;1,-1;-1,-1;-1,1];
    for s = 1:sheet_no
        sheet_center_vector(1:3,s) = randi([1 Range],1,3);
        thetha1 = randi([1 180],1,1);
        phi1 = randi([1 90],1,1);
        normal_1 = [cosd(thetha1)*sind(phi1);sind(thetha1)*sind(phi1);cosd(phi1)];
        v1 = [cosd(thetha1);sind(thetha1);-tand(phi1)];
        v1 = v1/sqrt((transpose(v1)*v1));
        v2 = [sind(thetha1)*cosd(phi1)+sind(thetha1)*sind(phi1)*tand(phi1);-tand(phi1)*cosd(thetha1)*sind(phi1) - cosd(thetha1)*cosd(phi1);0];
        v2 = v2/sqrt((transpose(v2)*v2));
        for p = 1:8
            if p <5
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(p,1)*v1+perc(p,2)*v2);
            elseif p <8
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(mod(p,4),1)*v1+perc(mod(p,4),2)*v2) - normal_1*width;
            else
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(4,1)*v1+perc(4,2)*v2) - normal_1*width;
            end
        end
    end
end