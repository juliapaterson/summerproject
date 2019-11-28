% load IIT_workspace.mat FIRST 
load('IIT_workspace.mat') %Julia
close all;clc;
%% DESCRIPTION OF SCRIPT
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% ** Note: Helpful IDs -> 11 - Phase 1 Face, 12 - Phase 1 Random, 21 - Phase 2 Face, 22 - Phase 2 Random, 31 - Phase 3 Face, 32 - Phase 3 Random **
% Loads Raw Data
% Sorts Raw Data into given Phases and Conditions According to Stimulus ID
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
% Author: Evangeline Leong
% Last Date Modified: 19/11/18
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------
%% importing data
% datapoint position from events file
datapoints = MJNMoveMarkers{1:7237,{'VarName3'}};
% description of test (i.e. S11,S12,S13,S14,S21,S22,S23,S24,S31,S32,S33,S34)
test = MJNMoveMarkers{1:7237,{'Version20'}};


%% EEG values for event timestamps
% corr_EEG = zeros(96,7237);
% for i = 1: 96 
%         corr_EEG(i,1:7237) = ALLEEG.data(i,datapoints);
% end
% 

%% Number of Trials for each Phase
noOfTrials = zeros(1,12);

%% Identifying where in the entire raw data does each phase occur & cutting 100ms before and 600ms after onset of stimulus
% data point as in time stamp  % data point 100ms before event time stamp (50 datapoints before)    % data point 600ms after event time stamp (300 datapoints after)
% phase 11
start_time_vector11 = [];       plot_start_vector11 = [];                                               plot_end_vector11 = [];
%phase 12
start_time_vector12 = [];       plot_start_vector12 = [];                                               plot_end_vector12 = [];
%phase 13
start_time_vector13 = [];       plot_start_vector13 = [];                                               plot_end_vector13 = [];
% phase 14
start_time_vector14 = [];       plot_start_vector14 = [];                                               plot_end_vector14 = [];
%phase 21
start_time_vector21 = [];       plot_start_vector21 = [];                                               plot_end_vector21 = [];
%phase 22
start_time_vector22 = [];       plot_start_vector22 = [];                                               plot_end_vector22 = [];
%phase 23
start_time_vector23 = [];       plot_start_vector23 = [];                                               plot_end_vector23 = [];
%phase 24
start_time_vector24 = [];       plot_start_vector24 = [];                                               plot_end_vector24 = [];
% phase 31
start_time_vector31 = [];       plot_start_vector31 = [];                                               plot_end_vector31 = [];
% phase 32
start_time_vector32 = [];       plot_start_vector32 = [];                                               plot_end_vector32 = [];
% phase 33
start_time_vector33 = [];       plot_start_vector33 = [];                                               plot_end_vector33 = [];
% phase 34
start_time_vector34 = [];       plot_start_vector34 = [];                                               plot_end_vector34 = [];

%% obtaining relevant information
% builds vectors containing
% 1) datapoints of events (stimulus onset)
% 2) 100ms before the stimulus onset
% 3) 600ms after the stimulus onset
% counts number of trials
% for each individual phrase 

x = -50:300;
size_x = size(x);

for i = 1:7237
    if test(i) == 11
        noOfTrials(1,1) = noOfTrials(1,1)+1;
        start_time11 = datapoints(i);
        plot_start11 = start_time11+x(1);
        plot_end11 = start_time11+x(end);
%         time11 = (plot_start11*0.002):0.001:(plot_end11*0.002);
        start_time_vector11 = [start_time_vector11 start_time11];
        plot_start_vector11 = [plot_start_vector11 plot_start11];
        plot_end_vector11 = [plot_end_vector11 plot_end11];
%         phase = 11;
        
      elseif test(i) == 12
        noOfTrials(1,2) = noOfTrials(1,2)+1;
        start_time12 = datapoints(i);
        plot_start12 = start_time12+x(1);
        plot_end12 = start_time12+x(end);
%         time12 = (plot_start12*0.002):0.001:(plot_end12*0.002);
        start_time_vector12 = [start_time_vector12 start_time12];
        plot_start_vector12 = [plot_start_vector12 plot_start12];
        plot_end_vector12 = [plot_end_vector12 plot_end12];
