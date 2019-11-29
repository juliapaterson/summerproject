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
%%
% Phase 1 Face
% Differentiating, subtracting value at t+delta from t
bip_11_diff = zeros(noOfTrials(1),350,45);
for i = 1:noOfTrials(1)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_11_diff(i,j,k) = bip_11(i,j+1,k) - bip_11(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp11 = zeros(noOfTrials(1),350,45);
for g = 1:noOfTrials(1)
    for h = 1:size11(2)-1
        for l = 1:45
            if bip_11_diff(g,h,l) > 0
                samp11(g,h,l) = 1;
            elseif bip_11_diff(g,h,l) <= 0
                samp11(g,h,l) = 0;
            end
        end
    end
end
%%
% Phase 1 Random
% Differentiating, subtracting value at t+delta from t
bip_12_diff = zeros(noOfTrials(2),350,45);
for i = 1:noOfTrials(2)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_12_diff(i,j,k) = bip_12(i,j+1,k) - bip_12(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp12 = zeros(noOfTrials(2),350,45);
for g = 1:noOfTrials(2)
    for h = 1:size11(2)-1
        for l = 1:45
            if bip_12_diff(g,h,l) > 0
                samp12(g,h,l) = 1;
            elseif bip_12_diff(g,h,l) <= 0
                samp12(g,h,l) = 0;
            end
        end
    end
end
%%
% Phase 2 Face
% Differentiating, subtracting value at t+delta from t
bip_21_diff = zeros(noOfTrials(5),350,45);
for i = 1:noOfTrials(5)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_21_diff(i,j,k) = bip_21(i,j+1,k) - bip_21(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp21 = zeros(noOfTrials(5),350,45);
for g = 1:noOfTrials(5)
    for h = 1:size11(2)-1
        for l = 1:45
            if bip_21_diff(g,h,l) > 0
                samp21(g,h,l) = 1;
            elseif bip_21_diff(g,h,l) <= 0
                samp21(g,h,l) = 0;
            end
        end
    end
end
%%
% Phase 2 Random
% Differentiating, subtracting value at t+delta from t
bip_22_diff = zeros(noOfTrials(6),350,45);
for i = 1:noOfTrials(6)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_22_diff(i,j,k) = bip_22(i,j+1,k) - bip_22(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp22 = zeros(noOfTrials(6),350,45);
for g = 1:noOfTrials(6)
    for h = 1:size11(2)-1
        for l = 1:45
            if bip_22_diff(g,h,l) > 0
                samp22(g,h,l) = 1;
            elseif bip_22_diff(g,h,l) <= 0
                samp22(g,h,l) = 0;
            end
        end
    end
end
%%
% Phase 3 Face
% Differentiating, subtracting value at t+delta from t
bip_31_diff = zeros(noOfTrials(9),350,45);
for i = 1:noOfTrials(9)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_31_diff(i,j,k) = bip_31(i,j+1,k) - bip_31(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp31 = zeros(noOfTrials(9),350,45);
for g = 1:noOfTrials(9)
    for h = 1:size11(2)-1
        for l = 1:45
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
bip_32_diff = zeros(noOfTrials(10),350,45);
for i = 1:noOfTrials(10)
    for j = 1:size11(2)-1
        for k = 1:45
            bip_32_diff(i,j,k) = bip_32(i,j+1,k) - bip_32(i,j,k);
        end
    end
end

% Binarising, if Differentiated value > 0, given the state ON (1), if <= 0,
% given the state OFF (0)
samp32 = zeros(noOfTrials(10),350,45);
for g = 1:noOfTrials(10)
    for h = 1:size11(2)-1
        for l = 1:45
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

%Julia - save to file
save('differentiated','samp11','samp12','samp21','samp22','samp31','samp32') %mat

%dlmwrite('differentiated11.txt','samp11',' ') %save channel 11 to txt with space delimiter