% %%
%phase1_occipital_face = load('occipital_face_complexities.mat');
%phase1_parietal_random = load('occipital_random_complexities.mat');

%phase2_occipital_face = load('phase2_occipital_face_complexities.mat');
%phase2_occipital_random = load('phase2_occipital_random_complexities.mat');

% phase3_occipital_face = load('phase3_occipital_face_complexities.mat');
% phase3_occipital_random = load('phase3_occipital_random_complexities.mat');
% 
% %phase1_frontal_face = load('frontal_face_complexities.mat');
% %phase1_frontal_random = load('frontal_random_complexities.mat');
% 
% %phase2_frontal_face = load('phase2_frontal_face_complexities.mat');
% %phase2_frontal_random = load('phase2_frontal_random_complexities.mat');
% 
% phase3_frontal_face = load('phase3_frontal_face_complexities.mat');
% phase3_frontal_random = load('phase3_frontal_random_complexities.mat');
% 
% phase3_parietal_face = load('phase3_parietal_face_all_complexities.mat');
% phase3_parietal_random = load('phase3_parietal_random_all_complexities.mat');
% 
% phase3_left_temporal_face = load('phase3_left_temporal_face_all_complexities.mat');
% phase3_left_temporal_random = load('phase3_left_temporal_random_all_complexities.mat');
% 
% phase3_right_temporal_face = load('phase3_right_temporal_face_all_complexities.mat');
% phase3_right_temporal_random = load('phase3_right_temporal_random_all_complexities.mat');

phase3_face_split1 = load('phase3_face_all_complexities_split1.mat');
phase3_random_split1 = load('phase3_random_all_complexities_split1.mat');

phase3_face_split2 = load('phase3_face_all_complexities_split2.mat');
phase3_random_split2 = load('phase3_random_all_complexities_split2.mat');

phase3_face_split3 = load('phase3_face_all_complexities_split3.mat');
phase3_random_split3 = load('phase3_random_all_complexities_split3.mat');

phase3_face_split4 = load('phase3_face_all_complexities_split4.mat');
phase3_random_split4 = load('phase3_random_all_complexities_split4.mat');
%%
load('phase3.mat')
load('phase3_splits.mat')
%frontal = [8,9,20,21,22,23,33,34,35];
%occipital = [1,2,5,6,10,11,12,13,24];
%parietal = [3,7,14,15,16,17,18,19,25];
%lefttemporal = [26,28,30,31,36,38,40,42,44];
%righttemporal = [4,27,29,31,37,39,41,43,45];
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
%%
figure(3),clf;
plot(2:10, phase3_occipital_face.all_face_complexities)
legend('1','2','5','6','10','11','12','13','24','Location', 'northeast')
title('phase 3 occipital face complexities')
saveas(3,'occipital_face.png')

figure(4),clf;
plot(2:10, phase3_occipital_random.all_random_complexities)
legend('1','2','5','6','10','11','12','13','24','Location', 'northeast')
title('phase 3 occipital random complexities')
saveas(4,'occipital_random.png')

figure(5),clf;
plot(2:10, phase3_frontal_face.all_face_complexities)
legend('8','9','20','21','22','23','33','34','35','Location','northeast')
title('phase 3 frontal face complexities')
saveas(5,'frontal_face.png')

figure(6),clf;
plot(2:10, phase3_frontal_random.all_random_complexities)
legend('8','9','20','21','22','23','33','34','35','Location','northeast')
title('phase 3 frontal random complexities')
saveas(6,'frontal_random.png')

figure(7),clf;
plot(2:10, phase3_parietal_face.all_face_complexities)
legend('3','7','14','15','16','17','18','19','25', 'Location','northeast')
title('phase 3 parietal face complexities')
saveas(7,'parietal_face.png')

figure(8),clf;
plot(2:10, phase3_parietal_random.all_random_complexities)
legend('3','7','14','15','16','17','18','19','25', 'Location','northeast')
title('phase 3 parietal random complexities')
saveas(8,'parietal_random.png')

figure(9),clf;
plot(2:10, phase3_left_temporal_face.all_face_complexities)
legend('26','28','30','31','36','38','40','42','44', 'Location','northeast')
title('phase 3 left temporal face complexities')
saveas(9,'left_temporal_face.png')

figure(10),clf;
plot(2:10, phase3_left_temporal_random.all_random_complexities)
legend('26','28','30','31','36','38','40','42','44', 'Location','northeast')
title('phase 3 left temporal random complexities')
saveas(10,'left_temporal_random.png')

figure(11),clf;
plot(2:10, phase3_right_temporal_face.all_face_complexities)
legend('4','27','29','31','37','39','41','43','45', 'Location','northeast')
title('phase 3 right temporal face complexities')
saveas(11,'right_temporal_face.png')

figure(12),clf;
plot(2:10, phase3_right_temporal_random.all_random_complexities)
legend('4','27','29','31','37','39','41','43','45', 'Location','northeast')
title('phase 3 right temporal random complexities')
saveas(12,'right_temporal_random.png')
%%
phase3_occipital_diff = phase3_occipital_face.all_face_complexities - phase3_occipital_random.all_random_complexities;

