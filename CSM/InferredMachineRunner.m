%run inferred machine

%code to take the transition matrix and run the model so as to generate a
%new set of observations
%Other inputs required are the number of observations required

function [s, stateseq, logprob] = InferredMachineRunner(T, N)

eigval = 0;
sumsdnorm = 0;

%Find number of states
numstates = max(size(T,2));

Tsimple = zeros(numstates);
%find simple transition matrix
for i = 1:numstates
    for j = 1:numstates
        Tsimple(i,j) = sum(T(:,i,j));
    end
end

Out = zeros(numstates);
%find output symbol matrix
for i = 1:numstates
    for j = 1:numstates
        [maxsym, Out(i,j)] = max(T(:,i,j));
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

%assigning initial distribution...
Random = rand;

%...defining cumulative stationary distribution
cumsd = zeros(1,numstates);
for n = 1:max(size(sd))
    sumsdnorm = sumsdnorm + sdnorm(n);
    cumsd(n) = sumsdnorm;
    if Random <= cumsd(n)
        CurrentState = n;
        break
    end
end

s = zeros(1,N);
Transitionprob = zeros(1,N);
stateseq = zeros(1,N);

for i = 1:N

    %resetting variable
    sumtps = 0;
    Random = rand;

    %isolating appropriate row of transition matrix, picking next
    %transition and updating distribution matrix
    tps(:,:) = T(:,CurrentState,:);
    for j= 1:size(T,3)
        for k = 1:size(T,1)
            sumtps = sumtps + tps(k,j);
            if Random <= sumtps
                CurrentState = j;
                stateseq(i) = j;
                s(i) = k-1;
                Transitionprob(i) = tps(k,j);
                break
            end
        end
        if Random <= sumtps
            break
        end
    end

end


logprob = sum(log(Transitionprob));