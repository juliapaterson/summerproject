function Tmatrix3 = GetStateSeriesExtractorTmatrix(Classes, i, Tmatrix)

States = Classes(i).States;
numstates = size(Tmatrix,2);

%Need to prevent the state series extractor from ascribing any data to
%states in alternative classes. Do this by setting transitions not to or
%from states in the class we are interested in to zero

for i = 1:numstates
    for j = 1:numstates
        if isempty(find(States==i,1))==1 || isempty(find(States==j,1))==1
            Tmatrix(:,i,j) = 0;
        end
    end
end

Tmatrix3 = Tmatrix;