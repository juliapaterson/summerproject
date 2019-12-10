%%
load("median_split.mat");

%%
ch1face = samp11(:,:,1);
ch1random = samp12(:,:,1);

ch24face = samp11(:,:,24);
ch24random = samp12(:,:,24);

ch10face = samp11(:,:,10);
ch10random = samp12(:,:,10);

ch12face = samp11(:,:,12);
ch12random = samp12(:,:,12);

ch5face = samp11(:,:,5);
ch5random = samp12(:,:,5);

ch6face = samp11(:,:,6);
ch6random = samp12(:,:,6);

ch13face = samp11(:,:,13);
ch13random = samp12(:,:,13);

ch11face = samp11(:,:,11);
ch11random = samp12(:,:,11);

ch2face = samp11(:,:,2);
ch2random = samp12(:,:,2);
%%
face_complexities = [];
face_timestamps = [];
for i = 2:16
    try
        tic
            face_complexities = [face_complexities run_CSSR(ch2face, "binary01-alphabet.txt", i, "ch2face", true)];
        td = toc;
        face_timestamps = [face_timestamps td];
    catch
        face_complexities = [face_complexities NaN]; %if error, set complexity to nan
        face_timestamps = [face_timestamps NaN];
    end
end

random_complexities = [];
random_timestamps = [];
for i = 2:16
    try
        tic
            random_complexities = [random_complexities run_CSSR(ch2random, "binary01-alphabet.txt", i, "ch2random", true)];
        td = toc;
        random_timestamps = [random_timestamps td];
    catch
        random_complexities = [random_complexities NaN]; %if error, set complexity to nan
        random_timestamps = [random_timestamps NaN];
    end
end

save('ch2_random_complexities','random_complexities');
save('ch2_random_timestamps','random_timestamps');
save('ch2_face_complexities','face_complexities');
save('ch2_face_timestamps','face_timestamps');
%%
plot(2:16, face_timestamps)
title('time taken for CSSR to run with increasing memory lengths')
xlabel('memory length')
ylabel('time (seconds)')
%%
plot(2:16, face_complexities)
title('statistical complexity of CSSR epsilon machines with increasing memory length')
xlabel('memory length')
ylabel('statistical complexity')