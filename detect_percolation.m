function [percolated,percolation_cluster,right_contacts,left_contacts,edge_point_mids] = detect_percolation(Range,points,sheet_center_vector,length,clustered_sheets)

edge_point_mids = zeros(3,2);
edge_point_mids(:,1) = [Range,Range*0.5,Range*0.5];
edge_point_mids(:,2) = [0,Range*0.5,Range*0.5];
edge_points = zeros(2,8,3);
perc = [1,1;1,-1;-1,-1;-1,1];

for e =1:2
    normal = [1;0;0]*(-1)^(e);
    v1 = [0;1;0];
    v2 = [0;0;1];

    for p = 1:8
        if p <5
            edge_points(e,p,:) = edge_point_mids(1:3,e) - 0.5*Range*(perc(p,1)*v1+perc(p,2)*v2);
        elseif p <8
            edge_points(e,p,:) = edge_point_mids(1:3,e) - 0.5*Range*(perc(mod(p,4),1)*v1+perc(mod(p,4),2)*v2) - normal;
        else
            edge_points(e,p,:) = edge_point_mids(1:3,e) - 0.5*Range*(perc(4,1)*v1+perc(4,2)*v2) - normal;
        end
    end
end

no_sheets = size(sheet_center_vector);
no_sheets = no_sheets(1,2);
left_sheet_no = 1;
right_sheet_no = 1;
left_sheets = 0;
right_sheets = 0;
for i = 1:no_sheets
    if sheet_center_vector(1,i) < length*0.5
        left_sheets(left_sheet_no,1) = i;
        left_sheet_no = left_sheet_no + 1;
    elseif Range - sheet_center_vector(1,i) < length*0.5
        right_sheets(right_sheet_no,1) = i;
        right_sheet_no = right_sheet_no + 1;
    end
end
right_sheet_no = right_sheet_no - 1;
left_sheet_no = left_sheet_no - 1;
left_contacts = 0;
no_left_contacts = 1;
no_right_contacts = 1;
for i = 1:left_sheet_no
    [minkowski,collision] = Get_minkowski(edge_points(2,:,:),points(left_sheets(i,1),:,:));
    if collision == true
        left_contacts(no_left_contacts,1) = left_sheets(i,1);
        no_left_contacts = no_left_contacts + 1;
    end
end
for i = 1:right_sheet_no
    [minkowski,collision] = Get_minkowski(edge_points(1,:,:),points(right_sheets(i,1),:,:));
    if collision == true
        right_contacts(no_right_contacts,1) = right_sheets(i,1);
        no_right_contacts = no_right_contacts + 1;
    end    
end
no_right_contacts = no_right_contacts - 1;
no_left_contacts = no_left_contacts - 1;
clustered_size = size(clustered_sheets);
percolated = false;
percolation_cluster = 0;
for i = 1:clustered_size(1,1)
    left = false;
    right = false;
    for j = 1:no_left_contacts
        if any(any(clustered_sheets(i,:) == left_contacts(j,1)))
            left = true;
        end
    end
    for j = 1:no_right_contacts
        if any(any(clustered_sheets(i,:) == right_contacts(j,1)))
            right = true;
        end
    end
    if left == true & right == true;
        percolated = true;
        percolation_cluster = i;
        break
    end
end
if no_right_contacts == 0
    right_contacts = 0;
end
if no_left_contacts == 0
    left_contacts = 0;
end

end
    