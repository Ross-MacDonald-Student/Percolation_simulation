function no_connections = get_connection_no(Connection_numbers,sheet)

no_connections = 0;
csize = size(Connection_numbers);
for i = 1:csize(1,1)
    if Connection_numbers(i,sheet) == 0
        break
    else
        no_connections = no_connections + 1;
    end
end
end