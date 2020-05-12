function [points,exclusion_points,sheet_center_vector,Range,length] = Generate_points_exclustion_angle_limited30(width,aspect_ratio,packing_fraction,sheet_no,electron_scaling)

length = width*aspect_ratio;
Range = ceil(width*((sheet_no*aspect_ratio^2)/(packing_fraction))^(1/3));
%sheet_center_vector = zeros(3,sheet_no);
%points = zeros(sheet_no,8,3);
perc = [1,1;1,-1;-1,-1;-1,1];

    for s = 1:sheet_no
        disp("sheet no =")
        disp(s)
        rerun = true;
        while rerun == true
            sheet_center_vector(1:3,s) = randi([1 Range],1,3);
            thetha1 = randi([1 180],1,1);
            phi1 = randi([1 90],1,1);
            phi1 = phi1/3;
            normal_1 = [cosd(thetha1)*sind(phi1);sind(thetha1)*sind(phi1);cosd(phi1)];
            v1 = [cosd(thetha1);sind(thetha1);-tand(phi1)];
            v1 = v1/sqrt((transpose(v1)*v1));
            v2 = [sind(thetha1)*cosd(phi1)+sind(thetha1)*sind(phi1)*tand(phi1);-tand(phi1)*cosd(thetha1)*sind(phi1) - cosd(thetha1)*cosd(phi1);0];
            v2 = v2/sqrt((transpose(v2)*v2));
            for p = 1:8
                if p <5
                    exclusion_points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(p,1)*v1+perc(p,2)*v2) + 0.5*normal_1*width;
                elseif p <8
                    exclusion_points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(mod(p,4),1)*v1+perc(mod(p,4),2)*v2) - 0.5*normal_1*width;
                else
                    exclusion_points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*(perc(4,1)*v1+perc(4,2)*v2) - 0.5*normal_1*width;
                end
            end
            if any(any(any(isnan(exclusion_points))))
                disp("error")
            end
            
            [nearby_points,no_points] = get_nearby_points(sheet_center_vector,s,length);
            rerun = false;
            for p = 1:no_points
                [minkowski,collision] = Get_minkowski(exclusion_points(s,:,:),exclusion_points(nearby_points(p,1),:,:));
                if collision == true
                    rerun = true;
                end
            end
        end
        for p = 1:8
            if p <5
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*electron_scaling*(perc(p,1)*v1+perc(p,2)*v2) + 0.5*normal_1*width*electron_scaling;
            elseif p <8
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*electron_scaling*(perc(mod(p,4),1)*v1+perc(mod(p,4),2)*v2) - 0.5*normal_1*width*electron_scaling;
            else
                points(s,p,:) = sheet_center_vector(1:3,s) - 0.5*length*electron_scaling*(perc(4,1)*v1+perc(4,2)*v2) - 0.5*normal_1*width*electron_scaling;
            end
        end
                
    end
end