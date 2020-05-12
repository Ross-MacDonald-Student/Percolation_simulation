function point = intersectPoint(planeNormal, planePoint)
rayVector = [0 -1 -1];
rayPoint = [0 0 0];
pdiff = rayPoint - planePoint;
prod1 = dot(pdiff, planeNormal);
prod2 = dot(rayVector, planeNormal);
prod3 = prod1 / prod2;
 
point = rayPoint - rayVector * prod3;
end