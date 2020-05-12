function plot_connections(Connections)
dimensions = size(Connections);

for s = 1:dimensions(1,2)
    finish = false;
    i = 1;
    while finish == false & i < dimensions(1,1)
        if Connections(i,s) == 0 & Connections(i+1,s) == 0 & Connections(i+2,s) == 0
            finish = true;
        else
            plot3([Connections(1,s) Connections(i,s)],[Connections(2,s) Connections(i+1,s)],[Connections(3,s) Connections(i+2,s)],'k');
            hold on
        end
        i = i+3;
    end

end