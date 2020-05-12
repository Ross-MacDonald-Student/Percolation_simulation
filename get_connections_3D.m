function [Connections,Connection_numbers] = get_connections_3D(sheet_center_vector,points,width);
sheet_no = size(sheet_center_vector);
sheet_no = sheet_no(1,2);
Connection_numbers = zeros(1,sheet_no);
for s = 1:sheet_no
    no_contacts = 0;
    [nearby_points,no_points] = get_nearby_points(sheet_center_vector,s,width);
    if no_points == 0;
        
    else
        for p = 1:no_points
            [minkowski,collision] = Get_minkowski(points(s,:,:),points(nearby_points(p,1),:,:));
            if collision == true
                no_contacts = no_contacts+1;
                sheet_center_vector(3*no_contacts+1:3*no_contacts+3,s) = sheet_center_vector(1:3,nearby_points(p,1));
                Connection_numbers(no_contacts,s) = nearby_points(p,1);
            end
        end
            %sheet_center_vector(s,3*p+1:3*p+3) = sheet_center_vector(nearby_points(p,1),1:3);
    end
    
end

Connections = sheet_center_vector;
end
            
