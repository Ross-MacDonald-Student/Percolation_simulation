function no_connections = get_no_connections(Connection_numbers, s);

no_connections = 0;
finish = false;
i = 1;
max = size(Connection_numbers);
max = max(1,1);
while finish == false & i<=max
    if Connection_numbers(i,s) == 0
        finish = true;
    else
        no_connections = no_connections + 1;
        i = i + 1;
    end
end
end