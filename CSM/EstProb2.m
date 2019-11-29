%estprob2b - estimates the probability distribution of the next symbol given
%the previous string 'ax'

function [p2, dist2] = EstProb2(a, x, freq, AlphabetLength, increment)

string = strcat('1', a, x(2:length(x)));%remove the '1', add the a, replace the '1'
count =1;
p2 =0;
dist2 = zeros(AlphabetLength,1);

for i = 0:increment:AlphabetLength-1
    
    frequency = freq(base2dec(strcat(string, num2str(i)),AlphabetLength));
    p2(count:count + frequency-1) = ones(frequency,1) * i;
    count = count + frequency;
    dist2(i+1) = count-1;
end

dist2 = dist2/dist2(AlphabetLength);
