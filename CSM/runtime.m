load('median_split.mat');
%make alphabet vector [0 1]
alphabet = [0 1];
%make options
option = [0 0 0 1 1 0 0 0]; %set 4 and 5 to one for complexity and entropy
%channel1
test = samp11(:,:,1);
%% probably should do this timing and array creation in a loop so its not disgusting hardcode
%time
tic;
CSSR(test, alphabet, 2, 0.005, 'test', option);
endtime = toc;

%%
%export to mat
time = [2 11.2887 0.999898; 3 14.5262 2.167095; 4 17.7049 1.205446; 5 24.2127 3.953707; 6 37.7952 3.822579; 7 62.2676 4.939645; 8 137.8394 5.671899; 9 642.2097 6.168013];

%%
load('time.mat');

%%
%fit an exponential curve to predict bigger mls
ml = time(:,1,:);
ml_runtime = time(:,2,:);

predict_ml_runtime = fit(ml, ml_runtime, 'exp2');

plot(predict_ml_runtime,ml,ml_runtime)
title('Time taken for CSSR algorithm to run with increasing Memory Lengths')
xlabel('Memory Length') 
ylabel('Time (seconds)') 
%%
%fit a curve to complexity
complexity = time(:,3,:);
predict_ml_complexity = fit(ml, complexity, 'poly7');
plot(predict_ml_complexity, ml, complexity);

title('Statistical Complexity of Epsilon Machines with increasing Memory Lengths')
xlabel('Memory Length') 
ylabel('Complexity') 
legend('data','7th degree polynomial curve')