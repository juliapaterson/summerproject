%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run

% random_split1 = load('random_split1.txt');
% random_split2 = load('random_split2.txt');
% random_split3 = load('random_split3.txt');
% random_split4 = load('random_split4.txt');
% random_split5 = load('random_split5.txt');
% random_split6 = load('random_split6.txt');
% random_split7 = load('random_split7.txt');

load('random_split_vectors.mat');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(random_split1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 1 ml4');
cbar('vert');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 15 15]); %x_width=10cm y_width=15cm
saveas(gcf, 'phase3_random_split1_ml4_topoplot.png')

figure(2),clf;
topoplot(random_split2,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 2 ml4');
cbar('vert');
saveas(2, 'phase3_random_split2_ml4_topoplot.png')

figure(3),clf;
topoplot(random_split3,'sorted_coords.xyz','maplimits','maxmin');
title('phase 3 random split 3 ml4');
cbar('vert');
saveas(3,'phase3_random_split3_ml4_topoplot.png')

figure(4),clf;
topoplot(random_split4,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 4 ml4');
cbar('vert');
saveas(4, 'phase3_random_split4_ml4_topoplot.png')

figure(5),clf;
topoplot(random_split5,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 5 ml4');
cbar('vert');
saveas(5, 'phase3_random_split5_ml4_topoplot.png')

figure(6),clf;
topoplot(random_split6,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 6 ml4');
cbar('vert');
saveas(6, 'phase3_random_split6_ml4_topoplot.png')

figure(7),clf;
topoplot(random_split7,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random split 7 ml4');
cbar('vert');
saveas(7, 'phase3_random_split4_ml7_topoplot.png')