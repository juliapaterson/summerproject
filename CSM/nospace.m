load('median_split.mat');

ch1face = samp11(:,:,1);
dlmwrite('ch1face.txt',ch1face,' ')

fid = fopen('ch1face_nospace.txt','wt');
fprintf(fid,'%s',strrep(fileread('ch1face.txt'),' ',''))
fclose(fid);