function [MEAN, VAR, bestN, MPs] = AICefmakerS(a)

AICmin = 9999999;

for N = 2

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

