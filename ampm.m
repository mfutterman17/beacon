function dataSet = ampm(dataSet);
% isolate AM and PM data from weekday data
[h, m, s] = hms (dataSet.weekdays_Width500.time);
mornings = find (h > 4 & h < 11);
evenings = find (h > 3 & h < 10);
dataSet.wkdyAM_Width500 = dataSet.weekdays_Width500 (mornings, :);
dataSet.wkdyAM_Width750 = dataSet.weekdays_Width750 (mornings, :);
dataSet.wkdyPM_Width500 = dataSet.weekdays_Width500 (evenings, :);
dataSet.wkdyPM_Width750 = dataSet.weekdays_Width750 (evenings, :);
end 



