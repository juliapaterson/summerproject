load('median_split.mat');
%make alphabet vector [0 1]
alphabet = [0 1];
%make options
option = [0 0 0 1 1 0 0 0]; %set 4 and 5 to one for complexity and entropy
%channel1
test = samp11(:,:,1);
%%
%time
tic;
CSSR(test, alphabet, 9, 0.005, 'test', option);
endtime = toc;

%%
%export to mat
time = [2 11.2887 0.999898; 3 14.5262 2.167095; 4 17.7049 1.205446; 5 24.2127 3.953707; 6 37.7952 3.822579; 7 62.2676 4.939645; 8 137.8394 5.671899; 9 642.2097 6.168013];