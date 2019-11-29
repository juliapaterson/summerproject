%Code to extract the state series from the data and the machine.

function [stateseq, prob] = StateSeriesExtractor(Tmatrix, data, DFName)

StateSeriesFileName = strcat(DFName,'_StateSeries.txt');
fid = fopen(StateSeriesFileName, 'w');
prob = zeros(size(data,1),1);


for row = 1:size(data,1)
    
    a = data(row,:);

    padding = find(a<0);
    if isempty(padding) == 0
        paddingstart = min(padding);
    else
        paddingstart = length(a) + 1;
    end
    
    Synchronised = 0;
    FromStates = 1:size(Tmatrix,2);
    Present = zeros(size(Tmatrix,2),1);
    counter = 1;
    timestep = 0;

    for i = data(row,1:paddingstart-1)

        timestep = timestep + 1;

        i = i +1;

        if Synchronised == 1
            loopaccessed = 0;
            for j = 1:size(Tmatrix,3)
                if Tmatrix(i,state,j) ~= 0
                    prob(row) = prob(row) + log(Tmatrix(i,state,j));
                    state = j;
                    fprintf(fid, '%i:', state-1);
                    stateseq(row, counter) = state;
                    counter = counter + 1;
                    loopaccessed = loopaccessed + 1;
                    break
                end

            end
            if loopaccessed == 0
                Synchronised = 0;
                count = 1;
                FromStates = 1:size(Tmatrix,2);

                for j = 1:length(FromStates)
                    for k = 1:size(Tmatrix,3)
                        if Tmatrix(i,FromStates(j),k) ~= 0
                            if Present(k) ~= 1
                                ToStates(count) = k;
                                count = count + 1;
                            end
                            Present(k) = 1;
                            break
                        end
                    end
                end

                FromStates = ToStates;
            end

        end
        if Synchronised == 0%if not synchronised

            count = 1;

            for j = 1:length(FromStates)
                for k = 1:size(Tmatrix,3)
                    if Tmatrix(i,FromStates(j),k) ~= 0
                        if Present(k) ~= 1
                            ToStates(count) = k;
                            count = count + 1;
                        end
                        Present(k) = 1;
                        break
                    end
                end
            end

            if length(ToStates) == 1
                Synchronised = 1;

                SynchronisationPoint = timestep;
                state = ToStates;
                fprintf(fid, '%i:', state-1);

                ToStates = [];

                stateseq(row, counter) = state;
                counter = counter + 1;

            else
                FromStates = ToStates;
                ToStates = [];
                Present = zeros(size(Tmatrix,2),1);
                state = '-1';
                fprintf(fid, '%s:', state);

                stateseq(row, counter) = -1;
                counter = counter + 1;

            end

        end
    end

    fprintf(fid, '\n');

end

fclose(fid);


