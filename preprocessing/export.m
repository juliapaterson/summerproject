%import median split channels
% median = load('median_split.mat');
% %save to txt file with space delimiter
% dlmwrite('median11.txt',median.samp11,' ')
% dlmwrite('median12.txt',median.samp12,' ') 
% dlmwrite('median21.txt',median.samp21,' ') 
% dlmwrite('median22.txt',median.samp22,' ') 
% dlmwrite('median31.txt',median.samp31,' ') 
% dlmwrite('median32.txt',median.samp32,' ') 

%isolate channels for .mat for cssr
load('median_split.mat');
a = samp11(:,:,1);

b = samp12(:,:,1);
%create an empty vector to concat to
% results = double.empty(214,0);
% aresults = [a results];
x = a(1, :);
%x2 = a(2, :);
z = size(a);
for i=2:z(1)
    x = horzcat(x,a(i,:));
end

save('samp11_ch1','x')

%make alphabet vector [0 1]
alphabet = [0 1];

%make options
option = [0 0 0 0 0 0 0 0];

%clear channels and import differentiated ones
% clear
% differentiate = load('differentiated.mat');
% %save to txt file with space delimiter - exported something weird and big
% %so fix this
% dlmwrite('differentiated11.txt',differentiate.samp11,' ')
% dlmwrite('differentiated12.txt',differentiate.samp12,' ') 
% dlmwrite('differentiated21.txt',differentiate.samp21,' ') 
% dlmwrite('differentiated22.txt',differentiate.samp22,' ') 
% dlmwrite('differentiated31.txt',differentiate.samp31,' ') 
% dlmwrite('differentiated32.txt',differentiate.samp32,' ') 