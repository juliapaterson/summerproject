load('phase3.mat')
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