min_vector = abs(0.5 - perc_prob);
for i = 1:25
    [value index] = min(min_vector(i,:));
    min_index(i) = index;
end

%plot(aspect_ratio_vector(1:20),smooth(packing_fraction_vector(min_index(1:20))))

%th = smooth(packing_fraction_vector(min_index(1:20)));
