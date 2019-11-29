
function [DiscretisedSignal PartitionLocations] = NoncommittalDiscretisation...
    (ContinuousSignal, MEAN, VAR, bestN, MPs, displaygraphs)

%find the points at the edges of the emission functions
%encompassing 3 standard deviations. Order.
DiscretisedSignal = zeros(size(ContinuousSignal,1), size(ContinuousSignal,1));

%First we find the partitions
tolerance = 3; %standard deviations
PartitionLocations = zeros(2*bestN,1);

count = 1;
for i = 1:bestN
    PartitionLocations(count) = MEAN(i) - tolerance*(VAR(i)^0.5);
    PartitionLocations(count+1) = MEAN(i) + tolerance*(VAR(i)^0.5);
    count = count + 2;
end

PartitionLocations = sort(PartitionLocations);
NumPartitions = length(PartitionLocations);

if displaygraphs == 1
    %plot this
    figure
    hold on
    MAXIMUM = 0;

    for i = 1:NumPartitions

        if mod(i,2) == 0

            xleft = PartitionLocations(i-1);
            xright = PartitionLocations(i);
            xdiff = (xright-xleft)/600;
            areax = xleft:xdiff:xright;

            [areaMEAN IX] = sort(MEAN);
            areaVAR = VAR(IX);
            areaMPs = MPs(IX);
            areaVAR(i/2);
            areaMEAN(i/2);
            areay = (1/(2*pi*areaVAR(i/2))^0.5)*exp((-(areax-areaMEAN(i/2)).^2)/(2*areaVAR(i/2)));

            Area = AreaCalculator(areaMEAN(i/2), areaVAR(i/2), areax(1), areax(length(areax)));
            areay= Area*areaMPs(i/2)*areay/sum(areay*xdiff);

            h = area(areax,areay);

            set(h(1),'FaceColor',[0.8 0.8 0.8])
            set(h(1), 'EdgeColor', 'none')
            
            if max(areay) > MAXIMUM
                MAXIMUM = max(areay);
            end

        end        
        
    end
    
    [maximum, maxloc] = max(MEAN);
    [minimum, minloc] = min(MEAN);

    x = MEAN(minloc)-3*VAR(minloc)^0.5:VAR(minloc)^0.5/400:MEAN(maxloc)+3*VAR(maxloc)^0.5;
    xdiff = x(2) - x(1);

    for i = 1:bestN
        y  = (1/(2*pi*VAR(i))^0.5)*exp((-(x-MEAN(i)).^2)/(2*VAR(i)));
        Area = AreaCalculator(MEAN(i), VAR(i), x(1), x(length(x)));
        y= Area * MPs(i)*y/sum(y*xdiff);
        plot(x,y,'k','LineWidth',1)        
    end
    
    for i = 1:NumPartitions
        line([PartitionLocations(i) PartitionLocations(i)], [0 1.1*MAXIMUM], 'Color', 'k')
    end
    
end


%Then we must calculate the area in each 'known'/even section and also keep
%track of which emission function (mean and var) this area represents
%the areas are recorded in the array 'Areas' in the order in which the
%partitions appear in 'PartitionLocations'
count =1;
for i = 1:2:NumPartitions - 1
    for j = 1:bestN
        AllAreas(j) = AreaCalculator(MEAN(j), VAR(j), PartitionLocations(i), PartitionLocations(i+1));
    end
    [Areas(count,1), Areas(count,2)] =max(AllAreas);
    count =count +1 ;
end

%find the minimum area
[MinArea, SmallestSection] = min(Areas(:,1));
MinArea = MinArea(1);
%Now adjust all the other areas to match. For simplicity we will move the
%partition which corresponds the the highest probability density
count = 0;
ai = 0;
for i = 1:2:NumPartitions - 1
    ai = ai + 1;
    count = count + 1;
    if ai~=SmallestSection
        x1 = PartitionLocations(i);
        x2 = PartitionLocations(i+1);
        mu = MEAN(Areas(count,2));
        sigma = VAR(Areas(count,2))^0.5;

        PD1 = (1/(2*pi*sigma^2)^0.5)*exp((-(x1-mu)^2)/(2*sigma^2));
        PD2 = (1/(2*pi*sigma^2)^0.5)*exp((-(x2-mu)^2)/(2*sigma^2));

        if PD1 > PD2
            FixedPartition = x2;
            MovingPartition = x1;
        else
            FixedPartition = x1;
            MovingPartition = x2;
        end

        NewPartitionLocation = PartitionMover...
            (MinArea, FixedPartition, MovingPartition, mu, sigma^2);

        if PD1 > PD2
            PartitionLocations(i) = NewPartitionLocation;
        else
            PartitionLocations(i+1) = NewPartitionLocation;
        end
    end
end

if displaygraphs == 1
    for i = 1:NumPartitions
        line([PartitionLocations(i) PartitionLocations(i)], [0 1.1*MAXIMUM], 'Color', 'r','LineStyle', '--')
    end
end


%Now discretise
for row = 1:size(ContinuousSignal,1)
    for i = 1:size(ContinuousSignal,2)

        assigned = 0;

        for j = 2:length(PartitionLocations)
            if ContinuousSignal(row, i) < PartitionLocations(j) && assigned ~=1
                DiscretisedSignal(row, i) = j-2;
                assigned  = 1;
            end
        end

        if assigned ~= 1
            DiscretisedSignal(row, i) = length(PartitionLocations)-2;
        end

    end
end

if displaygraphs == 1
    
    for i = 2:length(PartitionLocations)
        SymbolLocations(i-1) = PartitionLocations(i-1) + 0.5*(PartitionLocations(i)-PartitionLocations(i-1));
    end
    for j = 1:size(DiscretisedSignal,1)
        for i = 1:size(DiscretisedSignal,2)
            symseq(j,i) = SymbolLocations(DiscretisedSignal(j,i)+1);
        end
    end
    figure
    hold on
    plot(ContinuousSignal(1,:),'kx')
    plot(symseq(1,:),'rsq')
    for i = 1:length(PartitionLocations)
        line([size(ContinuousSignal,2) 0], [PartitionLocations(i) PartitionLocations(i)], 'Color', 'r')
    end
end
