function Truncatable = CheckState(S,Sigma, L_Max, AlphabetLength, MININDEX)

minindex = 9999999999;

for i = 1:size(Sigma,2)
    
    index = Sigma(S,i);
    
    if index ~= 0
        if index < minindex
            minindex = index;
        end
    end
end

if minindex < MININDEX
    Truncatable = 0;
else
    Truncatable = 1;
end
