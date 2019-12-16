%%
load('face_complexities.mat');
load('random_complexities.mat');
%%
comp_diff = face_complexities - random_complexities;

plot(2:16, comp_diff);
title('difference in complexity (face - random)')
xlabel('memory length')
ylabel('difference')

%%
ch1_face = load('ch1_face_complexities.mat');
ch24_face = load('ch24_face_complexities.mat');
ch10_face = load('ch10_face_complexities.mat');
ch12_face = load('ch12_face_complexities.mat');
ch5_face = load('ch5_face_complexities.mat');
ch6_face = load('ch6_face_complexities.mat');
ch13_face = load('ch13_face_complexities.mat');
ch11_face = load('ch11_face_complexities.mat');
ch2_face = load('ch2_face_complexities.mat');

ch1_random = load('ch1_random_complexities.mat');
ch24_random = load('ch24_random_complexities.mat');
ch10_random = load('ch10_random_complexities.mat');
ch12_random = load('ch12_random_complexities.mat');
ch5_random = load('ch5_random_complexities.mat');
ch6_random = load('ch6_random_complexities.mat');
ch13_random = load('ch13_random_complexities.mat');
ch11_random = load('ch11_random_complexities.mat');
ch2_random = load('ch2_random_complexities.mat');

%%
plot(2:16, ch1_face.face_complexities);
hold on
plot(2:16, ch24_face.face_complexities);
plot(2:16, ch10_face.face_complexities);
plot(2:16, ch12_face.face_complexities);
plot(2:16, ch5_face.face_complexities);
plot(2:16, ch6_face.face_complexities);
plot(2:16, ch13_face.face_complexities);
plot(2:16, ch11_face.face_complexities);
plot(2:16, ch2_face.face_complexities);
legend('1','24','10','12','5','6','13','11','2','Location', 'northwest')
hold off
%%
plot(2:16, ch1_random.random_complexities);
hold on
plot(2:16, ch24_random.random_complexities);
plot(2:16, ch10_random.random_complexities);
plot(2:16, ch12_random.random_complexities);
plot(2:16, ch5_random.random_complexities);
plot(2:16, ch6_random.random_complexities);
plot(2:16, ch13_random.random_complexities);
plot(2:16, ch11_random.random_complexities);
plot(2:16, ch2_random.random_complexities);
legend('1','24','10','12','5','6','13','11','2','Location', 'northwest')
hold off
%%
ch1_diff = ch1_face.face_complexities - ch1_random.random_complexities;
ch24_diff = ch24_face.face_complexities - ch24_random.random_complexities;
ch10_diff = ch10_face.face_complexities - ch10_random.random_complexities;
ch12_diff = ch12_face.face_complexities - ch12_random.random_complexities;
ch5_diff = ch5_face.face_complexities - ch5_random.random_complexities;
ch6_diff = ch6_face.face_complexities - ch6_random.random_complexities;
ch13_diff = ch13_face.face_complexities - ch13_random.random_complexities;
ch11_diff = ch11_face.face_complexities - ch11_random.random_complexities;
ch2_diff = ch2_face.face_complexities - ch2_random.random_complexities;

avg_diff = face_avg - random_avg;
%%
plot(2:16, ch1_diff);
hold on
plot(2:16, ch24_diff);
plot(2:16, ch10_diff);
plot(2:16, ch12_diff);
plot(2:16, ch5_diff);
plot(2:16, ch6_diff);
plot(2:16, ch13_diff);
plot(2:16, ch11_diff);
plot(2:16, ch2_diff);
legend('1','24','10','12','5','6','13','11','2','average','Location', 'northeast')
hold off
%%
%set nans to 0 to plot avgs
ch1_face_clean.face_complexities(isnan(ch1_face.face_complexities)) = 0;
ch24_face.face_complexities(isnan(ch24_face.face_complexities)) = 0;
ch10_face.face_complexities(isnan(ch10_face.face_complexities)) = 0;
ch12_face.face_complexities(isnan(ch12_face.face_complexities)) = 0;
ch5_face.face_complexities(isnan(ch5_face.face_complexities)) = 0;
ch6_face.face_complexities(isnan(ch6_face.face_complexities)) = 0;
ch13_face.face_complexities(isnan(ch13_face.face_complexities)) = 0;
ch11_face.face_complexities(isnan(ch11_face.face_complexities)) = 0;
ch2_face.face_complexities(isnan(ch2_face.face_complexities)) = 0;

ch1_random.random_complexities(isnan(ch1_random.random_complexities)) = 0;
ch24_random.random_complexities(isnan(ch24_random.random_complexities)) = 0;
ch10_random.random_complexities(isnan(ch10_random.random_complexities)) = 0;
ch12_random.random_complexities(isnan(ch12_random.random_complexities)) = 0;
ch5_random.random_complexities(isnan(ch5_random.random_complexities)) = 0;
ch6_random.random_complexities(isnan(ch6_random.random_complexities)) = 0;
ch13_random.random_complexities(isnan(ch13_random.random_complexities)) = 0;
ch11_random.random_complexities(isnan(ch11_random.random_complexities)) = 0;
ch2_random.random_complexities(isnan(ch2_random.random_complexities)) = 0;

%%
random_avg = (ch1_random.random_complexities + ch24_random.random_complexities + ch10_random.random_complexities + ch12_random.random_complexities + ch5_random.random_complexities + ch6_random.random_complexities + ch13_random.random_complexities + ch11_random.random_complexities + ch2_random.random_complexities) / 9;
face_avg = (ch1_face.face_complexities + ch24_face.face_complexities + ch10_face.face_complexities + ch12_face.face_complexities + ch5_face.face_complexities + ch6_face.face_complexities + ch13_face.face_complexities + ch11_face.face_complexities + ch2_face.face_complexities) / 9;

plot(2:16, face_avg,'r');
hold on
plot(2:16, random_avg, 'b');
legend('face','random','Location', 'northwest')
hold off
