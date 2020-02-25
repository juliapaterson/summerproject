load('cssr_derivative_workspace.mat')
load('permuted_workspace.mat')

phase3_new = [samp31; random_permuted];

for i = 1:45
    ch_name = strcat('ch',num2str(i),'both');
    phase3_both.(ch_name) = phase3_new(:,:,i);
end

save('concat_workspace.mat')