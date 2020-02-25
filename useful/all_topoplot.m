%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run
sorted_face_comps = load('sorted_face_comps.txt');
sorted_random_comps = load('sorted_random_comps.txt');

load('phase1_2_all_complexities.mat')

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

%test at big ml
figure(10),clf;
ml10_test = phase2face.all_face_complexities(:,9);
topoplot(ml10_test, 'sorted_coords.xyz','maplimits','maxmin');
%%
figure(1),clf;
topoplot(sorted_face_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face, ml4')
cbar('vert');
set(1, 'PaperUnits', 'centimeters');
set(1, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(1,'phase3_face_ml4_topoplot.png')

figure(2),clf;
topoplot(sorted_random_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random, ml4')
cbar('vert');
set(2, 'PaperUnits', 'centimeters');
set(2, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(2, 'phase3_random_ml4_topoplot.png')

figure(3),clf;
topoplot(phase1_sorted_face_comps,'sorted_coords.xyz','maplimits','maxmin');
title('phase 1 face, ml4')
cbar('vert')
set(3, 'PaperUnits', 'centimeters');
set(3, 'PaperPosition', [0 0 15 15]);
saveas(3, 'phase1_face_ml4_topoplot.png')

figure(4),clf;
topoplot(phase1_sorted_random_comps,'sorted_coords.xyz','maplimits','maxmin');
title('phase 1 random, ml4')
cbar('vert')
set(4, 'PaperUnits', 'centimeters');
set(4, 'PaperPosition', [0 0 15 15]);
saveas(4, 'phase1_random_ml4_topoplot.png')

figure(5),clf;
topoplot(phase2_sorted_face_comps,'sorted_coords.xyz','maplimits','maxmin');
title('phase 2 face, ml4')
cbar('vert')
set(5, 'PaperUnits', 'centimeters');
set(5, 'PaperPosition', [0 0 15 15]);
saveas(5, 'phase2_face_ml4_topoplot.png')

figure(6),clf;
topoplot(phase2_sorted_random_comps,'sorted_coords.xyz','maplimits','maxmin');
title('phase 2 random, ml4')
cbar('vert')
set(6, 'PaperUnits', 'centimeters');
set(6, 'PaperPosition', [0 0 15 15]);
saveas(6, 'phase2_random_ml4_topoplot.png')
