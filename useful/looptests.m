frontal = [8,9,20,21,22,23,33,34,35];
occipital = [1,2,5,6,10,11,12,13,24];
%%
numlist = {3,6,18};
for k1 = 1:length(numlist)
    fprintf('Number at position %d = %6.2f\n', k1, numlist{k1})
end
%%
load('cssr_derivative_workspace.mat')

%%
all_face_complexities = [];
%for k = [1,2,5,6,10,11,12,13,24]
    face_complexities = [];
    face_timestamps = [];
    for i = 2:10
        %input_name = strcat('ch',num2str(k),'face');
        %input = phase1.(input_name);
        input = samp31;
        %output = strcat('ch',num2str(k),'face');
        try
            tic
                face_complexities = [face_complexities run_CSSR(input, "binary01-alphabet.txt", i, output, true)];
            td = toc;
            face_timestamps = [face_timestamps td];
        catch
            face_complexities = [face_complexities nanmean(face_complexities)]; %if error, set complexity to mean
            face_timestamps = [face_timestamps NaN];
        end
    end
    all_face_complexities = [all_face_complexities; face_complexities];
%end

save('phase3_all_face_complexities','all_face_complexities');
fprintf('done')
%%
tic
run_CSSR(phase1.ch1face, 'binary01-alphabet.txt', 16, output, true);
ml_end = toc;