function [T,TruncatedTransitions] = Transitions...
    (States, freq, AlphabetLength, L_Max, increment)

%for each state look at the first string, then append each symbol in the
%alphabet and look for the resulting string in the other states this gives
%out, from and to
%Must also look at each string and use the frequencies of the strings
%resulting from appending symbols to get the weights of the transitions.
T = zeros(AlphabetLength, size(States,1),size(States,1));
TruncatedTransitions = zeros(AlphabetLength, size(States,1),size(States,1));

%find minimum index such that the word is of maximum length
allzeros = '1';
for i = 1:L_Max
    allzeros = strcat(allzeros,'0');
end
MININDEX = base2dec(allzeros,AlphabetLength);

for i = 1:size(States,1)

    Truncatable = CheckState(i,States, L_Max, AlphabetLength, MININDEX);

    for j = 1:size(States,2)
        if States(i,j) ~=0

            Index = States(i,j);
            String = dec2base(Index,AlphabetLength);


            for k = 0:increment:AlphabetLength-1

                NewString = strcat(String,num2str(k));
                NewIndex = base2dec(NewString,AlphabetLength);
                LongString = 0;

                frequency = freq(NewIndex);

                if length(NewString)>L_Max+1
                    NewString = strcat('1',NewString(3:L_Max+2));
                    NewIndex = base2dec(NewString,AlphabetLength);
                    LongString = 1;
                end

                Location = find(States == NewIndex);

                if isempty(Location) ~= 1
                    state = mod(Location, size(States,1));
                    if state == 0
                        state = size(States,1);
                    end
                    to = state;
                    if LongString == 0 || LongString+Truncatable > 1
                        T(k+1,i,to)= T(k+1,i,to)+frequency;
                        if LongString == 1
                            TruncatedTransitions(k+1,i,to) = 1;
                        end
                    end
                end
            end

        end
    end
end

%Normalise
for i = 1:size(T,2)
    sumT = sum(sum(T(:,i,:)));
    if sumT ~= 0
        T(:,i,:) = T(:,i,:)/sumT;
    end
end