figure(13),clf;
plot(2:10, phase3_occipital_diff)

phase3_frontal_diff = phase3_frontal_face.all_face_complexities - phase3_frontal_random.all_random_complexities;
phase3_parietal_diff = phase3_parietal_face.all_face_complexities - phase3_parietal_random.all_random_complexities;
phase3_left_temporal_diff = phase3_left_temporal_face.all_face_complexities - phase3_left_temporal_random.all_random_complexities;
phase3_right_temporal_diff = phase3_right_temporal_face.all_face_complexities - phase3_right_temporal_random.all_random_complexities;

figure(13),clf;
plot(2:10, phase3_occipital_diff)
legend('1','2','5','6','10','11','12','13','24','Location', 'northeast')
title('phase 3 occipital complexity difference')
saveas(13, 'occipital_diff.png')

figure(14),clf;
plot(2:10, phase3_frontal_diff)
legend('8','9','20','21','22','23','33','34','35','Location','northeast')
title('phase 3 frontal complexity difference')
saveas(14, 'frontal_diff.png')

figure(15),clf;
plot(2:10, phase3_parietal_diff)
legend('3','7','14','15','16','17','18','19','25', 'Location','northeast')
title('phase 3 parietal complexity difference')
saveas(15, 'parietal_diff.png')

figure(16),clf;
plot(2:10, phase3_left_temporal_diff)
legend('26','28','30','31','36','38','40','42','44', 'Location','northeast')
title('phase 3 left temporal complexity difference')
saveas(16, 'left_temporal_diff.png')

figure(17),clf;
plot(2:10, phase3_right_temporal_diff)
legend('4','27','29','31','37','39','41','43','45', 'Location','northeast')
title('phase 3 right temporal complexity difference')
saveas(17, 'right_temporal_diff.png')

%%
%topoplots
cd 'C:\Users\wiwax\github\summerproject\useful'

%need to import txt files into matlab workspace as column vector to run
sorted_face_comps = load('sorted_face_comps.txt');
sorted_random_comps = load('sorted_random_comps.txt');

face_split1 = load('face_split1.txt');
face_split2 = load('face_split2.txt');
face_split3 = load('face_split3.txt');
face_split4 = load('face_split4.txt');

% random_split1 = load('random_split1.txt');
% random_split2 = load('random_split2.txt');
% random_split3 = load('random_split3.txt');
% random_split4 = load('random_split4.txt');

addpath 'C:\Users\wiwax\Documents\MATLAB\eeglab_current\eeglab2019_1'
eeglab
%%
figure(1),clf;
topoplot(sorted_face_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face, ml4')
cbar('vert');
saveas(1,'phase3_face_ml4_topoplot.png')
%%
figure(2),clf;
topoplot(sorted_random_comps,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 random, ml4')
cbar('vert');
saveas(2, 'phase3_random_ml4_topoplot.png')

figure(20),clf;
topoplot(face_split1,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 1 ml4')
cbar('vert');
saveas(20, 'phase3_face_split1_ml4_topoplot.png')

figure(21),clf;
topoplot(face_split2,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 2 ml4')
cbar('vert');
saveas(21, 'phase3_face_split2_ml4_topoplot.png')

figure(22),clf;
topoplot(face_split3,'sorted_coords.xyz','maplimits','maxmin');
title('phase 3 face split 3 ml4')
cbar('vert');
saveas(22,'phase3_face_split3_ml4_topoplot.png')

figure(23),clf;
topoplot(face_split4,'sorted_coords.xyz','maplimits','maxmin'); 
title('phase 3 face split 4 ml4')
cbar('vert');
saveas(23, 'phase3_face_split4_ml4_topoplot.png')

% figure(24),clf;
% topoplot(random_split1,'sorted_coords.xyz','maplimits','maxmin'); 
% title('phase 3 random split 1 ml4')
% cbar('vert');
% saveas(24, 'phase3_random_split1_ml4_topoplot.png')
% 
% figure(25), clf;
% topoplot(random_split2,'sorted_coords.xyz','maplimits','maxmin'); 
% title('phase 3 random split 2 ml4')
% cbar('vert');
% saveas(25, 'phase3_random_split2_ml4_topoplot.png')
% 
% figure(26),clf;
% topoplot(random_split3,'sorted_coords.xyz','maplimits','maxmin');
% title('phase 3 random split 3 ml4')
% cbar('vert');
% saveas(26, 'phase3_random_split3_ml4_topoplot.png')
% 
% figure(27),clf;
% topoplot(random_split3,'sorted_coords.xyz','maplimits','maxmin'); 
% title('phase 3 random split 4 ml4')
% cbar('vert');
% saveas(27, 'phase3_random_split4_ml4_topoplot.png')
%%
%%test figure generating loop
for ii=20:27
    saveas(ii,['phase3' '-' num2str(ii)],'pdf')
end