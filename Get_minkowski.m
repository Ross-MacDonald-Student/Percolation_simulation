function [minkowski,collision] = Get_minkowski(flake1,flake2)

minkowski = zeros(64,3);

for i = 1:8
    for j = 1:8
    minkowski((i-1)*8 + j,:) = flake1(1,i,:) - flake2(1,j,:);
    end
end
x_pos = false;
x_neg = false;
y_pos = false;
y_neg = false;
z_pos = false;
z_neg = false;
for i = 1:64
    if minkowski(i,1) > 0
        x_pos = true;
    elseif minkowski(i,1) < 0
        x_neg = true;
    end
    if minkowski(i,2) > 0
        y_pos = true;
    elseif minkowski(i,2) < 0
        y_neg = true;
    end
    if minkowski(i,3) > 0
        z_pos = true;
    elseif minkowski(i,3) < 0
        z_neg = true;
    end
end
if x_pos == true & x_neg == true & y_pos == true & y_neg == true & z_pos == true & z_neg == true
    collision = true;
else
    collision = false;
end
%for i = 1:64
%    plot3(minkowski(i,1),minkowski(i,2),minkowski(i,3),'y*');
%    hold on
%end

end