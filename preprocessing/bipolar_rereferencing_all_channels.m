%% DESCRIPTION OF SCRIPT
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% ** Note: Helpful IDs -> 11 - Phase 1 Face, 12 - Phase 1 Random, 21 - Phase 2 Face, 22 - Phase 2 Random, 31 - Phase 3 Face, 32 - Phase 3 Random **
% Manually pair up 90 adjescent electrodes to form 45 channels
% Computes all possible channel pair combinations (Variable Name: combos)
% Bipolar Rereferencing computed for all channels (Variable Name: bip_11, bip_12, bip_21, bip_22, bip_31, bip_32)
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% Author: Evangeline Leong
% Last Date Modified: 31/01/19
% ---------------------------------------- -----------------------------------------------------------------------------------------------------------------------
%%  Load EEG data first before running this script
load('EEG_Data_All_Channels_Cut_According_To_Event.mat')
%%
close all;clc;
%%
%% Manually Paired Electrodes
pairs = [80 65; 76 61; 31 16; 25  11; 90 78; 63 45; 1 2; 7 20; 54 36; 91 79; 89 77; 64 46; 62 44; 29 14; 27 13;15 5; 12 4;6 18; 3 9; 19 35; 8 21; 53 71; 37 55; 47 30; 43 26; 92 81; 88 75; 66 48; 60 42; 32 17; 24 10; 33 51; 23 39; 34 52; 22 38; 93 82; 87 74 ; 67 49; 59 41; 68 50; 40 58;94 83; 86 73; 95 69; 85 57];
size_pairs = size(pairs);
%% Simulating every pair combination possible for 45 Channels
channels = 1:45;
combos = nchoosek(channels,2);
%% Bipolar Re-referencing
% Phase 1 Face
bip_11 = Phase_1_Face_Cut_Data(:,:,pairs(:,1))-Phase_1_Face_Cut_Data(:,:,pairs(:,2));
% Phase 1 Random
bip_12 = Phase_1_Random_Cut_Data(:,:,pairs(:,1))-Phase_1_Random_Cut_Data(:,:,pairs(:,2));
% Phase 2 Face
bip_21 = Phase_2_Face_Cut_Data(:,:,pairs(:,1))-Phase_2_Face_Cut_Data(:,:,pairs(:,2));
% Phase 2 Random
bip_22 = Phase_2_Random_Cut_Data(:,:,pairs(:,1))-Phase_2_Random_Cut_Data(:,:,pairs(:,2));
% Phase 3 Face
bip_31 = Phase_3_Face_Cut_Data(:,:,pairs(:,1))-Phase_3_Face_Cut_Data(:,:,pairs(:,2));
% Phase 3 Random
bip_32 = Phase_3_Random_Cut_Data(:,:,pairs(:,1))-Phase_3_Random_Cut_Data(:,:,pairs(:,2));
%%
size11 = size(Phase_1_Face_Cut_Data);
size12 = size(Phase_1_Random_Cut_Data);
size21 = size(Phase_2_Face_Cut_Data);
size22 = size(Phase_2_Random_Cut_Data);
size31 = size(Phase_3_Face_Cut_Data);
size32 = size(Phase_3_Random_Cut_Data);
%% Clear Raw Data
clear Phase_1_Face_Cut_Data; clear Phase_1_Random_Cut_Data; clear Phase_1_Face_Feature_Missing_Cut_Data; clear Phase_1_Dot_Colour_Change_Cut_Data
clear Phase_2_Face_Cut_Data; clear Phase_2_Random_Cut_Data; clear Phase_2_Face_Feature_Missing_Cut_Data; clear Phase_2_Dot_Colour_Change_Cut_Data
clear Phase_3_Face_Cut_Data; clear Phase_3_Random_Cut_Data; clear Phase_3_Face_Feature_Missing_Cut_Data; clear Phase_3_Dot_Colour_Change_Cut_Data