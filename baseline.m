function  baseline 
% Calculate CO baseline
for A = 500:(height(week)-500);
    window = (week.COAvg((A - 499):(A + 499)));
    base = mean(window(window < prctile(window,25)));
    week.baseCO (A) = base;
     if A == 1010827
        fprintf 'CO base halfway processed'
    end
end
 
fprintf 'CO base complete'

% Calculate CO2 baseline
for A = 500:(height(week)-500);
    window = (week.CO2Avg((A - 499):(A + 499)));
    base = mean(window(window < prctile(window,25)));
    week.baseCO2 (A) = base;
    if A == 1010827
        fprintf 'CO2 base halfway processed'
    end
end

fprintf 'CO2 base complete'

% For times within 30 minutes of ends
for A = 1:499 
    week.baseCO2(A) = week.baseCO2(500);
    week.baseCO(A) = week.baseCO(500);
end

fprintf 'beginning fill complete'

for A = (height(week)-500):(height(week))
    week.baseCO2(A) = week.baseCO2(height(week)-500);
    week.baseCO(A) = week.baseCO(height(week)-500);
end

fprintf 'end fill complete'

% Make delta CO variable
week.deltaCO = week.COAvg - week.baseCO;

% Made delta CO2 variable
week.deltaCO2 = week.CO2Avg - week.baseCO2;
end

