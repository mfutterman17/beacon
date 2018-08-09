function [rsquareDelta] = PlotPlume_fromWindow(RawData,tstart, tend)
%% Find range of datapoints between adjusted window
range = find (RawData.COminTimes > tstart & RawData.COminTimes < tend); 
xStart = RawData.COminTimes(range(1));
xEnd = RawData.COminTimes(range(end));
minIndices = find (~ismissing(RawData.PlumeMin));

%Plot CO and CO2
figure ('Name', 'Week', 'NumberTitle','off');

% Plot CO2
yyaxis right
p1 = plot (RawData.time, RawData.CO2Avg, 'c');
hold on
xlim ([tstart, tend]);
%plot baseline
b1 = plot (RawData.time, RawData.baseCO2, 'm');
ylabel 'CO2 (ppm)'

%Plot CO
yyaxis left
p2 = plot (RawData.time, RawData.COAvg, 'b');
%plot baseline
b1 = plot (RawData.time, RawData.baseCO, 'k');
ylabel 'CO (V)'
    p3 = scatter(RawData.time, RawData.PlumeCO, 'r*');
    p4 = scatter(RawData.time, RawData.PlumeMin, 'go');
    legend ('CO','CO base','max','min', 'CO2', 'CO2 base', 'Location', 'westoutside');

%Title Plume chart
%make date title text
titleStart = char(xStart);
titleEnd = char(xEnd);

title ( [titleStart ' to ' titleEnd] )
hold off

% Make scatter range
scatLow = find (RawData.time == xStart);
scatHigh = find (RawData.time == xEnd);
scatRange = [scatLow:scatHigh];

%Plot scatter from deltas
figure ('Name', 'Scatter', 'NumberTitle','off');
scatter (RawData.deltaCO2(scatRange), RawData.deltaCO(scatRange));
xlabel 'delta CO2 (ppm)'
ylabel 'delta CO (V)'
title ( [titleStart ' to ' titleEnd] )

%Calculate Emissions Factor
line = polyfit (RawData.deltaCO2(scatRange), RawData.deltaCO(scatRange),1);
hold on
lsline
hold off
slopeDelt = line(1,1)

%Plot scatter from Avgs
figure ('Name', 'Scatter', 'NumberTitle','off');
scatter (RawData.CO2Avg(scatRange), RawData.COAvg(scatRange));
xlabel 'CO2 (ppm)'
ylabel 'CO (V)'
title ( [titleStart ' to ' titleEnd] )

%Calculate Emissions Factor
line = polyfit (RawData.CO2Avg(scatRange), RawData.COAvg(scatRange),1);
hold on
lsline
hold off
slopeAvg = line(1,1)

%calculate RsquareAvg
mdl = fitlm (RawData.CO2Avg(scatRange), RawData.COAvg(scatRange));
rsquareAvg = mdl.Rsquared.Adjusted

%calculate RsquareDelta
mdl = fitlm (RawData.deltaCO2(scatRange), RawData.deltaCO(scatRange));
rsquareDelta = mdl.Rsquared.Adjusted
end

