%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run
%sorted_face_comps = load('sorted_face_comps.txt');
%sorted_random_comps = load('sorted_random_comps.txt');
% all_difference = sorted_face_comps - sorted_random_comps;

load('all_topoplot_vectors.mat');
load('phase1_2_all_complexities.mat')

phase12_face_diff = phase1_sorted_face_comps - phase2_sorted_face_comps
phase12_random_diff = phase2_sorted_face_comps - phase2_sorted_random_comps

phase23_face_diff = phase2_sorted_face_comps - sorted_face_comps
phase23_random_diff = phase2_sorted_random_comps - sorted_random_comps

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(all_difference,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference (face-random), ml4')
cbar('vert');
set(1, 'PaperUnits', 'centimeters');
set(1, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(1,'phase3_difference_ml4_topoplot.png')

figure(2),clf;
topoplot(phase12_face_diff,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 1&2 face difference, ml4')
cbar('vert');
set(2, 'PaperUnits', 'centimeters');
set(2, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(2,'phase12_face_diff_ml4_topoplot.png')

figure(3),clf;
topoplot(phase12_random_diff,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 1&2 random difference, ml4')
cbar('vert');
set(3, 'PaperUnits', 'centimeters');
set(3, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(3,'phase12_random_face_diff_ml4_topoplot.png')

figure(4),clf;
topoplot(phase23_face_diff,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 2&3 face difference, ml4')
cbar('vert');
set(4, 'PaperUnits', 'centimeters');
set(4, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(4,'phase23_face_diff_ml4_topoplot.png')

figure(5),clf;
topoplot(phase23_random_diff,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 2&3 random difference, ml4')
cbar('vert');
set(5, 'PaperUnits', 'centimeters');
set(5, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(5,'phase23_random_diff_ml4_topoplot.png')