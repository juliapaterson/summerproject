comps = load('phase3_source_short_both_complexities.mat');

shorter_comps = comps.all_face_complexities(:,1:10);

figure(1),clf;
plot(1:10,shorter_comps);
legend('1','2','3','4','Location','northeast')
title('phase 3 source both complexities')
xlabel('memory length')
ylabel('statistical complexity')
saveas(1,'short_source_both.png')
