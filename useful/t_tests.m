%%
%paired samples
[h,p,ci,stats] = ttest(ch24_face.face_complexities, ch24_random.random_complexities);
%%
%2 samples
[h,p,ci,stats] = ttest2(ch24_face.face_complexities, ch24_random.random_complexities);

%%
%[h,p,ci,stats] = ttest(face_avg, random_avg);
[h,p,ci,stats] = ttest2(face_avg, random_avg);