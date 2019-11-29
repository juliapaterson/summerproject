function sumfreq = Parser(data, L_Max, AlphabetLength)

sumfreq = 0;

for line = 1:size(data,1)

    a = data(line,:);

    padding = find(a<0);
    if isempty(padding) == 0
        paddingstart = min(padding);
    else
        paddingstart = length(a) + 1;
    end

    a = a(1:paddingstart-1);

    %To find the appropriate range of a later loop
    Lengths = 1:L_Max + 1;
    NumEntries = AlphabetLength.^Lengths;
    TotalNumEntries = sum(NumEntries);

    %create initial frequency tables
    N = length(a);
    laststring = '1';
    for i = 1:L_Max+1
        laststring = strcat(laststring,num2str(AlphabetLength-1));
    end

    freqlength = base2dec(laststring,AlphabetLength);
    freq = zeros(freqlength,1);

    freqnogaps = zeros(TotalNumEntries,1);

    %find the frequencies of the longest strings and then use these frequencies
    %to determine the frequencies of the shorter string (each will be the sum
    %of the frequencies of the longer string it forms a prefix of)

    %Might be able to make this quicker by adding one symbol to the end of
    %the previous string and removing the appropriate symbol from (near)
    %the start
    for i = 1:N-(L_Max)
        string = '1';
        for j = 1:L_Max+1
            string = strcat(string,num2str(a(i+j-1)));
        end
        index = base2dec(string, AlphabetLength);
        freq(index) = freq(index,1)+1;
    end

    %Need to transfer the frequencies from the '1' prefixed structure to one
    %where there are no gaps in order to easily find frequencies of shorter
    %strings
    count = 1;
    for i = 1:length(freq)
        string = dec2base(i, AlphabetLength);
        if string(1) == '1'
            freqnogaps(count) = freq(i);
            count = count + 1;
        end
    end

    %find other frequencies from frequencies of longest strings
    for i = TotalNumEntries+1:-1:AlphabetLength+2
        freqnogaps(floor((i+AlphabetLength-2)/AlphabetLength)) = ...
            freqnogaps(floor((i+AlphabetLength-2)/AlphabetLength)) + freqnogaps(i);
    end

    freq = zeros(freqlength,1);

    %and then retransfer to the original '1' prefixed structure
    count = 1;
    for i = 2:freqlength
        string = dec2base(i,AlphabetLength);
        if string(1) == '1'
            count = count + 1;
            freq(i) = freqnogaps(count);
        end
    end

    %This is because short strings at the end of the data would otherwise be
    %omitted.
    for i = N-L_Max:N
        for j = 1:L_Max+1
            if (i-j)>N-L_Max-1
                string = '1';
                for k = 1:j
                    string = strcat(string,num2str(a(i-j+k)));
                end
                index = base2dec(string, AlphabetLength);
                freq(index) = freq(index)+1;
            end
        end
    end

    %create another matrix with the string and the frequency to check it looks
    %right
    displayfreq = zeros(length(freq),2);

    for i = 1:length(freq)
        string = dec2base(i,AlphabetLength);
        displayfreq(i,1) = str2double(string);
        displayfreq(i,2)= freq(i);
    end


    sumfreq = sumfreq + freq;

end