function [stateseq, symseq, prob, numstates] = CSSR(data, Alphabet, L_Max, alpha, DFName, options, varargin)

%Append L value used to Data File name
DFName = strcat(DFName,'L',num2str(L_Max));

%Extract and assign optional arguments
if isempty(varargin) ==0
    if strcmpi(varargin{1}, 'noncom') == 1
        increment = 2;
        MEAN = varargin{2};
        VAR = varargin{3};
        MPs = varargin{4};
        bestN = varargin{5};
        continuousdata = varargin{6};
    end
else
    increment = 1;
end

%define parameter
AlphabetLength=length(Alphabet);

%run parser to get history frequencies
freq = Parser(data, L_Max, AlphabetLength);
N = length(data);

%Determine the causal states
CompleteSigma = FindCausalStates(freq, AlphabetLength, L_Max, alpha, DFName, increment);

%print results
PrintResults...
    (CompleteSigma,...
    freq,...
    AlphabetLength,...
    L_Max,...
    strcat(DFName,'_States1.txt'));

%Determinise machine
DeterminisedStates = DeterminiserVI...
    (CompleteSigma,...
    L_Max,...
    AlphabetLength,...
    increment,...
    DFName);

%print results
PrintResults...
    (DeterminisedStates,...
    freq,...
    AlphabetLength,...
    L_Max,...
    strcat(DFName,'_States2.txt'));

%Extract transition matrix
[Tmatrix,TruncatedTransitions] = Transitions(DeterminisedStates,...
    freq,...
    AlphabetLength,...
    L_Max,...
    increment);

%Write Dot file for machine
DotFileWriter...
    (strcat(DFName,'dot.txt'),...
    Tmatrix,...
    TruncatedTransitions);

Graphfilename = strcat(DFName,'Full.txt');
%Display and save images of full machine
if options(1) == 1 || options(2) == 1
    DisplayGraph(strcat(DFName,'dot.txt'), Graphfilename, options)
end

Classes = MachineEditorIV(strcat...
    (DFName,'dot.txt'), Tmatrix, options);

OriginalDFName = DFName;
for i = 1:max(size(Classes))

    Tmatrix2 = Classes(i).T;
    if max(size(Classes)) ~= 1
    DFName = strcat(OriginalDFName, 'C', num2str(i));
    end
    numstates = length(Classes(i).States);

    %Extract state series or most probable state series in the case of
    %noncommittal discretisation of continuous data
    if increment == 1
        Tmatrix3 = GetStateSeriesExtractorTmatrix(Classes, i, Tmatrix);
        [stateseq, prob] = StateSeriesExtractor(Tmatrix3, data, DFName);
        symseq = data;
    else

        [stateseq, symseq, prob] = Viterbi...
            (continuousdata,...
            Tmatrix,...
            MEAN,...
            VAR,...
            increment,...
            DFName);
    end

    %Run the inferred machine to generate another data set with which to
    %estimate the accuracy of the inferred machine
    if sum(options(6:8)) >0
        [data2] = InferredMachineRunner(Tmatrix2, N);

        %find word frequencies of new data set
        freq2 = Parser(data2, L_Max, AlphabetLength);
    else
        freq2 = 0;
    end

    %Calculate metrics of the machine
    MetricCalculator...
        (Tmatrix2,...
        freq,...
        freq2,...
        L_Max,...
        numstates,...
        DFName,...
        options);
    
end