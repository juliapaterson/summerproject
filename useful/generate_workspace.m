%generate data for CSSR
%isolate phases and stimuli
load("differentiated.mat");

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase1.(ch_name) = samp11(:,:,i);
end

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase1.(ch_name) = samp12(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase2.(ch_name) = samp21(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase2.(ch_name) = samp22(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'face');
    phase3.(ch_name) = samp31(:,:,i);
end 

for i = 1:45
    ch_name = strcat('ch',num2str(i),'random');
    phase3.(ch_name) = samp32(:,:,i);
end 

%save('cssr_derivative_workspace')
