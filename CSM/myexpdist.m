function y = myexpdist(x,xdata)

y = exppdf(xdata,x);
y = y/sum(y)/(xdata(2)-xdata(1));