%         phase = 12;
        
     elseif test(i) == 13
        noOfTrials(1,3) = noOfTrials(1,3)+1;
        start_time13 = datapoints(i);
        plot_start13 = start_time13+x(1);
        plot_end13 = start_time13+x(end);
%         time13 = (plot_start13*0.002):0.001:(plot_end13*0.002);
        start_time_vector13 = [start_time_vector13 start_time13];
        plot_start_vector13 = [plot_start_vector13 plot_start13];
        plot_end_vector13 = [plot_end_vector13 plot_end13];
%         phase = 13;
        
     elseif test(i) == 14
        noOfTrials(1,4) = noOfTrials(1,4)+1;
        start_time14 = datapoints(i);
        plot_start14 = start_time14+x(1);
        plot_end14 = start_time14+x(end);
%         time14 = (plot_start14*0.002):0.001:(plot_end14*0.002);
        start_time_vector14 = [start_time_vector14 start_time14];
        plot_start_vector14 = [plot_start_vector14 plot_start14];
        plot_end_vector14 = [plot_end_vector14 plot_end14];
%         phase = 14;
        
      elseif test(i) == 21
        noOfTrials(1,5) = noOfTrials(1,5)+1;
        start_time21 = datapoints(i);
        plot_start21 = start_time21+x(1);
        plot_end21 = start_time21+x(end);
%         time21 = (plot_start21*0.002):0.001:(plot_end21*0.002);
        start_time_vector21 = [start_time_vector21 start_time21];
        plot_start_vector21 = [plot_start_vector21 plot_start21];
        plot_end_vector21 = [plot_end_vector21 plot_end21];
%         phase = 21;
  
    elseif test(i) == 22
        noOfTrials(1,6) = noOfTrials(1,6)+1;
        start_time22 = datapoints(i);
        plot_start22 = start_time22+x(1);
        plot_end22 = start_time22 + x(end);
%         time22 = (plot_start22*0.002):0.001:(plot_end22*0.002);
        start_time_vector22 = [start_time_vector22 start_time22];
        plot_start_vector22 = [plot_start_vector22 plot_start22];
        plot_end_vector22 = [plot_end_vector22 plot_end22];
%         phase = 22;
        
     elseif test(i) == 23
        noOfTrials(1,7) = noOfTrials(1,7)+1;
        start_time23 = datapoints(i);
        plot_start23 = start_time23+x(1);
        plot_end23 = start_time23 + x(end);
%         time23 = (plot_start23*0.002):0.001:(plot_end23*0.002);
        start_time_vector23 = [start_time_vector23 start_time23];
        plot_start_vector23 = [plot_start_vector23 plot_start23];
        plot_end_vector23 = [plot_end_vector23 plot_end23];
%         phase = 23;
        
     elseif test(i) == 24
        noOfTrials(1,8) = noOfTrials(1,8)+1;
        start_time24 = datapoints(i);
        plot_start24 = start_time24+x(1);
        plot_end24 = start_time24 +x(end);
%         time34 = (plot_start24*0.002):0.001:(plot_end24*0.002);
        start_time_vector24 = [start_time_vector24 start_time24];
        plot_start_vector24 = [plot_start_vector24 plot_start24];
        plot_end_vector24 = [plot_end_vector24 plot_end24];
%         phase = 24;
        
    elseif test(i) == 31
        noOfTrials(1,9) = noOfTrials(1,9)+1;
        start_time31 = datapoints(i);
        plot_start31 = start_time31+x(1);
        plot_end31 = start_time31 + x(end);
%         time31 = (plot_start31*0.002):0.001:(plot_end31*0.002);
        start_time_vector31 = [start_time_vector31 start_time31];
        plot_start_vector31 = [plot_start_vector31 plot_start31];
        plot_end_vector31 = [plot_end_vector31 plot_end31];
%         phase = 31;
  
    elseif test(i) == 32
        noOfTrials(1,10) = noOfTrials(1,10)+1;
        start_time32 = datapoints(i);
        plot_start32 = start_time32 + x(1);
        plot_end32 = start_time32 + x(end);
