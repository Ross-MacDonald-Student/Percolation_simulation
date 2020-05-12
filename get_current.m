function current = get_current(R,P,start_point,end_point,voltage)
G = transpose(P)*inv(R)*P;
ve = [0;voltage];
G11 = G(1:end_point-1,1:end_point-1);
G12 = G(1:end_point-1,end_point:start_point);
G21 = G(end_point:start_point,1:end_point-1);
G22 = G(end_point:start_point,end_point:start_point);
vi = -linsolve(G11,G12*ve);
vi(isnan(vi)) = 0;
%ie = inv(B)*(G21*vi + G22*ve);
current_vector = G21*vi + G22*ve;
current = -current_vector(1,1);
end