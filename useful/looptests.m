frontal = [8,9,20,21,22,23,33,34,35];
occipital = [1,2,5,6,10,11,12,13,24];
%%
numlist = {3,6,18};
for k1 = 1:length(numlist)
    fprintf('Number at position %d = %6.2f\n', k1, numlist{k1})
end

%%
for k = [1,2,5,6,10,11,12,13,24]
    for i = 2:5
        face_complexities = [];
        face_timestamps = [];
        input_name = strcat('ch',num2str(k),'face');
        input = phase1.(input_name);
        output = strcat('ch',num2str(k),'face');
        try
            tic
                face_complexities = [face_complexities run_CSSR(input, "binary01-alphabet.txt", i, output, true)];
            td = toc;
            face_timestamps = [face_timestamps td];
        catch
            face_complexities = [face_complexities NaN]; %if error, set complexity to nan
            face_timestamps = [face_timestamps NaN];
        end
    end
end