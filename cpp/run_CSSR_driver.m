%%
load("median_split.mat");
ch1face = samp11(:,:,1);
ch1random = samp12(:,:,1);

%%
complexities = [];
timestamps = [];
for i = 2:16
    try
        tic
            complexities = [complexities run_CSSR(ch1random, "binary01-alphabet.txt", i, "ch1random_output", true)];
        td = toc;
        timestamps = [timestamps td];
    catch
        complexities = [complexities NaN]; %if error, set complexity to nan
        timestamps = [timestamps NaN];
    end
end
%%
plot(2:16, timestamps)
title('time taken for CSSR to run with increasing memory lengths')
xlabel('memory length')
ylabel('time (seconds)')
%%
plot(2:16, complexities)
title('statistical complexity of CSSR epsilon machines with increasing memory length')
xlabel('memory length')
ylabel('statistical complexity')