%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run
sorted_face_comps = load('sorted_face_comps.txt');
sorted_random_comps = load('sorted_random_comps.txt');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(sorted_face_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face, ml4')
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf,'phase3_face_ml4_topoplot.png')

figure(2),clf;
topoplot(sorted_random_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random, ml4')
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_random_ml4_topoplot.png')