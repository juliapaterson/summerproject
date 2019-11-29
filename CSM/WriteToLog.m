function WriteToLog(CompleteSigma, NewString, dist2, StateDists, PValueMatrix, ResultMatrix, MatchingState, LogFileName)

AlphabetLength = length(dist2);

fid = fopen(LogFileName, 'a');

fprintf(fid, '%s %s', 'String:', NewString(2:length(NewString))); %Print the string we are concerned with

fprintf(fid, '\n');
fprintf(fid,'\n %s \t', 'String Distribution:' );

for i = 1:AlphabetLength
    fprintf(fid, '%6.2f \t \t', dist2(i)); %Print its distribution
end

fprintf(fid,'\n'); 
fprintf(fid,'\n %s \t', 'State Distributions:');

for i = 1:length(ResultMatrix)
    for j = 1:AlphabetLength
        fprintf(fid, '%6.2f \t \t', StateDists(i,j));
    end
    fprintf(fid, '\n \t \t \t \t \t \t');
end

fprintf(fid, '\n');

%print table headings
fprintf(fid, '%s \t \t %s \t \t %s \t \t %s \n', 'State', 'P Values', 'Results', 'Match');

for i = 1:length(ResultMatrix)
    fprintf(fid, '%i \t \t \t %6.4f \t \t %s \t \t \t \t \t',i-1, PValueMatrix(i), num2str(ResultMatrix(i))');
    if i == MatchingState
        fprintf(fid, '%s \n', 'Yes');
    else
        fprintf(fid, '%s \n', 'No');
    end
end

fprintf(fid, '\n');

for i = 1:size(CompleteSigma,1)
    fprintf(fid, 'State %s \n', num2str(i-1));
    for j = 1:length(CompleteSigma(i,:))
        if CompleteSigma(i,j) ~= 0
        strings = dec2base(CompleteSigma(i,j), AlphabetLength);
        strings = strings(2:length(strings));
        if length(strings)==0
            strings = 'null';
        end
        fprintf(fid, '%s \n', strings);
        end
    end
    fprintf(fid, '\n');
end

fprintf(fid, '%s \n',...
    '______________________________________________________________________');
fprintf(fid, '\n');

status = fclose(fid);
