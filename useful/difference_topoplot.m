%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'
load('face_split_vectors.mat');
load('random_split_vectors.mat');

difference_split1 = face_split1 - random_split1;
difference_split2 = face_split2 - random_split2;
difference_split3 = face_split3 - random_split3;
difference_split4 = face_split4 - random_split4;
difference_split5 = face_split5 - random_split5;
difference_split6 = face_split6 - random_split6;
difference_split7 = face_split7 - random_split7;

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(difference_split1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 1 ml4');
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_difference_split1_ml4_topoplot.png')

figure(2),clf;
topoplot(difference_split2,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 2 ml4');
cbar('vert');
saveas(2, 'phase3_difference_split2_ml4_topoplot.png')

figure(3),clf;
topoplot(difference_split3,'sorted_coords.xyz','maplimits','maxmin');
title('phase 3 difference split 3 ml4');
cbar('vert');
saveas(3,'phase3_difference_split3_ml4_topoplot.png')

figure(4),clf;
topoplot(difference_split4,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 4 ml4');
cbar('vert');
saveas(4, 'phase3_difference_split4_ml4_topoplot.png')

figure(5),clf;
topoplot(difference_split5,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 5 ml4');
cbar('vert');
saveas(5, 'phase3_difference_split5_ml4_topoplot.png')

figure(6),clf;
topoplot(difference_split6,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 6 ml4');
cbar('vert');
saveas(6, 'phase3_difference_split6_ml4_topoplot.png')

figure(7),clf;
topoplot(difference_split7,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 difference split 7 ml4');
cbar('vert');
saveas(7, 'phase3_difference_split4_ml7_topoplot.png')