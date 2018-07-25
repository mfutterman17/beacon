function RawData = baseline (RawData, WindowWidth)
% Calculate CO baseline
COAvg = RawData.COAvg;
CO2Avg = RawData.CO2Avg;
baseCO = NaN(size(COAvg));
baseCO2 = NaN (size(CO2Avg));
halfWidth = floor(WindowWidth/2);
halfWidthmin1 = halfWidth - 1;
parfor A = (halfWidth:(height(RawData)-halfWidth));
    window = (COAvg((A - halfWidthmin1):(A + halfWidthmin1)));
    base = mean(window(window < prctile(window,25)));
    baseCO (A) = base;
    window2 = (CO2Avg((A - halfWidthmin1):(A + halfWidthmin1)));
    base2 = mean(window2(window2 < prctile(window2,25)));
    baseCO2 (A) = base2;
    if mod(A,1000) == 0
        fprintf('  A = %d\n', A)
    end
end

RawData.baseCO = baseCO;
RawData.baseCO2 = baseCO2;

fprintf 'base complete'

% For times within 30 minutes of ends
xxbeginning = [1:halfWidthmin1];
RawData.baseCO2(xxbeginning) = RawData.baseCO2(halfWidth);
RawData.baseCO(xxbeginning) = RawData.baseCO(halfWidth);

fprintf 'beginning fill complete'

A = (height(RawData)-halfWidthmin1):(height(RawData));
RawData.baseCO2(A) = RawData.baseCO2(height(RawData)-halfWidth);
RawData.baseCO(A) = RawData.baseCO(height(RawData)-halfWidth);


fprintf 'end fill complete'

% Make delta CO variable
RawData.deltaCO = RawData.COAvg - RawData.baseCO;

% Made delta CO2 variable
RawData.deltaCO2 = RawData.CO2Avg - RawData.baseCO2;
end

