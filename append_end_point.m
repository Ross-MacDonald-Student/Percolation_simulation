function [New_connection_numbers,New_connection_cords,new_clustered_sheets,end_point,start_point] = append_end_point(right_contacts,left_contacts,Connection_numbers,clustered_sheets,percolation_cluster,edge_point_mids,Connections)
size_connection_numbers = size(Connection_numbers);
size_clusterd_sheets = size(clustered_sheets);
size_right_contacts = size(right_contacts);
size_left_contacts = size(left_contacts);
size_connection = size(Connections);

Connection_numbers(1:size_right_contacts(1,1),size_connection_numbers(1,2)+1) = right_contacts;
Connection_numbers(1:size_left_contacts(1,1),size_connection_numbers(1,2)+2) = left_contacts;

clustered_sheets(percolation_cluster,size_clusterd_sheets(1,2)+1) = size_connection_numbers(1,2)+1;
clustered_sheets(percolation_cluster,size_clusterd_sheets(1,2)+2) = size_connection_numbers(1,2)+2;
new_clustered_sheets = clustered_sheets;

end_point = size_connection_numbers(1,2)+1;
start_point = size_connection_numbers(1,2)+2;

for s = transpose(right_contacts)
    Connection_numbers(get_connection_no(Connection_numbers,s) + 1, s) = end_point;
    Connections(get_connection_no(Connections,s)+1:get_connection_no(Connections,s)+3,s) = edge_point_mids(:,1)
end

for s = transpose(left_contacts)
    Connection_numbers(get_connection_no(Connection_numbers,s) + 1, s) = start_point;
    Connections(get_connection_no(Connections,s)+1:get_connection_no(Connections,s)+3,s) = edge_point_mids(:,2)
end
New_connection_numbers = Connection_numbers;
New_connection_cords = Connections;
end


