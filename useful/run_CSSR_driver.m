%frontal = {8 9 20 21 22 23 33 34 35};
%occipital = {1 2 5 6 10 11 12 13 24};

load("differentiated.mat");

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase1.(ch_name) = samp11(:,:,i);
end

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase1.(ch_name) = samp12(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase2.(ch_name) = samp21(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase2.(ch_name) = samp22(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3.(ch_name) = samp31(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3.(ch_name) = samp32(:,:,i);
end 

%save('cssr_derivative_workspace')

all_face_complexities = [];
all_face_timestamps = [];
for k = [1,2,5,6,10,11,12,13,24]
    face_complexities = [];
    face_timestamps = [];
    for i = 2:10
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
    all_face_complexities = [all_face_complexities; face_complexities];
    all_face_timestamps = [all_face_timestamps; face_timestamps];
end
save('occipital_face_complexities','all_face_complexities');
save('occipital_face_timestamps','all_face_timestamps');

all_random_complexities = [];
all_random_timestamps = [];
for k = [1,2,5,6,10,11,12,13,24]
    random_complexities = [];
    random_timestamps = [];
    for i = 2:10
        input_name = strcat('ch',num2str(k),'random');
        input = phase1.(input_name);
        output = strcat('ch',num2str(k),'random');
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

save('occipital_random_complexities','all_random_complexities');
save('occipital_random_timestamps','all_random_timestamps');