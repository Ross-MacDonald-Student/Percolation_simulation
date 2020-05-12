function absolute = vector_sheet_absolute(vector1,vector2);

dif = vector2 - vector1;
absolute = sqrt(transpose(dif)*dif);

end
 