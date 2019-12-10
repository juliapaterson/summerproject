%%
load('face_complexities.mat');
load('random_complexities.mat');
%%
comp_diff = face_complexities - random_complexities;

plot(2:16, comp_diff);
title('difference in complexity (face - random)')
xlabel('memory length')
ylabel('difference')

%%
ch1_face = load('ch1_face_complexities.mat');
ch2_face = load('ch24_face_complexities.mat');
load('ch10_face_complexities.mat');
load('ch12_face_complexities.mat');
load('ch5_face_complexities.mat');
load('ch6_face_complexities.mat');
load('ch13_face_complexities.mat');
load('ch11_face_complexities.mat');
load('ch2_face_complexities.mat');

load('ch1_random_complexities.mat');
load('ch24_random_complexities.mat');
load('ch10_random_complexities.mat');
load('ch12_random_complexities.mat');
load('ch5_random_complexities.mat');
load('ch6_random_complexities.mat');
load('ch13_random_complexities.mat');
load('ch11_random_complexities.mat');
load('ch2_random_complexities.mat');