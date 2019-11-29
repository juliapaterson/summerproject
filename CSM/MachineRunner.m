
function [a, s, stateseq, logprob, T] = MachineRunner(MEAN, VAR, N, options, varargin)

option = varargin{1};

if nargin > 4
    if option == 0
        DFName = varargin{2};
    end
end

if option == 0

    T = TMatrixextractor(DFName);

elseif option == 1 %stretched golden mean process (k = 2)

    T(1,:,:)= [0 0.5 0;...
        0 0 1;...
        0 0 0];

    T(2,:,:) = [0.5 0 0;...
        0 0 0;...
        1 0 0];
FileName = strcat('Option',num2str(option),'.txt');

    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)
    
elseif option == 2 %goldenmean process

    T(1,:,:) = [0 0.5;...
        0 0];

    T(2,:,:) = [0.5 0;...
        1 0];
FileName = 'GoldenMean.txt';
    
    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)
    
elseif option == 3 %even process

    T(1,:,:) = [0 0.5;...
        1 0];

    T(2,:,:) = [0.5 0;...
        0 0];

    FileName = 'EvenProcess.txt';
    
    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)
    
elseif option == 4 %simple nondeterministic process

    T(1,:,:) = [0 0;...
        0.5 0];

    T(2,:,:) = [0.5 0.5;...
        0 0.5];
FileName = strcat('Option',num2str(option),'.txt');
    
    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)
    
elseif option == 5 %nondeterministic contrived example

    T(1,:,:) = [0 0.6 0 0;...
        0 0 0 1;
        0 0 0 1;
        0 0 0 0];

    T(2,:,:) = [0 0 0.4 0;...
        0 0 0 0;
        0 0 0 0;
        1 0 0 0];
    
    FileName = strcat('Option',num2str(option),'.txt');
    
    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)
    
elseif option == 6 %FRET like process

    T(1,:,:) = [0.92 0;...
        0.12 0];

    T(2,:,:) = [0 0.08;...
        0 0.88];

FileName = strcat('Option',num2str(option),'.txt');
    
    DotFileWriter(FileName, T, T*0)
    DisplayGraph(FileName, FileName, options)

end

%Catch error if the size of Mean and Var is not the same as the number of
%symbols
if length(MEAN) ~= size(T,1)
   str1 = 'Alphabet size (';
   str2 = num2str(length(MEAN));
   str3 = ') inconsistent with transition matrix (';
   str4 = num2str(size(T,1));
   str5 = ' symbols)';
   errorstring = [str1 str2 str3 str4 str5];
   errordlg(errorstring) 
   a = 0;
   s = 0;
   stateseq = 0;
   logprob = 0;
   return
end

%numsteps = 3000;
eigval = 0;
sumsdnorm = 0;

%Find number of states and create state matrix (column)
numstates = max(size(T,2));

Tsimple = zeros(numstates);
%find simple transition matrix
for i = 1:numstates
    for j = 1:numstates
        Tsimple(i,j) = sum(T(:,i,j));
    end
end

%Get a cumulative transition probability matrix
%for each from state, cycle through the outsymbols and the to states and
%replace each probability with the sum of all probabilities seen thus far.
%(for that from state - i.e. the sum of T(:,from,:) should be 1)

CumulativeT = zeros(size(T));
for i = 1:numstates
    sumtp = 0;
    for j = 1:numstates
        for k = 1:size(T,1)
            sumtp = sumtp + T(k,i,j);
            CumulativeT(k,i,j)= sumtp;
        end
    end
end

%find left eigenvectors
[W,D] = eig(Tsimple.');
W = conj(W);

%finding eigenvector with eigenvalue 1
mindiff = 999;
for n = 1:max(size(Tsimple))
    diff = abs(D(n,n) - 1);
    if diff < mindiff
        eigval = n;
        mindiff = diff;
    end
end

%defining stationary distribution
sd = W(:,eigval);

%normalizing stationary distribution
sdnorm = sd/sum(sd);

%defining cumulative stationary distribution
for n = 1:max(size(sd))
    sumsdnorm = sumsdnorm + sdnorm(n);
    cumsd(n) = sumsdnorm;
end

%assigning initial distribution
Random = rand;

for n = 1:max(size(cumsd))
    if Random <= cumsd(n)
        CurrentState = n;
        break
    end
end

a = zeros(1,N);
s = zeros(1,N);
Transitionprob = zeros(1,N);
stateseq = zeros(1,N);

for i = 1:N

    %resetting variable
    Random = rand;
    resetnandm = 0;
    
    for n= 1:numstates
        for m = 1:size(T,1)
            if Random <= CumulativeT(m,CurrentState,n)
                Transitionprob(i) = T(m,CurrentState,n);
                CurrentState = n;
                stateseq(i) = n;
                s(i) = m;
                resetnandm = 1;
                break
            end
        end
        if resetnandm == 1
            resetnandm = 0;
            break
        end
    end

    a(i)= MEAN(s(i))+VAR(s(i)).^0.5*randn;


end

logprob = sum(log(Transitionprob))/log(2);