%         time32 = (plot_start32*0.002):0.001:(plot_end32*0.002);
        start_time_vector32 = [start_time_vector32 start_time32];
        plot_start_vector32 = [plot_start_vector32 plot_start32];
        plot_end_vector32 = [plot_end_vector32 plot_end32];
%         phase = 32;
        
     elseif test(i) == 33
        noOfTrials(1,11) = noOfTrials(1,11)+1;
        start_time33 = datapoints(i);
        plot_start33 = start_time33+x(1);
        plot_end33 = start_time33 +x(end);
%         time33 = (plot_start33*0.002):0.001:(plot_end33*0.002);
        start_time_vector33 = [start_time_vector33 start_time33];
        plot_start_vector33 = [plot_start_vector33 plot_start33];
        plot_end_vector33 = [plot_end_vector33 plot_end33];
%         phase = 33;
        
     elseif test(i) == 34
        noOfTrials(1,12) = noOfTrials(1,12)+1;
        start_time34 = datapoints(i);
        plot_start34 = start_time34+x(1);
        plot_end34 = start_time34 +x(end);
%         time34 = (plot_start34*0.002):0.001:(plot_end34*0.002);
        start_time_vector34 = [start_time_vector34 start_time34];
        plot_start_vector34 = [plot_start_vector34 plot_start34];
        plot_end_vector34 = [plot_end_vector34 plot_end34];
%         phase = 34;

    end
end

%%
average = zeros(size_x(2),96,12);
%% calculates average Voltage for each phase

% PHASE 11
for a = 1:96
    for j = 1:length(plot_start_vector11)  
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_1_Face_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector11(j):plot_end_vector11(j));
    
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_1_Face_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size11 = size(Phase_1_Face_Cut_Data);
%     for k = 1:size11(2)
        sumy = sum(Phase_1_Face_Cut_Data(:,1:size11(2),a));
        average(1:size11(2),a,1) = sumy./noOfTrials(1,1);
%         std_dev11 = std(average11);
%         upper11 = average11(a,k)+std_dev11;
%         lower11 = average11(a,k)-std_dev11;
%     end

%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average11)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 12
for a = 1:96
    for j = 1:length(plot_start_vector12)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_1_Random_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector12(j):plot_end_vector12(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_1_Random_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size12 = size(Phase_1_Random_Cut_Data);
%     for k = 1:size12(2)
        sumy = sum(Phase_1_Random_Cut_Data(:,1:size12(2),a));
        average(1:size12(2),a,2) = sumy./noOfTrials(1,2);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average12)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 13
for a = 1:96
    for j = 1:length(plot_start_vector13)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_1_Face_Feature_Missing_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector13(j):plot_end_vector13(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_1_Face_Feature_Missing_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size13 = size(Phase_1_Face_Feature_Missing_Cut_Data);
%     for k = 1:size13(2)
        sumy = sum(Phase_1_Face_Feature_Missing_Cut_Data(:,1:size13(2),a));
        average(1:size13(2),a,3) = sumy./noOfTrials(1,3);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average13)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 14
for a = 1:96
    for j = 1:length(plot_start_vector14)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_1_Dot_Colour_Change_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector14(j):plot_end_vector14(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_1_Dot_Colour_Change_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size14 = size(Phase_1_Dot_Colour_Change_Cut_Data);
%     for k = 1:size14(2)
        sumy = sum(Phase_1_Dot_Colour_Change_Cut_Data(:,1:size14(2),a));
        average(1:size14(2),a,4) = sumy./noOfTrials(1,4);
%     end
%         
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average14)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 21
for a = 1:96
    for j = 1:length(plot_start_vector21)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_2_Face_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector21(j):plot_end_vector21(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_2_Face_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size21 = size(Phase_2_Face_Cut_Data);
%     for k = 1:size21(2)
        sumy = sum(Phase_2_Face_Cut_Data(:,1:size21(2),a));
        average(1:size21(2),a,5) = sumy./noOfTrials(1,5);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average21)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 22
for a = 1:96
    for j = 1:length(plot_start_vector22)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_2_Random_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector22(j):plot_end_vector22(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_2_Random_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size22 = size(Phase_2_Random_Cut_Data);
%     for k = 1:size22(2)
        sumy = sum(Phase_2_Random_Cut_Data(:,1:size22(2),a));
        average(1:size22(2),a,6) = sumy./noOfTrials(1,6);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average22)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 23
