function sd = CalculateSD(T)

%Find number of states and create state matrix (column)
numstates = max(size(T,2));

Tsimple = zeros(numstates);
%find simple transition matrix
for i = 1:numstates
    for j = 1:numstates
        Tsimple(i,j) = sum(T(:,i,j));
    end
end

%might not be normalised... fix this
rowsums = sum(Tsimple,2);
for i = 1:size(Tsimple,1)
    Tsimple(i,:)=Tsimple(i,:)/rowsums(i);
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
sd = sd/sum(sd);