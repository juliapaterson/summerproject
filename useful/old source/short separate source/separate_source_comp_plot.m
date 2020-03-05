random_comps = load('phase3_source_short_random_complexities.mat');
face_comps = load('phase3_source_short_face_complexities.mat');

shorter_random_comps = random_comps.all_random_complexities(:,1:10);

figure(1),clf;
plot(1:10,shorter_random_comps);
legend('1','2','3','4','Location','northeast')
title('phase 3 source random complexities')
xlabel('memory length')
ylabel('statistical complexity')
saveas(1,'short_source_random.png')

shorter_face_comps = face_comps.all_face_complexities(:,1:10);
figure(2),clf;
plot(1:10, shorter_face_comps);
legend('1','2','3','4','Location','northeast')
title('phase 3 source face complexities')
xlabel('memory length')
ylabel('statistical complexity')
saveas(2,'short_source_face.png')