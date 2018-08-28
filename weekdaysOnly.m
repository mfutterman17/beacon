function dataSet = weekdaysOnly (dataSet)
% separate weekdays
daynums = weekday (dataSet.Width500.time);
tuesdays = find (daynums == 3);
wednesdays = find (daynums == 4);
thursdays = find (daynums == 5);
weekdays = [tuesdays; wednesdays; thursdays];
dataSet.weekdays_Width750 = dataSet.Width750 (weekdays, :);
end 