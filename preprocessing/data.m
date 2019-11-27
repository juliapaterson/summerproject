%import shafto eeg data to eeglab
%from array: eegdata = rand(32, 256*100);

%from edf file - file - import - from edf
%extract event records - file - import event info - from data channel
%https://sccn.ucsd.edu/wiki/A01:_Importing_Continuous_Epoched_Data
%errors?

%need to split vmrk file into relevant strings
%mrk = readMarkerTable(7MJN_MoveMarkers, [fs=100, markerTypes, flag]);

file = fopen('7MJN_MoveMarkers.txt', 'r');
formatSpec = '%d %s';
MoveMarkers = fscanf('7MJN_MoveMarkers.txt', formatSpec);

%text = fileread('7MJN_MoveMarkers.txt');