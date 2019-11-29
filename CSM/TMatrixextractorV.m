%Code to extract the three dimensional transition matrix (symbol observed
%and transition probabilities) from the output of the CSSR algorithm.


function T = TMatrixextractorV(DFName)

fid = fopen(DFName, 'rt');
Line = 0;

while Line ~= -1
    Line = fgetl(fid);
    if findstr('->',Line)>0
        from = str2double(Line(1:(findstr('->',Line)-2)));
        to = str2double(Line(findstr('->',Line)+3:findstr('[',Line)-2));
        Transprob = str2double(Line(findstr('|',Line)+2:findstr(']',Line)-2));
        out = str2double(Line(findstr('"',Line)+1:findstr('|',Line)-2));
        if mod(out,2) ~= 1
        T(out/2+1,from+1,to+1)= Transprob;
        end
    end
end

fclose(fid);

%Now edit the T matrix such that if some of the states or output symbols
%are not used the appropriate rows and columns are normalised.

SizeT = size(T);
NormalisingFactor = ones(1,SizeT(2));

for i = 1:SizeT(2)
NormalisingFactor(i) = sum(sum(T(:,i,:)));
end

for j = 1:SizeT(2)
    if NormalisingFactor(j) ~= 0
        T(:,j,:) = T(:,j,:)/NormalisingFactor(j);
    end
end

