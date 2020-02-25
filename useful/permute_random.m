load('cssr_derivative_workspace.mat');
permuted_numbers = randperm(213);

% %%
% for k = [1:45] %channel list
%     ch_name = strcat('ch',num2str(k),'random');
%     input = phase3.(ch_name);
%     random_permuted.ch_name = input(permuted_numbers,:);
% end

% %test = phase3.ch1random(permuted_numbers,:);
% %test2 = phase3.ch2random(permuted_numbers,:);
% %test2 = permute(samp32, [2 3 1]);

random_permuted = samp32(permuted_numbers, :,:);

% for i = 1:45
%     ch_name = strcat('ch',num2str(i),'random');
%     phase3_random_permuted.(ch_name) = random_permuted(:,:,i);
% end 

save('permuted_workspace.mat')
