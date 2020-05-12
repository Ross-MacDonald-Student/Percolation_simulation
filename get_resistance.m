function resistance = get_resistance(Resistor_vector,sheet1,sheet2)
resistor_count = size(Resistor_vector);
for i = 1:resistor_count(1,1)
    if Resistor_vector(i,1) == sheet1 & Resistor_vector(i,2) == sheet2
        resistance = Resistor_vector(i,3);
        break
    elseif Resistor_vector(i,1) == sheet2 & Resistor_vector(i,2) == sheet1
        resistance = Resistor_vector(i,3);
        break
    end
end
end