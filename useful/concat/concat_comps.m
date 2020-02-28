comps = load('phase3_concat_complexities.mat');

figure(1),clf;
plot(2:10, comps.all_both_complexities);
%legend('1','2','3','4','Location','northeast')
title('phase 3 both (concat) complexities, all channels')
xlabel('memory length')
ylabel('statistical complexity')
saveas(1,'short_source_random.png')