%%
load("differentiated.mat");
%%
frontal = {8 9 20 21 22 23 33 34 35};
occipital = {1 2 5 6 10 11 12 13 24};
%%
for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3.(ch_name) = samp32(:,:,i);
end 
%%
tic
for k = [1,2,5,6,10,11,12,13,24]
    for i = 2:16
        face_complexities = zeros(1,16);
        face_timestamps = zeros(1,16);
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

for k = [1,2,5,6,10,11,12,13,24]
    for i = 2:16
        random_complexities = zeros(1,16);
        random_timestamps = zeros(1,16);
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
end
all_occipital_time = toc;
%%
save('ch2_random_complexities','random_complexities');
save('ch2_random_timestamps','random_timestamps');
save('ch2_face_complexities','face_complexities');
save('ch2_face_timestamps','face_timestamps');