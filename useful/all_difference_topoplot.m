%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run
%sorted_face_comps = load('sorted_face_comps.txt');
%sorted_random_comps = load('sorted_random_comps.txt');
% all_difference = sorted_face_comps - sorted_random_comps;

load('all_topoplot_vectors.mat');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(all_difference,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference (face-random), ml4')
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf,'phase3_face_ml4_topoplot.png')
