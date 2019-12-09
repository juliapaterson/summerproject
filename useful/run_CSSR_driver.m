load("median_split.mat");
ch1face = samp11(:,:,1);

complexities = [];
timestamps = [];
for i = 2:16
    tic
    complexities = [complexities run_CSSR(ch1face, "binary01-alphabet.txt", i, "ch1face_output", true)];
    td = toc;
    timestamps = [timestamps td];
end

%%
plot(2:16, timestamps)
title('time taken for CSSR algorithm to run with increasing memory lengths')
xlabel('memory length')
ylabel('time (seconds)')

%%
plot(2:16, complexities)
title('statistical complexity of CSSR epsilon machines with increasing memory lengths')
xlabel('memory length')
ylabel('statistical complexity')