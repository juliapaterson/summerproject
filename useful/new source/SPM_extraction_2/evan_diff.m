%% DESCRIPTION OF SCRIPT
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% ** Note: Helpful IDs -> 11 - Phase 1 Face, 12 - Phase 1 Random, 21 - Phase 2 Face, 22 - Phase 2 Random, 31 - Phase 3 Face, 32 - Phase 3 Random **
% Pre-processing of Differentiation computed for all channels (Variable Name: bip_11_diff, bip_12_diff, bip_21_diff, bip_22_diff, bip_31_diff, bip_32_diff)
% Binarising Differentiated data (Variable Name: samp11, samp12, samp21, samp 22, samp 31, samp32)
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% Author: Evangeline Leong
% Last Date Modified: 31/01/19
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
%%
close all;clc;
load('grouped_source.mat')
%%
% Phase 3 Face
% Differentiating, subtracting value at t+delta from t
bip_31 = source_3g_raw_p3(1:66,:,:);
bip_31_diff = zeros(66,501,4);
for i = 1:66
    for j = 1:500
        for k = 1:4
            bip_31_diff(i,j,k) = bip_31(i,j+1,k) - bip_31(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp31 = zeros(66,501,4);
for g = 1:66
    for h = 1:500
        for l = 1:4
            if bip_31_diff(g,h,l) > 0
                samp31(g,h,l) = 1;
            elseif bip_31_diff(g,h,l) <= 0
                samp31(g,h,l) = 0;
            end
        end
    end
end
%%
% Phase 3 Random
% Differentiating, subtracting value at t+delta from t
bip_32 = source_3g_raw_p3(67:132,:,:);
bip_32_diff = zeros(66,501,4);
for i = 1:66
    for j = 1:500
        for k = 1:4
            bip_32_diff(i,j,k) = bip_32(i,j+1,k) - bip_32(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp32 = zeros(66,501,4);
for g = 1:66
    for h = 1:500
        for l = 1:4
            if bip_32_diff(g,h,l) > 0
                samp32(g,h,l) = 1;
            elseif bip_32_diff(g,h,l) <= 0
                samp32(g,h,l) = 0;
            end
        end
    end
end
%% Clear unneeded Variable from Workspace
clear g; clear h; clear i; clear j; clear k; clear l;

evan_grouped_diff = [samp31; samp32];
%Julia - save to file
save('grouped_evan_diff','samp31','samp32','evan_grouped_diff') %mat

%dlmwrite('differentiated11.txt','samp11',' ') %save channel 11 to txt with space delimiter