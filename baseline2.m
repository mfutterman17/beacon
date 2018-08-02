function RawData = baseline2 (RawData, WindowWidth)
%this is a comment
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
    if mod(A,1000) == 0
        fprintf('  A = %d\n', A)
    end
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
COPeaks = islocalmax(RawData.deltaCO,'MinSeparation',minutes(3),'SamplePoints',RawData.time);
RawData.COPeaks = RawData.deltaCO;
RawData.COPeaks (~COPeaks) = NaN;
RawData.PeakCOAvg = RawData.COAvg;
RawData.PeakCOAvg (~COPeaks) = NaN;

fprintf 'CO peaks calculated. '

% find CO2 peaks
CO2Peaks = islocalmax(RawData.deltaCO2,'MinSeparation',minutes(3),'SamplePoints',RawData.time);
RawData.CO2Peaks = RawData.deltaCO2;
RawData.CO2Peaks (~CO2Peaks) = NaN;
RawData.PeakCO2Avg = RawData.CO2Avg;
RawData.PeakCO2Avg (~CO2Peaks) = NaN;

fprintf 'CO2 peaks calculated. '


% find indices of CO peaks
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

%set an index window to look for the minima
for B = 1:(length(PlumeIndex)-1)
    COmin = min((RawData.deltaCO((PlumeIndex(B)):(PlumeIndex(B+1)))),[] ,'omitnan');
    % find possible indices of COmin in COAvg
    COminIndex = find ((RawData.deltaCO == COmin ));
    % select the index between plumes
    for X = (1:length(COminIndex))
        if COminIndex(X) > (PlumeIndex(B)) && COminIndex(X) < (PlumeIndex(B+1));
            I = COminIndex(X);
        end
        % If greater than a minute, record it as a minimum, else dont record it as a minimum
        if ((abs( (RawData.time (I)) - (RawData.time(PlumeIndex(B))))) > minutes(1)) && ((abs((RawData.time (PlumeIndex(B+1)))- (RawData.time (I)) ))> minutes(1));
            RawData.COmin (I) = COmin;
            RawData.COminTimes (I) = RawData.time (I);
        end
    end
end
% convert empty rows in COmin to NaN
RawData.COmin = standardizeMissing(RawData.COmin, [NaN -999 0]);

COminIndex = find (~ismissing (RawData.COmin));
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

%find plumes where rsquared > 0.6 and slope > 0
for A = 1:(length(COminIndex)-1)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    if Iend ~= Istart + 1
        mdl = fitlm (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]));
        if mdl.Rsquared.Adjusted > 0.6
            X = PlumeIndex(Istart < PlumeIndex);
            indices(:,1) = X(X < Iend);
            if length(indices) > 1
                indices(:,2) = RawData.deltaCO(indices);
                index = (indices(find(indices(:,2) == (max(indices(:,2)))), 1));
                RawData.PlumeCO(index) = RawData.COAvg(index);
                RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
            end
            if length(indices) == 1
                line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
                slopeDelt = line(1,1);
                if slopeDelt > 0
                    RawData.PlumeCO(indices) = RawData.COAvg(indices);
                    RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                    RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
                    RawData.EF(indices) = slopeDelt;
                end
            end
        end
    end
    clearvars indices index
end
RawData.PlumeMin = standardizeMissing(RawData.PlumeMin, [0 NaN]);
RawData.PlumeCO = standardizeMissing(RawData.PlumeCO, [0 NaN]);
RawData.EF = standardizeMissing(RawData.EF, [0 NaN]);

end

