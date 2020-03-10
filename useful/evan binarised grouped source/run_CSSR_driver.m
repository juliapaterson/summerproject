%frontal = [8,9,20,21,22,23,33,34,35];
%occipital = [1,2,5,6,10,11,12,13,24];
%parietal = [3,7,14,15,16,17,18,19,25];
%lefttemporal = [26,28,30,31,36,38,40,42,44];
%righttemporal = [4,27,29,31,37,39,41,43,45];
%%
%load data for CSSR (depending on what you want to run it on)
cd '/home/juliapaterson/CSSR/cpp'
%load('cssr_derivative_workspace')
%load('concat_workspace')
%load('source_workspace')
%load('source_grouped_df_workspace.mat')
%load('source_grouped_ms_workspace.mat')

%load('evan_grouped_ms_workspace.mat')
load('evan_grouped_diff_workspace.mat')

% load('split1_workspace')
% load('split2_workspace')
% load('split3_workspace')
% load('split4_workspace')
% load('split5_workspace')
% load('split6_workspace')
% load('split7_workspace')
% load('n1_workspace')
%%
%compute CSSR for all channels (k) of interest and all memory lengths (i),
%and save matrices of complexities and timestamps for future analyses

%first compute across both stimuli
all_both_complexities = [];
all_both_timestamps = [];
for k = 1:4 %channel list
    both_complexities = [];
    both_timestamps = [];
    current_char = strcat('channel ',num2str(k),' both source grouped diff complete');
    for i = 1:17  %memory lengths
        input_name = strcat('ch',num2str(k),'both');
        input = source_both_grouped.(input_name); %select phase/split/input
        output = strcat('ch',num2str(k),'_both_grouped_diff_');
        try
            tic
                both_complexities = [both_complexities run_CSSR(input, "binary01-alphabet.txt", i, output, true)];
            td = toc;
            both_timestamps = [both_timestamps td];
        catch
            both_complexities = [both_complexities NaN]; %if error, set complexity to nan
            both_timestamps = [both_timestamps NaN];
        end
    
    end
    fprintf(current_char)
    all_both_complexities = [all_both_complexities; both_complexities];
    all_both_timestamps = [all_both_timestamps; both_timestamps];
end

%save complexities and timestamps
save('phase3_both_grouped_diff_complexities','all_both_complexities');
save('phase3_both_grouped_diff_timestamps','all_both_timestamps');

fprintf('phase 3 both source grouped diff complete')

%%
%compute for face stimuli
all_face_complexities = [];
all_face_timestamps = [];
for k = 1:4 %channel list
    face_complexities = [];
    face_timestamps = [];
    current_char = strcat('channel ',num2str(k),' face source grouped diff complete');
    for i = 1:17  %memory lengths
        input_name = strcat('ch',num2str(k),'face');
        input = source_face_grouped.(input_name); %select phase/split/input
        output = strcat('ch',num2str(k),'_face_grouped_diff_');
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
    fprintf(current_char)
    all_face_complexities = [all_face_complexities; face_complexities];
    all_face_timestamps = [all_face_timestamps; face_timestamps];
end

%save complexities and timestamps
save('phase3_source_face_grouped_diff_complexities','all_face_complexities');
save('phase3_source_face_grouped_diff_timestamps','all_face_timestamps');

fprintf('phase 3 face source grouped diff complete')

%%
%compute for random stimuli
all_random_complexities = [];
all_random_timestamps = [];
for k = 1:4
    random_complexities = [];
    random_timestamps = [];
    current_char = strcat('channel ',num2str(k),' random source grouped diff complete');
    for i = 1:17
        input_name = strcat('ch',num2str(k),'random');
        input = source_random_grouped.(input_name); %select phase/split/input
        output = strcat('ch',num2str(k),'_both_grouped_diff_'); %specify output file names
        try
            tic
                random_complexities = [random_complexities run_CSSR(input, "binary01-alphabet.txt", i, output, true)];
            td = toc;
            random_timestamps = [random_timestamps td];
        catch
            random_complexities = [random_complexities NaN]; %if error, set complexity to nan
            random_timestamps = [random_timestamps NaN];
        end
    end
    fprintf(current_char)
    all_random_complexities = [all_random_complexities; random_complexities];
    all_random_timestamps = [all_random_timestamps; random_timestamps];
end

%save complexities and timestamps
save('phase3_source_random_grouped_diff_complexities','all_random_complexities');
save('phase3_source_random_grouped_diff_timestamps ','all_random_timestamps');
 
fprintf('phase 3 random source grouped diff complete')