%frontal = [8,9,20,21,22,23,33,34,35];
%occipital = [1,2,5,6,10,11,12,13,24];
%parietal = [3,7,14,15,16,17,18,19,25];
%lefttemporal = [26,28,30,31,36,38,40,42,44];
%righttemporal = [4,27,29,31,37,39,41,43,45];
%%
%load data for CSSR
cd '/home/juliapaterson/CSSR/cpp'
load('cssr_derivative_workspace')
load('split1_workspace')
load('split2_workspace')
load('split3_workspace')
load('split4_workspace')
load('split5_workspace')
load('split6_workspace')
load('split7_workspace')
load('n1_workspace')
%%
%compute CSSR for all channels (k) of interest and all memory lengths (i),
%and save matrices of complexities and timestamps for future analyses

%first compute for face stimuli
all_face_complexities = [];
all_face_timestamps = [];
for k = [1:45] %channel list
    face_complexities = [];
    face_timestamps = [];
    for i = 2:10 %memory lengths
        input_name = strcat('ch',num2str(k),'face');
        input = phase3_split7.(input_name); %select phase/split/input
        output = strcat('ch',num2str(k),'face_split7');
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
    all_face_complexities = [all_face_complexities; face_complexities];
    all_face_timestamps = [all_face_timestamps; face_timestamps];
end

%save complexities and timestamps
save('phase3_face_split7_complexities','all_face_complexities');
save('phase3_face_split7_timestamps','all_face_timestamps');

%compute for random stimuli
all_random_complexities = [];
all_random_timestamps = [];
for k = [1:45]
    random_complexities = [];
    random_timestamps = [];
    for i = 2:10
        input_name = strcat('ch',num2str(k),'random');
        input = phase3_split7.(input_name); %select phase/split/input
        output = strcat('ch',num2str(k),'random_split7'); %specify output file namses
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
    all_random_complexities = [all_random_complexities; random_complexities];
    all_random_timestamps = [all_random_timestamps; random_timestamps];
end

%save complexities and timestamps
save('phase3_random_split7_complexities','all_random_complexities');
save('phase3_random_split7_timestamps ','all_random_timestamps');

fprintf('both split 7 done') %add a print to say what channel its currently at?