for a = 1:96
    for j = 1:length(plot_start_vector23)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_2_Face_Feature_Missing_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector23(j):plot_end_vector23(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_2_Face_Feature_Missing_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size23 = size(Phase_2_Face_Feature_Missing_Cut_Data);
%     for k = 1:size23(2)
        sumy = sum(Phase_2_Face_Feature_Missing_Cut_Data(:,1:size23(2),a));
        average(1:size23(2),a,7) = sumy./noOfTrials(1,7);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average23)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 24
for a = 1:96
    for j = 1:length(plot_start_vector24)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_2_Dot_Colour_Change_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector24(j):plot_end_vector24(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_2_Dot_Colour_Change_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size24 = size(Phase_2_Dot_Colour_Change_Cut_Data);
%     for k = 1:size24(2)
        sumy = sum(Phase_2_Dot_Colour_Change_Cut_Data(:,1:size24(2),a));
        average(1:size24(2),a,8) = sumy./noOfTrials(1,8);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average24)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 31
for a = 1:96
    for j = 1:length(plot_start_vector31)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_3_Face_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector31(j):plot_end_vector31(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_3_Face_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size31 = size(Phase_3_Face_Cut_Data);
%     for k = 1:size31(2)
        sumy = sum(Phase_3_Face_Cut_Data(:,1:size31(2),a));
        average(1:size31(2),a,9) = sumy./noOfTrials(1,9);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average31)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 32
for a = 1:96
    for j = 1:length(plot_start_vector32)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_3_Random_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector32(j):plot_end_vector32(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_3_Random_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size32 = size(Phase_3_Random_Cut_Data);
%     for k = 1:size32(2)
        sumy = sum(Phase_3_Random_Cut_Data(:,1:size32(2),a));
        average(1:size32(2),a,10) = sumy./noOfTrials(1,10);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average32)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 33
for a = 1:96
    for j = 1:length(plot_start_vector33)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_3_Face_Feature_Missing_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector33(j):plot_end_vector33(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_3_Face_Feature_Missing_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size33 = size(Phase_3_Face_Feature_Missing_Cut_Data);
%     for k = 1:size33(2)
        sumy = sum(Phase_3_Face_Feature_Missing_Cut_Data(:,1:size33(2),a));
        average(1:size33(2),a,11) = sumy./noOfTrials(1,11);
%     end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average31)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

% PHASE 34
for a = 1:96
    for j = 1:length(plot_start_vector34)
        % OBTAINING RESPECTIVE VOLTAGES FROM 100ms BEFORE STIMULUS ONSET TO
        % 600ms AFTER
        Phase_3_Dot_Colour_Change_Cut_Data(j,1:size_x(2),a) = ALLEEG.data(a,plot_start_vector34(j):plot_end_vector34(j));
            
    %     PLOTTING ALL RAW VOLTAGES FOR ALL TRIALS
    %
    %     plot(x,Phase_3_Dot_Colour_Change_Cut_Data)
    %     xlabel('Datapoints')
    %     ylabel('Voltage')
    %     ax = gca;
    %     ax.YAxisLocation = 'origin';
    %     hold on
    end
    size34 = size(Phase_3_Dot_Colour_Change_Cut_Data);
%     for k = 1:size34(2)
        sumy = sum(Phase_3_Dot_Colour_Change_Cut_Data(:,1:size34(2),a));
        average(1:size34(2),a,12) = sumy./noOfTrials(1,12);
% end
        
%     PLOTTING FOR ALL CHANNELS, AVERAGE VOLTAGE VS TIME
    
%     plot(x,average34)
%     ax = gca;
%     ax.YAxisLocation = 'origin';
%     ax.XAxisLocation = 'origin';
%     hold on
end

%Julia -> save to .mat file for rereferencing
save('EEG_Data_All_Channels_Cut_According_To_Event','Phase_1_Face_Cut_Data','Phase_1_Random_Cut_Data','Phase_2_Face_Cut_Data','Phase_2_Random_Cut_Data','Phase_3_Face_Cut_Data','Phase_3_Random_Cut_Data')
