function PrintResults(States, freq, AlphabetLength, L_Max, FName)

fid = fopen(FName, 'w');

for i = 2:length(freq)
    string = dec2base(i,AlphabetLength);
    if string(1) == '1'
    fprintf(fid, '%i \t \t \t %s \t \t \t %i \n',i, string(2:length(string)), freq(i));
    end
end

fprintf(fid, '\n');
fprintf(fid, '\n');

%look at the strings in each state.
for i = 1:size(States,1)
    fprintf(fid, 'State %s \n', num2str(i-1));
    for j = 1:length(States(i,:))
        if States(i,j) ~= 0
        strings = dec2base(States(i,j), AlphabetLength);
        strings = strings(2:length(strings));
        fprintf(fid, '%s \n', strings);
        end
    end
    fprintf(fid, '\n');
end

status = fclose(fid);

