function WriteDeterminisationLog(Index, FirstDestination, Destination, Sigma, AlphabetLength, DLogFileName)

fid = fopen(DLogFileName, 'a');

string = dec2base(Index,AlphabetLength);

%print the string which is moved
fprintf(fid, '%s %s \n', 'String:', string(2:length(string)));
fprintf(fid, '\n');

%the states it was going to
fprintf(fid, 'String Destinations:   ');
for i= 1:size(Destination,1);
    fprintf(fid, '%s \t', num2str(Destination(i)-1));
end
fprintf(fid, '\n');

%the states the other strings were going to
fprintf(fid, 'State Destinations:    ');
for i= 1:size(FirstDestination,1);
    fprintf(fid, '%s \t', num2str(FirstDestination(i)-1));
end
fprintf(fid, '\n');

%the states now
fprintf(fid, '\n');


for i= 1:size(Sigma,1);
    fprintf(fid, 'State %s:  ', num2str(i-1));
    for j = 1:length(Sigma(i,:))
        if Sigma(i,j) ~= 0
            if j == 1
                strings = dec2base(Sigma(i,j), AlphabetLength);
                strings = strings(2:length(strings));
                fprintf(fid, '%s', strings);
            else
                strings = dec2base(Sigma(i,j), AlphabetLength);
                strings = strings(2:length(strings));
                fprintf(fid, ', %s', strings);
            end
        end
    end
    fprintf(fid, '\n');
end

fprintf(fid, '%s \n',...
    '______________________________________________________________________');
fprintf(fid, '\n');

fclose(fid);
