%Test function - takes two probability distributions in the form of two
%vectors of equal length, p1 and p2, the probabilities of observing each of
%k symbols given either a particular state or a particular string prefixed
%by a particular additional symbol, and tests whether they could have been
%taken from the same distribution using the kolmogorov-smirnov test with
%significance level alpha.

function [result, p] = Test(p1,p2, dist1, dist2, alpha)

[result,p,ks2stat]= kstest2(p1,p2,alpha); %1 for reject 0 for accept
