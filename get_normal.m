function normal = get_normal(p1,p2,p3)

v1 = p3 - p1;
v2 = p2 - p1;
normal = cross(v1,v2);

end