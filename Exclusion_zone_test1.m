width = 3;
sheet_no = 20;
electron_scaling = 1.3;
a=1;
x = linspace(0,4.5,50);
ar = exp(x);
for aspect_ratio = ar
    p = 1;
    disp("new aspect_ratio")
    disp(aspect_ratio)
    for packing_fraction = linspace(0.01,0.2 - 0.15*aspect_ratio/100,50)
        disp("new packing fraction")
        disp(p)
        for r = 1:25
            [points,exclusion_points,sheet_center_vector,Range,length] = Generate_points_exclustion_angle_limited30(width,aspect_ratio,packing_fraction,sheet_no,electron_scaling);
            [Connections,Connection_numbers] = get_connections_3D(sheet_center_vector,points,length);
            [clustered_sheets,cluster_no] = clustering3D(sheet_center_vector,Connection_numbers);
            Cluster_number(a,p,r) = cluster_no;
            [percolated,percolation_cluster,right_contacts,left_contacts,edge_point_mids] = detect_percolation(Range,points,sheet_center_vector,length,clustered_sheets);
            percolated_matrix(a,p,r) = percolated;
            if percolated == 1
                [New_connection_numbers,New_connection_cords,new_clustered_sheets,end_point,start_point] = append_end_point(right_contacts,left_contacts,Connection_numbers,clustered_sheets,percolation_cluster,edge_point_mids,Connections);
                [R,P,Resistor_vector] = get_resistor_matrix(New_connection_numbers,end_point);
                current(a,p,r) = get_current(R,P,start_point,end_point,5);
            else
                current(a,p,r) = 0;
            end
            disp("r is")
            disp(r)
        end
        p = p+1;
    end
    a = a+1;
end