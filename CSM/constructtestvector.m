function testvector = constructtestvector(distribution)

count = 1;

for i = 1:length(distribution)
    
    frequency = distribution(i);
    testvector(count:count + frequency-1) = ones(frequency,1) * i;
    count = count + frequency;

end
