function [contains_true_false] = contains_origin(simplex)
direction = [1 0];

for po = 1:4
    plot3(simplex(po,1),simplex(po,2),simplex(po,3),'y*')
    hold on
    p1 = mod(po+1,4);
    p2 = mod(po+2,4);
    p3 = mod(po+3,4);
    if p1 == 0
        p1 = 4;
    end
    if p2 == 0
        p2 = 4;
    end
    if p3 == 0
        p3 = 4;
    end
    plot3([simplex(po,1) simplex(p1,1)],[simplex(po,2) simplex(p1,2)],[simplex(po,3) simplex(p1,3)],'k');
    plot3([simplex(po,1) simplex(p2,1)],[simplex(po,2) simplex(p2,2)],[simplex(po,3) simplex(p2,3)],'k');
    plot3([simplex(po,1) simplex(p3,1)],[simplex(po,2) simplex(p3,2)],[simplex(po,3) simplex(p3,3)],'k');
    disp(po)
end
plot3(0,0,0,'+b')
for pl = 1:4
    
    p1 = mod(po+1,4);
    p2 = mod(po+2,4);
    p3 = mod(po+3,4);
    
    if p1 == 0
        p1 = 4;
    end
    if p2 == 0
        p2 = 4;
    end
    if p3 == 0
        p3 = 4;
    end
    
    normal = get_normal(p1,p2,p3);
    point = intersectPoint(normal, planePoint);
end