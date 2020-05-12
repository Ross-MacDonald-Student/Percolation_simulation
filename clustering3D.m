function [clustered_sheets,cluster_no] = clustering3D(sheet_center_vector,Connection_numbers)

cluster_no = 1;
sheet_no = size(Connection_numbers);
sheet_no = sheet_no(1,2);
finish = false;
clustered_sheets = 0;
%starti = 1;
%startj = 1;

for i = 1:sheet_no
    if any(any(clustered_sheets == i))
        skip = true;
    else
        skip = false;
    end
    if skip ~= true
        finish = false;
        connection_no = 1;
        start_sheet = i;
        sheet_memory = i;
        cur_sheet = i;
        mem_pos = 1;
        clustered_sheets(cluster_no,connection_no) = cur_sheet;
        while finish == false;
            %clustered_sheets(cluster_no,connection_no) = cur_sheet;
            last_sheet = sheet_memory(mem_pos,1);
            [cur_sheet,isblocked] = get_next_sheet3D(Connection_numbers,clustered_sheets,cur_sheet,last_sheet);
            if cur_sheet == start_sheet & isblocked == true;
                finish = true;
                cluster_no = cluster_no + 1;
            elseif isblocked == true;
                mem_pos = mem_pos - 1;
                cur_sheet = sheet_memory(mem_pos,1);
            else
                mem_pos = mem_pos + 1;
                sheet_memory(mem_pos,1) = cur_sheet;
                connection_no = connection_no + 1;
                clustered_sheets(cluster_no,connection_no) = cur_sheet;
            end
        end
    end
end
cluster_no = cluster_no - 1;
end