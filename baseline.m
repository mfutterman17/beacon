function RawData = baseline (RawData, WindowWidth)
% Calculate CO baseline
COAvg = RawData.COAvg;
CO2Avg = RawData.CO2Avg;
baseCO = NaN(size(COAvg));
baseCO2 = NaN (size(CO2Avg));
halfWidth = floor(WindowWidth/2);
halfWidthmin1 = halfWidth - 1;
parfor A = (halfWidth:(height(RawData)-halfWidth))
    window = (COAvg((A - halfWidthmin1):(A + halfWidthmin1)));
    base = mean(window(window < prctile(window,25)));
    baseCO (A) = base;
    window2 = (CO2Avg((A - halfWidthmin1):(A + halfWidthmin1)));
    base2 = mean(window2(window2 < prctile(window2,25)));
    baseCO2 (A) = base2;
end

RawData.baseCO = baseCO;
RawData.baseCO2 = baseCO2;

fprintf 'base complete. '

% For times within 30 minutes of ends
xxbeginning = [1:halfWidthmin1];
RawData.baseCO2(xxbeginning) = RawData.baseCO2(halfWidth);
RawData.baseCO(xxbeginning) = RawData.baseCO(halfWidth);

fprintf 'beginning fill complete. '

A = (height(RawData)-halfWidthmin1):(height(RawData));
RawData.baseCO2(A) = RawData.baseCO2(height(RawData)-halfWidth);
RawData.baseCO(A) = RawData.baseCO(height(RawData)-halfWidth);


fprintf 'end fill complete. '

% Make delta CO variable
RawData.deltaCO = RawData.COAvg - RawData.baseCO;

% Made delta CO2 variable
RawData.deltaCO2 = RawData.CO2Avg - RawData.baseCO2;

% find CO peaks
[COPeaks, prominence] = islocalmax(RawData.deltaCO,'MinSeparation',minutes(2),'SamplePoints',RawData.time);
RawData.COPeaks = RawData.deltaCO;
RawData.COPeaks (~COPeaks) = NaN;
RawData.pCO = prominence;

fprintf 'CO peaks calculated. '

% find CO2 peaks
CO2Peaks = islocalmax(RawData.deltaCO2,'MinSeparation',minutes(2),'SamplePoints',RawData.time);
RawData.CO2Peaks = RawData.deltaCO2;
RawData.CO2Peaks (~CO2Peaks) = NaN;

fprintf 'CO2 peaks calculated. '

% find all CO2 values within 30 seconds of CO peaks
% find peak times
RawData.CO2PeakTimes = RawData.time;
RawData.CO2PeakTimes (~CO2Peaks) = NaT;
% find indices of CO peaks
PeakIndex = [1:height(RawData)]';
PeakIndex (~COPeaks) = [];

% find indices of CO2 peaks
PeakIndexCO2 = [1:height(RawData)]';
PeakIndexCO2 (~CO2Peaks) = [];

% Make an array for time window centers
timeWindow = RawData.time(PeakIndex);

% Find "plumes"- CO peaks with CO2 peaks within 30 sec
for index = 1:length(PeakIndex)
    A = PeakIndex(index);
    B = timeWindow (index);
    indexbefore = find (RawData.CO2PeakTimes > (B) - seconds(30));
    timesbefore = RawData.CO2PeakTimes(find (RawData.CO2PeakTimes > ((B) - seconds(30))));
    valid = any(timesbefore < (B) + seconds (30));
    if valid == 1;
        RawData.match_COdelta(A) = RawData.COPeaks(A);
        RawData.match_COAvg(A) = RawData.COAvg(A);
        possible = RawData.CO2PeakTimes(indexbefore);
        CO2PlumeIndex = find(RawData.time == possible(1));
        RawData.match_CO2delta(CO2PlumeIndex) = RawData.CO2Peaks(CO2PlumeIndex);
        RawData.match_CO2Avg(CO2PlumeIndex) = RawData.CO2Avg(CO2PlumeIndex);
    end
    if A == (length(PeakIndex)/2)
        fprintf 'Plumes halfway complete. '
    end
end
RawData.match_CO2delta = standardizeMissing (RawData.match_CO2delta , [0 NaN]);
RawData.match_COdelta = standardizeMissing (RawData.match_COdelta , [0 NaN]);
RawData.match_COAvg = standardizeMissing (RawData.match_COAvg, [0 NaN]);
RawData.match_CO2Avg = standardizeMissing (RawData.match_CO2Avg, [0 NaN]);

fprintf 'Plumes calculated. '

% find indices of CO plume peaks
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.match_COdelta)) = [];
PlumeTimes = RawData.time (PlumeIndex);
RawData.COminTimes = NaT ([height(RawData),1]);


% find minima btwn peaks
for B = 1:(length(PlumeIndex)-1)
    Istart = PlumeIndex (B);
    Iend = PlumeIndex(B+1);
    COminPoss = islocalmin (RawData.deltaCO([Istart:Iend]));
    COmin = RawData ([Istart:Iend], {'deltaCO', 'time'});
    COmin = COmin(COminPoss,:);
    
    % find minimum closest, but >= 1 minute away from low peak
    for A = 1:(height(COmin))
        if COmin.time (A) >= ( PlumeTimes (B) + minutes(1) )
            index = find (RawData.time == COmin.time(A));
            RawData.COminTimes (index) = COmin.time (A);
            if ~isnat (RawData.COminTimes (index))
                break
            end
        end
    end
    clearvars index
    % find minimum closest, but >= 1 minute away from high peak
    for C = height(COmin):-1:1
        if COmin.time (C) <= ( PlumeTimes (B+1) - minutes(1) )
            index = find (RawData.time == COmin.time(C));
            RawData.COminTimes (index) = COmin.time (C);
            if ~isnat (RawData.COminTimes (index))
                break
            end
        end
    end
end

clearvars index

% find inidicies of minimum values
minIndices = find (~ismissing(RawData.COminTimes));

% find COAvg values at indices
for A = 1:length(minIndices)
    RawData.COmin (minIndices(A)) = RawData.COAvg (minIndices(A));
end
RawData.COmin = standardizeMissing (RawData.COmin, [0]);

%find inidicies of minimum values
for A = 1:(length(minIndices)-1)
    Istart = minIndices(A);
    Iend = minIndices(A + 1);
    mdl = fitlm (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]));
    index = PlumeIndex(Istart < PlumeIndex);
    index = index(index < Iend);
    RawData.rsquare (index) = mdl.Rsquared.Adjusted;
    line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
    slopeDelt = line(1,1);
    if slopeDelt > 0
       RawData.PlumeCO(index) = RawData.COAvg(index);
       RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
       RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
       RawData.EF (index) = slopeDelt;
    end
end
RawData.PlumeMin = standardizeMissing(RawData.PlumeMin, [0 NaN]);
RawData.PlumeCO = standardizeMissing(RawData.PlumeCO, [0 NaN]);
RawData.EF = standardizeMissing(RawData.EF, [0 NaN]);
RawData.rsquare = standardizeMissing (RawData.rsquare, [0 NaN]);
end

