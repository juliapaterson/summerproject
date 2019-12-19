% %%
% phase1_occipital_face = load('occipital_face_complexities.mat');
% phase1_occipital_random = load('occipital_random_complexities.mat');
% 
% phase2_occipital_face = load('phase2_occipital_face_complexities.mat');
% phase2_occipital_random = load('phase2_occipital_random_complexities.mat');
% 
% phase3_occipital_face = load('phase3_occipital_face_complexities.mat');
% phase3_occipital_random = load('phase3_occipital_random_complexities.mat');
% 
% phase1_frontal_face = load('frontal_face_complexities.mat');
% phase1_frontal_random = load('frontal_random_complexities.mat');
% 
% phase2_frontal_face = load('phase2_frontal_face_complexities.mat');
% phase2_frontal_random = load('phase2_frontal_random_complexities.mat');
% 
% phase3_frontal_face = load('phase3_frontal_face_complexities.mat');
% phase3_frontal_random = load('phase3_frontal_random_complexities.mat');
%%
clf
heatmap(2:10, {'8','9', '20', '21', '22', '23', '33', '34', '35'}, phase3_frontal_face.all_face_complexities)
colormap parula
title('phase 3 face (frontal)')
xlabel('memory length')
ylabel('channel')
%%
heatmap(2:10, {'8','9', '20', '21', '22', '23', '33', '34', '35'}, phase3_frontal_random.all_random_complexities);
colormap parula
title('phase 3 random (frontal)')
xlabel('memory length')
ylabel('channel')
%%
plot(2:10, all_face_complexities)
legend('1','2','5','6','10','11','12','13','24','Location', 'northeast')

%%
plot(2:10, all_random_complexities)
legend('1','2','5','6','10','11','12','13','24','Location', 'northeast')

%%
phase1_occipital_diff = phase1_occipital_face.all_face_complexities - phase1_occipital_random.all_random_complexities;

plot(2:10, phase1_occipital_diff)

%%
plot(2:10, phase3_occipital_face.all_face_complexities)

%%
plot(2:10, phase1_occipital_random.all_random_complexities)