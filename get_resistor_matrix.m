function [R,P,Resistor_vector] = get_resistor_matrix(New_connection_numbers,end_point)

resistor_count = 1;
Connection_size = size(New_connection_numbers);
for i = 1:Connection_size(1,2)
    for j = 1:Connection_size(1,1)
        if New_connection_numbers(j,i) == 0
            break
        elseif New_connection_numbers(j,i) < i
            R(resistor_count,resistor_count) = 100;
            Resistor_vector(resistor_count,1) = i;
            Resistor_vector(resistor_count,2) = New_connection_numbers(j,i);
            Resistor_vector(resistor_count,3) = 100;
            resistor_count = resistor_count + 1;
        end
    end
end
for i = 1:Connection_size(1,2)
    dist(i) = DijkstraV2(New_connection_numbers,i,end_point,Resistor_vector);
end
resistor_count = resistor_count - 1;
P = zeros(resistor_count,Connection_size(1,2));
for r = 1:resistor_count
    connected_sheet = Resistor_vector(r,1:2);
    if dist(connected_sheet(1,1)) >= dist(connected_sheet(1,2))
        P(r,connected_sheet(1,1)) = 1;
        P(r,connected_sheet(1,2)) = -1;
    else
        P(r,connected_sheet(1,1)) = -1;
        P(r,connected_sheet(1,2)) = 1;
    end
end
end          