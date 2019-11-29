%Function to write the dot file preliminary to outputting the graph of the
%machine.

function DotFileWriter(FName, Tmatrix, TruncatedTransitions)

fid = fopen(FName, 'w');
location = findstr('.',FName);
FName(location) = [];
fprintf(fid, 'digraph %s {\n', FName);
fprintf(fid, 'size = "6,8.5";\n');
fprintf(fid, 'ratio = "fill";\n');
fprintf(fid, 'node [shape = circle];\n');
fprintf(fid, 'node [fontsize = 24];\n');
fprintf(fid, 'edge [fontsize = 24];\n');

for i = 1:size(Tmatrix, 1)
    for j = 1:size(Tmatrix, 2)
        for k = 1:size(Tmatrix, 3)
            prob = Tmatrix(i,j,k);
            if prob ~= 0
                if TruncatedTransitions(i,j,k) == 1
                    fprintf(fid, 'edge [color=red];\n');
                end
                fprintf(fid, '%i -> %i [label = "%i | %6.5f"];\n', j-1, k-1, (i-1), prob);
                if TruncatedTransitions(i,j,k) == 1
                    fprintf(fid, 'edge [color=black];\n');
                end
            end
        end
    end
end


fprintf(fid, '}\n');

fclose(fid);