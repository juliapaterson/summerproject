%import median split channels
median = load('median_split.mat');
%save to txt file with space delimiter
dlmwrite('median11.txt',median.samp11,' ')
dlmwrite('median12.txt',median.samp12,' ') 
dlmwrite('median21.txt',median.samp21,' ') 
dlmwrite('median22.txt',median.samp22,' ') 
dlmwrite('median31.txt',median.samp31,' ') 
dlmwrite('median32.txt',median.samp32,' ') 

%clear channels and import differentiated ones
clear
differentiate = load('differentiated.mat');
%save to txt file with space delimiter - exported something weird and big
%so fix this
dlmwrite('differentiated11.txt',differentiate.samp11,' ')
dlmwrite('differentiated12.txt',differentiate.samp12,' ') 
dlmwrite('differentiated21.txt',differentiate.samp21,' ') 
dlmwrite('differentiated22.txt',differentiate.samp22,' ') 
dlmwrite('differentiated31.txt',differentiate.samp31,' ') 
dlmwrite('differentiated32.txt',differentiate.samp32,' ') 