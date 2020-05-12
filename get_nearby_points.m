function [nearby_points,no_points] = get_nearby_points(sheet_center_vector,start_sheet_no,width);
sheet_no = size(sheet_center_vector);
sheet_no = sheet_no(1,2);
no_points = 0;
nearby_points = 0;
for s = 1:sheet_no
    if s == start_sheet_no
        
    elseif vector_sheet_absolute(sheet_center_vector(1:3,start_sheet_no),sheet_center_vector(1:3,start_sheet_no)) <= width
        no_points = no_points+1;
        nearby_points(no_points,1) = s;
    else
        
    end
end
end