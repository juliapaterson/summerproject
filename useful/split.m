%split on time points by groups of 50
load('cssr_derivative_workspace');
%face
ft1 = samp31(:,1:50,:);
ft2 = samp31(:,51:100,:);
ft3 = samp31(:,101:150,:);
ft4 = samp31(:,151:200,:);
ft5 = samp31(:,201:250,:);
ft6 = samp31(:,251:300,:);
ft7 = samp31(:,301:350,:);

%random
rt1 = samp32(:,1:50,:);
rt2 = samp32(:,51:100,:);
rt3 = samp32(:,101:150,:);
rt4 = samp32(:,151:200,:);
rt5 = samp32(:,201:250,:);
rt6 = samp32(:,251:300,:);
rt7 = samp32(:,301:350,:);

%isolate n = 1 trial
fn1 = samp31(1,:,:);
rn1 = samp32(1,:,:);

%left = samp31(:, 1:floor(end/2),:);
%right = samp31(:,ceil(end/2),:);
save('splits.mat');