n1_face = load('phase3_face_n1_complexities.mat');
n1_random = load('phase3_random_n1_complexities.mat');

cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run;
% load('face_n1.txt')
% load('random_n1.txt')
load('single_trial_n1_vectors.mat');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(face_n1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face n1 ml4');
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_face_n1_ml4_topoplot.png')

figure(2),clf;
topoplot(random_n1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random n1 ml4');
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_face_n1_ml4_topoplot.png')

difference_n1 = face_n1 - random_n1;

figure(3),clf;
topoplot(difference_n1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 n1 difference ml4');
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_difference_n1_ml4_topoplot.png')