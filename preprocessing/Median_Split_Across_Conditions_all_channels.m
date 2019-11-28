%% DESCRIPTION OF SCRIPT
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% ** Note: Helpful IDs -> 11 - Phase 1 Face, 12 - Phase 1 Random, 21 - Phase 2 Face, 22 - Phase 2 Random, 31 - Phase 3 Face, 32 - Phase 3 Random **
% Pre-processing of Median Subtraction computed for all channels (Variable Name: new_samp_11, new_samp_12, new_samp_21, new_samp_22, new_samp_31, new_samp_32)
%   Single median value is taken across conditions(Face & Random), per trial, per channel
% Binarising Median Split data (Variable Name: samp11, samp12, samp21, samp22, samp31, samp32)
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% Author: Evangeline Leong
% Last Date Modified: 31/01/19
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
%%
close all;clc;
%% Median Subtraction 
%% Phase 1
compare_1 = [bip_11(:,:,:) bip_12(1:214,:,:)]; % comparing across face and random to get a single median value across conditions
%% Obtaining Median Value
% med_1 =  median(median(compare_1)); % single median value across trials and conditions per channel
med_1 = (median(compare_1,2)); % obtaining single median value across conditions per channel, per trial
%% Phase 1 Face
new_samp_11 = bip_11-(med_1); % median subtraction 
size_new_samp_11 = size(new_samp_11);
samp11 = zeros(size_new_samp_11(1),size_new_samp_11(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_11(2) 
        for h = 1:size_new_samp_11(1)
            if new_samp_11(h,g,ch) > 0
                samp11(h,g,ch) = 1;
            elseif new_samp_11(h,g,ch) <= 0
                samp11(h,g,ch) = 0;
            end
        end
    end
end
%% Phase 1 Random
new_samp_12 = bip_12(1:214,:,:)-(med_1); % median subtraction 
size_new_samp_12 = size(new_samp_12);
samp12 = zeros(size_new_samp_12(1),size_new_samp_12(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_12(2)
        for h = 1:size_new_samp_12(1)
            if new_samp_12(h,g,ch) > 0
                samp12(h,g,ch) = 1;
            elseif new_samp_12(h,g,ch) <= 0
                samp12(h,g,ch) = 0;
            end
        end
    end
end
%%
%% Phase 2
compare_2 = [bip_21(:,:,:) bip_22(1:212,:,:)]; % comparing across face and random to get a single median value across conditions
%% Obtaining Median Value
% med_2 =  median(median(compare_2)); % single median value across trials and conditions per channel
med_2 =  (median(compare_2,2)); % obtaining single median value across conditions per channel, per trial
%% Phase 2 Face
new_samp_21 = bip_21-(med_2); % median subtraction 
size_new_samp_21 = size(new_samp_21);
samp21 = zeros(size_new_samp_21(1),size_new_samp_21(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_21(2)
        for h = 1:size_new_samp_21(1)
            if new_samp_21(h,g,ch) > 0
                samp21(h,g,ch) = 1;
            elseif new_samp_21(h,g,ch) <= 0
                samp21(h,g,ch) = 0;
            end
        end
    end
end
%% Phase 2 Random
new_samp_22 = bip_22(1:212,:,:)-(med_2); % median subtraction 
size_new_samp_22 = size(new_samp_22);
samp22 = zeros(size_new_samp_22(1),size_new_samp_22(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_22(2)
        for h = 1:size_new_samp_22(1)
            if new_samp_22(h,g,ch) > 0
                samp22(h,g,ch) = 1;
            elseif new_samp_22(h,g,ch) <= 0
                samp22(h,g,ch) = 0;
            end
        end
    end
end
%%
%% Phase 3
compare_3 = [bip_31(:,:,:) bip_32(1:213,:,:)]; % comparing across face and random to get a single median value across conditions
%% Obtaining Median Value
% med_3 =  median(median(compare_3)); % single median value across face and random per channel
med_3 =  (median(compare_3,2));
%% Phase 3 Face
new_samp_31 = bip_31-(med_3); % median subtraction 
size_new_samp_31 = size(new_samp_31);
samp31 = zeros(size_new_samp_31(1),size_new_samp_31(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_31(2)
        for h = 1:size_new_samp_31(1)
            if new_samp_31(h,g,ch) > 0
                samp31(h,g,ch) = 1;
            elseif new_samp_31(h,g,ch) <= 0
                samp31(h,g,ch) = 0;
            end
        end
    end
end
%% Phase 3 Random
new_samp_32 = bip_32(1:213,:,:)-(med_3); % median subtraction 
size_new_samp_32 = size(new_samp_32);
samp32 = zeros(size_new_samp_32(1),size_new_samp_32(2),45);
% Binarising if above median value, given the state ON (1), if below,
% given the state OFF (0)
for ch = 1:45
    for g = 1:size_new_samp_32(2)
        for h = 1:size_new_samp_32(1)
            if new_samp_32(h,g,ch) > 0
                samp32(h,g,ch) = 1;
            elseif new_samp_32(h,g,ch) <= 0
                samp32(h,g,ch) = 0;
            end
        end
    end
end

%Julia - save to file
save('median_split','samp11','samp12','samp21','samp22','samp31','samp32')