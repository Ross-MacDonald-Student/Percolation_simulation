function shortest_distance = DijkstraV2(New_connection_numbers,source_number,end_point,Resistor_vector)
if source_number == end_point
    shortest_distance = 0;
    return
end
connection_size = size(New_connection_numbers);
visited_sheets = source_number;
unvisited_sheets = 1:connection_size(1,2);
unvisited_sheets(unvisited_sheets == source_number) = [];
dist = Inf(1,connection_size(1,2));
dist(source_number) = 0;
finish = false;
cur_sheet = source_number;
visited_no = 1;
while finish == false
    for i = 1:connection_size(1,1)
        if New_connection_numbers(i,cur_sheet) == 0
            break
        else
            resistance = get_resistance(Resistor_vector,cur_sheet,New_connection_numbers(i,cur_sheet));
            if dist(cur_sheet) + resistance < dist(New_connection_numbers(i,cur_sheet))
                dist(New_connection_numbers(i,cur_sheet)) = dist(cur_sheet) + resistance;
            end
        end
    end
    [M index] = min(dist(unvisited_sheets));
    cur_sheet = unvisited_sheets(index);
    visited_sheets(visited_no + 1) = cur_sheet;
    visited_no = visited_no + 1;
    unvisited_sheets(unvisited_sheets == cur_sheet) = [];
    if cur_sheet == end_point
        finish = true;
    end
end
shortest_distance = dist(end_point);