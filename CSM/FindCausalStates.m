%Find causal states

function CompleteSigma = FindCausalStates(freq, AlphabetLength, L_Max, alpha, DFName, increment)

LogFileName = strcat(DFName,'_Log.txt');

fid = fopen(LogFileName,'w');
fprintf(fid,'%s \n \n %s \n %s', 'Initial State:', 'State 0', 'null');
fprintf(fid,'\n %s \n \n',...
    '______________________________________________________________________');
fclose(fid);

%Initialise Sigma (the set of states). To begin with we have one state
%consisting of one string '_' prefixed by '1' (see below).
Sigma = 1;
NewSigma = 0;
NewStateSize = 0;
CompleteSigma = Sigma;
StateSize = 1;

L=0;

%Finding max number of strings for preallocating the size of StateMorphs to save time
LastString = '1';
for i = 1:L_Max
    LastString = strcat(LastString,num2str(AlphabetLength-1));
end
IndexLimit = base2dec(LastString,AlphabetLength)+1;


while L < L_Max

    %First we find the future morphs of all of the states to compare the
    %future morphs of the new strings to, also record the length so the
    %actual morph can be retrieved without extra zeros on the end, since
    %they will be of different lengths in general.

    StateMorphs = zeros(size(Sigma,1),IndexLimit);
    StateDists = zeros(size(Sigma,1),AlphabetLength);
    LengthStateMorphs = zeros(size(Sigma,1),1);
    for i = 1:size(Sigma,1)
        [StateMorph, dist1] = EstProb1(CompleteSigma, i, freq, AlphabetLength, increment);
        StateMorphs(i, 1:length(StateMorph)) = StateMorph;
        StateDists(i,1:AlphabetLength) = dist1;
        LengthStateMorphs(i) = length(StateMorph);
    end

    for S = 1:size(Sigma,1)%for each state, S, in Sigma
        for X = 1:length(Sigma(S,:))%for each string, X, in S
            x = Sigma(S,X);
            if x ~= 0
                x = dec2base(x,AlphabetLength);
                for A = 0:increment:AlphabetLength-1 %for each symbol, A, in the alphabet
                    a = num2str(A);
                    NewString = strcat('1',a,x(2:length(x))); %construct the new string
                    NewStringFreq = freq(base2dec(NewString,AlphabetLength));
                    if NewStringFreq > 0 %if the string is observed in the data
                        [p2,dist2] = EstProb2(a, x, freq, AlphabetLength, increment);

                        %Now find the p values of the tests comparing the
                        %morph of the new string with all of the existing
                        %states

                        PValueMatrix = zeros(size(StateMorphs,1),1);
                        ResultMatrix = -1*ones(size(StateMorphs,1),1);

                        for i = 1:size(StateMorphs,1)

                            [result, p] = Test(StateMorphs(i,1:LengthStateMorphs(i)), p2, StateDists(i,1:AlphabetLength), dist2, alpha); %1 for reject 0 for accept
                            
                            PValueMatrix(i) = p;
                            ResultMatrix(i) = result;
                        end

                        [MaxPValue, BestMatchingState] = max(PValueMatrix);
                        if ResultMatrix(BestMatchingState) == 0
                            MatchingState = BestMatchingState;
                        else
                            MatchingState = size(CompleteSigma,1)+1;
                        end

                        if ResultMatrix(BestMatchingState) == 0 %hypothesis passed

                            %Assign string to appropriate state
                            NewSigma(BestMatchingState, NewStateSize(BestMatchingState) + 1) = base2dec(strcat('1', a, x(2:length(x))),AlphabetLength);
                            NewStateSize(BestMatchingState) = NewStateSize(BestMatchingState) + 1;
                            CompleteSigma(BestMatchingState,StateSize(BestMatchingState)+1) = NewSigma(BestMatchingState, NewStateSize(BestMatchingState));
                            StateSize(BestMatchingState) = StateSize(BestMatchingState) + 1;

                            %write results to log
                            WriteToLog(CompleteSigma, NewString, dist2, StateDists, PValueMatrix, ResultMatrix, MatchingState, LogFileName);

                            %re-estimate state distribution now new string is included
                            [StateMorph, dist1] = EstProb1(CompleteSigma, BestMatchingState, freq, AlphabetLength, increment);
                            StateMorphs(BestMatchingState, 1:length(StateMorph)) = StateMorph;
                            StateDists(BestMatchingState,1:AlphabetLength) = dist1;
                            LengthStateMorphs(BestMatchingState) = length(StateMorph);

                        else %hypothesis rejected

                            %Create new state and assign string
                            NewSigma(size(NewSigma,1)+1,1) = base2dec(strcat('1', a, x(2:length(x))),AlphabetLength);
                            NewStateSize(size(NewSigma,1)) = 1;
                            CompleteSigma(size(CompleteSigma,1)+1,1) = base2dec(strcat('1', a, x(2:length(x))),AlphabetLength);
                            StateSize(size(CompleteSigma,1)) = 1;

                            %write results to log
                            WriteToLog(CompleteSigma, NewString, dist2, StateDists, PValueMatrix, ResultMatrix, MatchingState, LogFileName);

                            %estimate state distribution for new state
                            [StateMorph, dist1] = EstProb1(CompleteSigma, size(CompleteSigma,1), freq, AlphabetLength, increment);
                            StateMorphs(size(CompleteSigma,1), 1:length(StateMorph)) = StateMorph;
                            StateDists(MatchingState,1:AlphabetLength) = dist1;
                            LengthStateMorphs(size(CompleteSigma,1)) = length(StateMorph);


                        end %end if hypothesis test passed
                    end %end if newstring observed in date
                end %next symbol in alphabet
            end %end if
        end %next string
    end %next state
    L = L+1;

    if L == 1 %if this is the first iteration get rid of the state containing the null string
        %or remove the null string from its state

        CompleteSigma(1,1) = 0;
        if sum(CompleteSigma(1,:)) == 0
            CompleteSigma(1,:) = [];
            StateSize(1) = [];
            StateMorphs(1) = [];
            LengthStateMorphs(1) = [];
        else
            CompleteSigma(1,1:length(CompleteSigma(1,:))-1) =...
                CompleteSigma(1,2:length(CompleteSigma(1,:)));
            CompleteSigma(1,length(CompleteSigma(1,:))) = 0;
            StateSize(1) = StateSize(1) - 1;
            [StateMorph, dist1] = EstProb1(CompleteSigma, 1, freq, AlphabetLength, increment);
            StateMorphs(1, 1:length(StateMorph)) = StateMorph;
            StateDists(i,1:AlphabetLength) = dist1;
            LengthStateMorphs(1) = length(StateMorph);
        end
    end
    if L == 1
        Sigma = CompleteSigma;
    else
        Sigma = NewSigma;
    end
    NewSigma = zeros(size(Sigma,1),1);
    NewStateSize = zeros(size(Sigma,1),1);

end