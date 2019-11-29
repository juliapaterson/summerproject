%arguments are the name of the dot file passed to dot to plot the graph and
%graphfilename which is the filename given to the saved images (with the
%appropriate suffixs)
function DisplayGraph(DFName, Graphfilename, options)

Graphfilename = strcat(Graphfilename(1:length(Graphfilename)-4),'.png');
MatlabFigName = strcat(Graphfilename(1:length(Graphfilename)-4), '.fig');
PDFname = Graphfilename(1:length(Graphfilename)-4);

DOSCommand2 = sprintf('dot -Tpng %s -o %s', DFName, Graphfilename);

system(DOSCommand2);

fclose('all');

%displaying the graphs
[X, map] = imread(Graphfilename);
h= figure('color','k');
image(X)
colormap(map)
axis off
axis image
if options(2) == 1
saveas(h,MatlabFigName,'fig')
end
if options(1) == 1
saveas(h,Graphfilename,'png')
end
if options(9) == 1
export_fig(PDFname,'-pdf');
end