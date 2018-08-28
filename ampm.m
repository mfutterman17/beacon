function dataSet = ampm(dataSet);
% isolate AM and PM data from weekday data
[h, m, s] = hms (dataSet.weekdays_Width750.time);
mornings = find (h > 5 & h < 10);
evenings = find (h > 2 & h < 7);
dataSet.wkdyAM_Width750 = dataSet.weekdays_Width750 (mornings, :);
dataSet.wkdyPM_Width750 = dataSet.weekdays_Width750 (evenings, :);
end 



