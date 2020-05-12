function [next_sheet,isblocked] = get_next_sheet3D(Connection_numbers,clustered_sheets,cur_sheet,last_sheet);
finish = false;
maxi = size(Connection_numbers);
maxi = maxi(1,1);
i = 1;
while finish == false
    %T = any(clustered_sheets == Connection_numbers(i,cur_sheet));
    if i > maxi
        isblocked = true;
        next_sheet = last_sheet;
        finish = true;
    elseif Connection_numbers(i,cur_sheet) == 0
        isblocked = true;
        next_sheet = last_sheet;
        finish = true;
    elseif any(any(clustered_sheets == Connection_numbers(i,cur_sheet))) ~= 1
        isblocked = false;
        next_sheet = Connection_numbers(i,cur_sheet);
        finish = true;
    else
        i = i + 1;
    end
    
end

end



