load('phase3.mat')

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