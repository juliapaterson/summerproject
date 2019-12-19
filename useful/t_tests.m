%%
%independent samples t test
[h,p,ci,stats] = ttest2(phase2_frontal_face.all_face_complexities, phase2_frontal_random.all_random_complexities);

%%
%paired samples
[h,p,ci,stats] = ttest(phase1_occipital_face.all_face_complexities, phase2_occipital_face.all_face_complexities);

%%
[p,tbl,stats] = anova1(phase3_occipital_face.all_face_complexities);