phase1face = load('ch1_face_complexities.mat');
phase2face = load('phase2_ch1face_complexities.mat');
phase1random = load('ch1_random_complexities.mat');
phase2random = load('phase2_ch1random_complexities.mat');

phase3face = load('phase3_ch1face_complexities.mat');
phase3random = load('phase3_ch1random_complexities.mat');
%%
[h,p,ci,stats] = ttest2(phase3face.face_complexities, phase3random.random_complexities);