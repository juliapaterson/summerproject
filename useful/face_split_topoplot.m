%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run

% face_split1 = load('face_split1.txt');
% face_split2 = load('face_split2.txt');
% face_split3 = load('face_split3.txt');
% face_split4 = load('face_split4.txt');
% face_split5 = load('face_split5.txt');
% face_split6 = load('face_split6.txt');
% face_split7 = load('face_split7.txt');

load('face_split_vectors.mat');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab

figure(1),clf;
topoplot(face_split1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 1 ml4');
cbar('vert');
saveas(1, 'phase3_face_split1_ml4_topoplot.png')

figure(2),clf;
topoplot(face_split2,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 2 ml4');
cbar('vert');
saveas(2, 'phase3_face_split2_ml4_topoplot.png')

figure(3),clf;
topoplot(face_split3,'sorted_coords.xyz','maplimits','maxmin');
title('phase 3 face split 3 ml4');
cbar('vert');
saveas(3,'phase3_face_split3_ml4_topoplot.png')

figure(4),clf;
topoplot(face_split4,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 4 ml4');
cbar('vert');
saveas(4, 'phase3_face_split4_ml4_topoplot.png')

figure(5),clf;
topoplot(face_split5,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 5 ml4');
cbar('vert');
saveas(5, 'phase3_face_split5_ml4_topoplot.png')

figure(6),clf;
topoplot(face_split6,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 6 ml4');
cbar('vert');
saveas(6, 'phase3_face_split6_ml4_topoplot.png')

figure(7),clf;
topoplot(face_split7,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 7 ml4');
cbar('vert');
saveas(7, 'phase3_face_split4_ml7_topoplot.png')