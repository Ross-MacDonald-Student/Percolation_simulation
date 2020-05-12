function plot_points(points)   
sheet_no = size(points);
sheet_no = sheet_no(1,1);
for s = 1:sheet_no
    for p =1:4
        %plot3(points(s,p,1),points(s,p,2),points(s,p,3),'*y');
        %hold on
        %plot3(points(s,p+4,1),points(s,4+p,2),points(s,4+p,3),'*y')
        p1 = mod(p+1,4);
        p2 = mod(p-1,4);
        p3 = mod(p+4,8);
            if p1 == 0 
                p1 = 4;
            end
            if p2 == 0
                p2 = 4;
            end
            if p3 == 0
                p3 = 8;
            end
        plot3([points(s,p,1) points(s,p1,1)],[points(s,p,2) points(s,p1,2)],[points(s,p,3) points(s,p1,3)],'k');
        hold on
        plot3([points(s,p,1) points(s,p2,1)],[points(s,p,2) points(s,p2,2)],[points(s,p,3) points(s,p2,3)],'k');
        plot3([points(s,p,1) points(s,p3,1)],[points(s,p,2) points(s,p3,2)],[points(s,p,3) points(s,p3,3)],'k');
        
        plot3([points(s,4+p,1) points(s,p1+4,1)],[points(s,4+p,2) points(s,p1+4,2)],[points(s,4+p,3) points(s,p1+4,3)],'k');
        plot3([points(s,4+p,1) points(s,p2+4,1)],[points(s,4+p,2) points(s,p2+4,2)],[points(s,4+p,3) points(s,p2+4,3)],'k');
        %plot3([points(s,4+p,1) points(s,p3-4,1)],[points(s,4+p,2) points(s,p3-4,2)],[points(s,4+p,3) points(s,p3-4,3)],'k');
    end
    disp(s);
end