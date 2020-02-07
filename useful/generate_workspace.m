%generate data for CSSR
%isolate phases and stimuli
load("differentiated.mat");

% for i = 1:45
%     ch_name = strcat('ch',num2str(i),'face');
%     phase1.(ch_name) = samp11(:,:,i);
% end
% 
% for i = 1:45
%     ch_name = strcat('ch',num2str(i),'random');
%     phase1.(ch_name) = samp12(:,:,i);
% end 
% 
% for i = 1:45
%     ch_name = strcat('ch',num2str(i),'face');
%     phase2.(ch_name) = samp21(:,:,i);
% end 
% 
% for i = 1:45
%     ch_name = strcat('ch',num2str(i),'random');
%     phase2.(ch_name) = samp22(:,:,i);
% end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split1.(ch_name) = ft1(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split1.(ch_name) = rt1(:,:,i);
end 

save('split1_workspace')

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split2.(ch_name) = ft2(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split2.(ch_name) = rt2(:,:,i);
end 

save('split2_workspace')

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split3.(ch_name) = ft3(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split3.(ch_name) = rt3(:,:,i);
end 

save('split3_workspace')

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split4.(ch_name) = ft4(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split4.(ch_name) = rt4(:,:,i);
end 

save('split4_workspace')


for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split5.(ch_name) = ft5(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split5.(ch_name) = rt5(:,:,i);
end 

save('split5_workspace')
fprintf('redo 5 done')
%%
for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split6.(ch_name) = ft6(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split6.(ch_name) = rt6(:,:,i);
end 

save('split6_workspace')

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_split7.(ch_name) = ft7(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_split7.(ch_name) = rt7(:,:,i);
end 

save('split7_workspace')

fprintf('split 6 and 7 done')
%%
for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3_face_fn1.(ch_name) = fn1(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3_random_rn1.(ch_name) = rn1(:,:,i);
end 
save('n1_workspace')
fprintf('n1 done')