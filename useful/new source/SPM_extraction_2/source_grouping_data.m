%% group ERPs across 3 trials

load('total_concat.mat');

source_3g_raw_p3 = zeros(132,501,4);

for i = 1:66
    source_3g_raw_p3(i,:,:) = mean(source_raw_phase3((3*(i-1)+1):3*i,:,:),1);
    source_3g_raw_p3(i+66,:,:) = mean(source_raw_phase3((3*(i-1)+201):200+3*i,:,:),1);
end

%% binarise
source_3g_bin_df_p3 = zeros(132,500,4);
source_3g_bin_ms_p3 = zeros(132,500,4);
for i = 1:66
    for k = 1:4
        for j = 1:500
            if source_3g_raw_p3(i,j+1,k)>source_3g_raw_p3(i,j,k)
                source_3g_bin_df_p3(i,j,k) = 1;
            end
            if source_3g_raw_p3(i,j,k) > mean(source_3g_raw_p3(i,:,k))
                source_3g_bin_ms_p3(i,j,k) = 1;
            end
        end
    end
end

save('grouped_source.mat')