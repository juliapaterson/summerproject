%Function to take a list of states in a given closed communication class
%and the transition matrix for the whole machine and return a transition
%matrix for just the states in that class.

function T = FindTmatrixForClosedClass(Tmatrix, Classes, i)

States = Classes(i).States;

for i = 1:length(States)
    for j = 1:length(States)
        T(:,i,j) = Tmatrix(:,States(i),States(j));
    end
end
