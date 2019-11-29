%estprob1b - takes the freq table and a list of indices which point at
%strings in the freq table, strings which belong to a state, and then
%calculates the probability of observing each symbol of the alphabet given
%that state. This will be the frequency of each string (history + next
%symbol) averaged and weighted by the frequency of the history)

function [p1, dist1] = EstProb1(Sigma,s,freq, AlphabetLength, increment)

dist1 = zeros(AlphabetLength,1);
p1 = [];
count = 1;

for i = 0:increment:AlphabetLength-1

    for j = 1:size(Sigma,2)
        if Sigma(s,j) ~=0;
            StateStringPlusNextSymbol = strcat(dec2base(Sigma(s,j),AlphabetLength),num2str(i));
            StateStringPlusNextSymbol(2:length(StateStringPlusNextSymbol));
            frequency = freq(base2dec(strcat(dec2base(Sigma(s,j),AlphabetLength),num2str(i)),AlphabetLength));
            p1(count:count + frequency-1) = ones(frequency,1) * i;
            count = count + frequency;
        end
    end

    dist1(i+1) = count-1;
end

dist1 = dist1/dist1(AlphabetLength);


