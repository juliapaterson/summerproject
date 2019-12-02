%%setup
%isolate channels for .mat for cssr
load('median_split.mat');

%make alphabet vector [0 1]
alphabet = [0 1];

%make options
option = [0 0 0 1 1 0 0 0]; %set 4 and 5 to one for complexity and entropy

%%
%occipital channels:
ch1face = samp11(:,:,1);
CSSR(ch1face, alphabet,2, 0.005, 'facech1', option);
ch1random = samp12(:,:,1);
CSSR(ch1random, alphabet,2, 0.005, 'randomch1', option);

ch24face = samp11(:,:,24);
CSSR(ch24face, alphabet,2, 0.005, 'facech24', option);
ch24random = samp12(:,:,24);
CSSR(ch24random, alphabet,2, 0.005, 'randomch24', option);

ch10face = samp11(:,:,10);
CSSR(ch10face, alphabet,2, 0.005, 'facech10', option);
ch10random = samp12(:,:,10);
CSSR(ch10random, alphabet,2, 0.005, 'randomch10', option);

ch12face = samp11(:,:,12);
CSSR(ch12face, alphabet,2, 0.005, 'facech12', option);
ch12random = samp12(:,:,12);
CSSR(ch12random, alphabet,2, 0.005, 'randomch12', option);

ch5face = samp11(:,:,5);
CSSR(ch1face, alphabet,2, 0.005, 'facech5', option);
ch5random = samp12(:,:,5);
CSSR(ch5random, alphabet,2, 0.005, 'randomch5', option);

ch6face = samp11(:,:,6);
CSSR(ch6face, alphabet,2, 0.005, 'facech6', option);
ch6random = samp12(:,:,6);
CSSR(ch6random, alphabet,2, 0.005, 'randomch6', option);

ch13face = samp11(:,:,13);
CSSR(ch13face, alphabet,2, 0.005, 'facech13', option);
ch13random = samp12(:,:,13);
CSSR(ch13random, alphabet,2, 0.005, 'randomch13', option);

ch11face = samp11(:,:,11);
CSSR(ch11face, alphabet,2, 0.005, 'facech11', option);
ch11random = samp12(:,:,11);
CSSR(ch11random, alphabet,2, 0.005, 'random11', option);

ch2face = samp11(:,:,2);
CSSR(ch2face, alphabet,2, 0.005, 'facech2', option);
ch2random = samp12(:,:,2);
CSSR(ch2random, alphabet,2, 0.005, 'randomch2', option);
%%
%frontal channels:
ch22face = samp11(:,:,22);
CSSR(ch22face, alphabet,2, 0.005, 'facech22', option);
ch22random = samp12(:,:,22);
CSSR(ch22random, alphabet,2, 0.005, 'randomch22', option);

ch9face = samp11(:,:,9);
CSSR(ch9face, alphabet,2, 0.005, 'facech9', option);
ch9random = samp12(:,:,9);
CSSR(ch9random, alphabet,2, 0.005, 'randomch9', option);

ch23face = samp11(:,:,23);
CSSR(ch23face, alphabet,2, 0.005, 'facech23', option);
ch23random = samp12(:,:,10);
CSSR(ch23random, alphabet,2, 0.005, 'randomch23', option);

ch34face = samp11(:,:,34);
CSSR(ch34face, alphabet,2, 0.005, 'facech34', option);
ch34random = samp12(:,:,12);
CSSR(ch34random, alphabet,2, 0.005, 'randomch34', option);

ch20face = samp11(:,:,20);
CSSR(ch20face, alphabet,2, 0.005, 'facech20', option);
ch20random = samp12(:,:,20);
CSSR(ch20random, alphabet,2, 0.005, 'randomch20', option);

ch8face = samp11(:,:,8);
CSSR(ch8face, alphabet,2, 0.005, 'facech8', option);
ch8random = samp12(:,:,8);
CSSR(ch8random, alphabet,2, 0.005, 'randomch8', option);

ch21face = samp11(:,:,21);
CSSR(ch21face, alphabet,2, 0.005, 'facech21', option);
ch21random = samp12(:,:,21);
CSSR(ch21random, alphabet,2, 0.005, 'randomch21', option);

ch35face = samp11(:,:,35);
CSSR(ch35face, alphabet,2, 0.005, 'facech35', option);
ch35random = samp12(:,:,35);
CSSR(ch35random, alphabet,2, 0.005, 'random35', option);

ch33face = samp11(:,:,33);
CSSR(ch33face, alphabet,2, 0.005, 'facech33', option);
ch33random = samp12(:,:,33);
CSSR(ch33random, alphabet,2, 0.005, 'randomch33', option);
%%
%import median split channels
% median = load('median_split.mat');
% %save to txt file with space delimiter
% dlmwrite('median11.txt',median.samp11,' ')
% dlmwrite('median12.txt',median.samp12,' ') 
% dlmwrite('median21.txt',median.samp21,' ') 
% dlmwrite('median22.txt',median.samp22,' ') 
% dlmwrite('median31.txt',median.samp31,' ') 
% dlmwrite('median32.txt',median.samp32,' ') 

%create an empty vector to concat to
% results = double.empty(214,0);
% aresults = [a results];
% x = a(1, :);
% x2 = a(2, :);
% z = size(a);
% for i=2:z(1)
%     x = horzcat(x,a(i,:));
% end

%save('samp11_ch1','x')

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