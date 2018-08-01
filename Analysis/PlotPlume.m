function [slopeDelt, SlopeAvg] = PlotPlume(dataset,index)
%UNTITLED3 Summary of this function goes here
%Plotting a Plume
% define indices vector
minIndices = find (~ismissing(dataset.COmin));

%Set bordering minimums
    tstart = dataset.time(minIndices(index));
    tend = dataset.time(minIndices(index + 1));

%Plot CO and CO2 
figure ('Name', 'Plume', 'NumberTitle','off');
% Plot CO2
    yyaxis right 
    p1 = plot (dataset.time, dataset.CO2Avg, 'c');
    hold on
    xlim ([tstart, tend]);
    %plot baseline
    b1 = plot (dataset.time, dataset.baseCO2, 'm');
    ylabel 'CO2 (ppm)'
%Plot CO
    yyaxis left
    p2 = plot (dataset.time, dataset.COAvg, 'b');
    %plot baseline
    b1 = plot (dataset.time, dataset.baseCO, 'k');
    ylabel 'CO (V)'
    p3 = scatter(dataset.time, dataset.PlumeCOAvg, 'r*');
    p4 = scatter(dataset.time, dataset.COminAvgVal, 'go');
    legend ('CO','CO base','max','min', 'CO2', 'CO2 base', 'Location', 'southoutside');

%Title Plume chart
    %make date title text
    titleStart = tstart;
    titleStart.Format = 'MM-dd HH:mm:ss';
    titleStart = char(titleStart);
    titleEnd = tend;
    titleEnd.Format = 'MM-dd HH:mm:ss';
    titleEnd = char(titleEnd);

title ( [titleStart ' to ' titleEnd] )
hold off

%Plot scatter from deltas
Istart = minIndices(index);
Iend = minIndices (index+1);
figure ('Name', 'Scatter', 'NumberTitle','off');
scatter (dataset.deltaCO2([Istart:Iend]), dataset.deltaCO([Istart:Iend]));
xlabel 'delta CO2 (ppm)'
ylabel 'delta CO (V)'
title ( [titleStart ' to ' titleEnd] )

%Calculate Emissions Factor
line = polyfit (dataset.deltaCO2([Istart:Iend]), dataset.deltaCO([Istart:Iend]),1);
hold on
lsline
hold off
slopeDelt = line(1,1)

%Plot scatter from Avgs
Istart = minIndices(index);
Iend = minIndices (index+1);
figure ('Name', 'Scatter', 'NumberTitle','off');
scatter (dataset.CO2Avg([Istart:Iend]), dataset.COAvg([Istart:Iend]));
xlabel 'CO2 (ppm)'
ylabel 'CO (V)'
title ( [titleStart ' to ' titleEnd] )

%Calculate Emissions Factor
line = polyfit (dataset.CO2Avg([Istart:Iend]), dataset.COAvg([Istart:Iend]),1);
hold on
lsline
hold off
slopeAvg = line(1,1)

%calculate RsquareAvg
mdl = fitlm (dataset.CO2Avg([Istart:Iend]), dataset.COAvg([Istart:Iend]));
rsquareAvg = mdl.Rsquared.Adjusted

%calculate RsquareDelta
mdl = fitlm (dataset.deltaCO2([Istart:Iend]), dataset.deltaCO([Istart:Iend]));
rsquareDelta = mdl.Rsquared.Adjusted
end

