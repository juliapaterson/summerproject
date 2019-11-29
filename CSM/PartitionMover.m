function NewPartitionLocation = PartitionMover...
    (Area, FixedPartition, MovingPartition, Mean, Var)

mu = Mean;
sigma = Var^0.5;

if FixedPartition < MovingPartition
    A = FixedPartition;
    B = MovingPartition;
else
    B = FixedPartition;
    A = MovingPartition;
end

if FixedPartition < MovingPartition %we make B the subject of the equation
    
    NewPartitionLocation = ...
        mu -(erfinv(erf(1/2*2^(1/2)*(-A+mu)/sigma)-2*Area)*(2*sigma)/(2^0.5));
    
else %we make A the subject of the equation
    
    NewPartitionLocation = ...
        mu -(erfinv(erf(1/2*2^(1/2)*(-B+mu)/sigma)+2*Area)*(2*sigma)/(2^0.5));
    
end