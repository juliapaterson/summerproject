
function [stateseq, symseq, prob] = Viterbi(a, T, MEAN, VAR, increment, DFName)

clear sizetransmat transmat stateprob pathhistories symbolhistories...
    newpathhistories newsymbolhistories

MEAN = sort(MEAN);
VAR = sort(VAR);

stateseq= zeros(size(a,1),size(a,2)+1);
symseq= zeros(size(a,1),size(a,2));



for row = 1:size(a,1)

    %For the first timestep we don't know any transition probabilities since
    %there is no previous state so we'll have to start at t = 2

    %go through each time step and at each step record the probability of the
    %most probable path and its state and symbol history.
    stateprob = -999999*ones(size(a,2)+1,size(T,3)); %probability of the most probable path
    %ending at state(-,x) at time(t,-)
    stateprob(1,:) = 0; %unknown for first timestep
    pathhistories = zeros(size(a,2)+1, size(T,3)); %list of states visited by most
    %probable path ending at state(-,x) at time(t,-)
    pathhistories(1,:) = 0;%unknown for first timestep - assign impossible value
    symbolhistories = zeros(size(a,2), size(T,3)); %list of symbols assigned to
    %continuous data for most probable path ending at state(-,x) at time(t,-)
    newpathhistories = zeros(size(a,2)+1, size(T,3));
    newsymbolhistories = zeros(size(a,2), size(T,3));
    SizeT = size(T);

    for t = 1:size(a,2)

        %At each time step we need to go through each symbol, find the
        %probability of it being associated with the data point, then find the
        %transitions which emit that symbol when they occur, then calculate the
        %product of (i) the probability of being in the start state of that
        %transition (ii) the transition probability and (iii) the probability
        %of the symbol. Then check to see if the state in which you end up has
        %a probability associated with it which is lower than this product; if
        %so then associate this new probabilty and the state and symbol
        %sequence from the previous state (appended accordingly) otherwise
        %discard this path and continue with the next symbol.  

        for i = 1:increment:SizeT(1)

            if increment == 2
                if a(row, t) > MEAN(ceil((i-1)/2)+1)
                    b = MEAN(ceil((i-1)/2)+1) + 5*(VAR(ceil((i-1)/2)+1)^0.5);
                else
                    b = MEAN(ceil((i-1)/2)+1) - 5*(VAR(ceil((i-1)/2)+1)^0.5);
                end

                emissionprob = AreaCalculator(MEAN(ceil((i-1)/2)+1), VAR(ceil((i-1)/2)+1), a(row, t), b);
                emissionprob = log(emissionprob*2);

            else
                if a(row, t) > MEAN(ceil((i-1)/2)+1)
                    b = MEAN(i) + 5*(VAR(i)^0.5);
                else
                    b = MEAN(i) - 5*(VAR(i)^0.5);
                end

                emissionprob = AreaCalculator(MEAN(i), VAR(i), a(row, t), b);
                emissionprob = log(emissionprob*2);

            end


            %extract relevant part of T
            transmat = T(i,:,:);
            sizetransmat = size(transmat);
            for j = 1:sizetransmat(2)
                if length(sizetransmat) == 2
                    sizetransmat3 = 1;
                else
                    sizetransmat3 = sizetransmat(3);
                end
                for k = 1:sizetransmat3
                    if T(i,j,k)~=0

                        transprob = log(T(i,j,k)); %(from,to)
                        startprob = stateprob(t,j); %zero for first step
                        endprob = startprob+emissionprob+transprob;

                        if endprob>stateprob(t+1,k) %stateprob(t+1) initiated as being a very low value
                            stateprob(t+1,k) = endprob;
                            newpathhistories(1:t,k) = pathhistories(1:t,j);
                            newpathhistories(t+1,k) = k;
                            newsymbolhistories(1:t,k) = symbolhistories(1:t,j);
                            newsymbolhistories(t,k) = i;
                        end
                    end
                end
            end
        end

        pathhistories = newpathhistories;
        symbolhistories = newsymbolhistories;
    end


    [prob, maxstate] = max(stateprob(t+1,:));

    stateseq(row,:) = pathhistories(:,maxstate)';
    symseq(row,:) = symbolhistories(:,maxstate)';

end

%write stateseq to txt file.
FileName = strcat(DFName, '_StateSeries.txt');
fid = fopen(FileName, 'wt');
for i = 1:size(stateseq,1)
    for j = 1:size(stateseq,2)
    fprintf(fid, '%i:', stateseq(i,j)-1);    
    end
    fprintf(fid, '\n');
end
fclose(fid);

%write symseq to txt file.
FileName = strcat(DFName, '_SymbolSeries.txt');
fid = fopen(FileName, 'wt');
for i = 1:size(symseq,1)
    for j = 1:size(symseq,2)
    fprintf(fid, '%i:', symseq(i,j)-1);    
    end
    fprintf(fid, '\n');
end
fclose(fid);




