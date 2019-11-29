function Area = AreaCalculator(Mean, Var, a, b)

mu = Mean;
sigma = Var^0.5;

if a<b
    A = a;
    B = b;
else
    A = b;
    B = a;
end

Area = 1/2*(erf(1/2*2^(1/2)*(-A+mu)/sigma)-erf(1/2*2^(1/2)*(-B+mu)/sigma));