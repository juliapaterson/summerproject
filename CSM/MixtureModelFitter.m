function [MEAN, VAR, bestN, MPs] = MixtureModelFitter(a, n, option)

AICmin = 9999999;

maxN = n;

if option == 0
    minN = 1;
elseif option == 1
    minN = maxN;
end

for N = minN:maxN

    obj = gmdistribution.fit(a',N);
    mps = obj.PComponents;
    ComponentMeans = obj.mu;
    ComponentCovariances = obj.Sigma;
    AIC= obj.AIC;

    if AIC < AICmin
        AICmin = AIC;
        bestN = N;
        MEAN = ComponentMeans;
        MPs = mps;
        for i = 1:N
            VAR(i) = ComponentCovariances(i);
        end
    end

end

