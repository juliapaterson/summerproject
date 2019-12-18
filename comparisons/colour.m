X = [1 2 3; 1 2 3; 1 2 3];
Y = X';
mymap = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 0 0];
C = [5 13 9 7 12; 11 2 14 8 10; 6 1 3 4 15];
s = pcolor(C);
s.FaceColor = 'interp';
colormap(mymap)

%%
mymap = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 0 0];
square_mat = zeros(15,15);
square_mat(8,8) = 1;

figure(1)
colormap(mymap)
imagesc(square_mat)

%%
d = [face_complexities;random_complexities];
h = heatmap(d);