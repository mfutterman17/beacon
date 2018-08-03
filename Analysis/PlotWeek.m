function PlotWeek (dataSet,tstart, tend, name)
% Plot a dataset's worth of data 
% define indices vector

%Plot CO and CO2
figure ('Name', 'Week', 'NumberTitle','off');

% Plot CO2
yyaxis right
p1 = plot (dataSet.time, dataSet.CO2Avg, 'c');
hold on
xlim ([tstart, tend]);
%plot baseline
b1 = plot (dataSet.time, dataSet.baseCO2, 'm');
ylabel 'CO2 (ppm)'

%Plot CO
yyaxis left
p2 = plot (dataSet.time, dataSet.COAvg, 'b');
%plot baseline
b1 = plot (dataSet.time, dataSet.baseCO, 'k');
ylabel 'CO (V)'
    p3 = scatter(dataSet.time, dataSet.PlumeCO, 'r*');
    p4 = scatter(dataSet.time, dataSet.PlumeMin, 'go');
    legend ('CO','CO base','max','min', 'CO2', 'CO2 base', 'Location', 'westoutside');

%Title Plume chart
%make date title text
title (name)
hold off

%Calculate Emissions Factor
line = polyfit (dataSet.deltaCO2, dataSet.deltaCO,1);
slope = line(1,1)


%Calculate Emissions Factor
line = polyfit (dataSet.CO2Avg, dataSet.COAvg,1);
slope = line(1,1)

% calculate R-square
mdl = fitlm (dataSet.CO2Avg, dataSet.COAvg);
rsquare = mdl.Rsquared.Adjusted


end

