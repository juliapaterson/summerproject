function  Classes = MachineEditorIV(DFName, Tmatrix, options)

clear adjacencymatrix

DotFile = DFName;

%extract adjacency matrix
%open dotfile
fid = fopen(DotFile, 'rt');

Line =1;
adjacencymatrix = 0;

while Line ~=-1
    Line = fgetl(fid);
    Location = findstr('>',Line);
    Location2 = findstr('[',Line);
    if Line ~=-1
        if isempty(Location)==0
            start = str2double(Line(1:Location-2));
            finish = str2double(Line(Location+2: Location2-1));
            adjacencymatrix(start+1,finish+1) = 1;
        end
    end
end

%close file
fclose(fid);

%Make sure it's square
newadjacencymatrix = zeros(max(size(adjacencymatrix)));
newadjacencymatrix(1:size(adjacencymatrix,1),1:size(adjacencymatrix,2)) = adjacencymatrix;
adjacencymatrix = newadjacencymatrix;

%Find Reachability matrix - element is 1 if you can get to i from j, 0
%otherwise
R = (eye(length(adjacencymatrix))+adjacencymatrix)^(length(adjacencymatrix)-1)>0;

%Find Communication matrix - element is 1 if you can get to i from j and to
%j from i, 0 otherwise
C = R&R';

%Find communication classes
[U, m, n] = unique(C,'rows');

%Find out which are transient and which are recurrent
%Find 'Image matrix' - connections between communication classes
M = U*adjacencymatrix*U'>0;

Numberofrecurrentclasses = 0;
Numberoftransientclasses = 0;

%If the row sum of M is 1 the communication class is closed.
count =0;
for i = 1:size(M,2)
    if sum(M(i,:))==1 && M(i,i) == 1
        count = count + 1;
        Classes(count).States = find(n==i);
        Numberofrecurrentclasses = Numberofrecurrentclasses + 1;
    else
        Numberoftransientclasses = Numberoftransientclasses + 1;
    end
end

%output warning
if Numberofrecurrentclasses ~= 1 && Numberoftransientclasses ~= 1
    outstring = horzcat('There are ', num2str(Numberofrecurrentclasses),...
        ' closed communication classes.');
    disp(outstring)
    disp('This is unusual. You may wish to increase alpha or L and re-run.')
    disp('CSSR will output machines, state series and metrics for all closed communication classes')
end

for i = 1:Numberofrecurrentclasses
    %function to extract from the entire T matrix a T matrix for just one of
    %the multiple closed communication classes.
    Classes(i).T = FindTmatrixForClosedClass(Tmatrix, Classes, i);

    %Write dot files
    %open dot file
    fid = fopen(DotFile, 'rt');

    %designate a new filename and open that
    NewDotFile = strcat(DFName(1:length(DFName)-7), 'Final', num2str(i),'dot.txt');
    fid2 = fopen(NewDotFile, 'wt');

    %then erase (by not copying) all edges not present in adjacency matrix
    ClassStates = Classes(i).States -1;
    Line =1;
    while Line ~=-1
        Line = fgetl(fid);
        Location = findstr('>',Line);
        if Line ~=-1
            if isempty(Location)==0
                start = str2double(Line(1:Location-2));
                %copy (i.e. retain) edge if it starts from one of the
                %states in the class (since the class is closed if it
                %starts in the class it must end in the class)
                if isempty(find(ClassStates==start,1)) == 0
                    fprintf(fid2, '%s\n', PreviousLine);
                    fprintf(fid2, '%s\n', Line);
                end
            else
                if Line(1) == 'e'
                    PreviousLine = Line; 
                else
                    fprintf(fid2, '%s\n', Line);
                end
            end
        end
    end

    %close file
    fclose(fid);
    fclose(fid2);

    if options(1) == 1 || options(2) == 1
        DisplayGraph(NewDotFile, NewDotFile(1:length(NewDotFile)-3), options)
    end
    
end