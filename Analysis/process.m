function RawData = process (RawData)
% find CO peaks
[COPeaks, prominence] = islocalmax(RawData.deltaCO,'MinSeparation',minutes(3),'SamplePoints',RawData.time);
RawData.COPeaks = RawData.deltaCO;
RawData.COPeaks (~COPeaks) = NaN;
RawData.pCO = prominence;

RawData.PeakCOAvg = RawData.COAvg;
RawData.PeakCOAvg (~COPeaks) = NaN;


RawData.COPeaks = standardizeMissing (RawData.COPeaks, [0 NaN]);
RawData.PeakCOAvg = standardizeMissing (RawData.PeakCOAvg, [0 NaN]);


fprintf 'CO peaks calculated. '


% find CO2 peaks
[CO2Peaks] = islocalmax(RawData.deltaCO2,'MinSeparation',minutes(3),'SamplePoints',RawData.time);


%establish CO2 peaks
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

fprintf 'minima calculated. '

COminIndex = find (~ismissing (RawData.COmin));
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

%find plumes where rsquared > 0.4 and slope > 0
for A = 1:(length(COminIndex)-1)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    if Iend ~= (Istart + 1)
        mdl = fitlm (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]));
        if mdl.Rsquared.Adjusted > 0.4
            X = PlumeIndex(Istart < PlumeIndex);
            indices(:,1) = X(X < Iend);
            if length(indices) > 1
                indices(:,2) = RawData.deltaCO(indices);
                index = (indices(find(indices(:,2) == (max(indices(:,2)))), 1));
                line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
                slopeDelt = line(1,1);
                if slopeDelt > 0
                    RawData.PlumeCO(index) = RawData.COAvg(index);
                    RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                    RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
                    RawData.EF (index) = slopeDelt;
                    RawData.rsqr (index) = mdl.Rsquared.Adjusted;
                end
            end
            if length(indices) == 1
                line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
                slopeDelt = line(1,1);
                if slopeDelt > 0
                    RawData.PlumeCO(indices) = RawData.COAvg(indices);
                    RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                    RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
                    RawData.EF(indices) = slopeDelt;
                    RawData.rsqr (indices) = mdl.Rsquared.Adjusted;
                end             
            end
        end
        if A == floor(length(COminIndex)/2)
            fprintf 'Plumes halfway calculated. '
        end
    end
    clearvars indices index
end
RawData.PlumeMin = standardizeMissing(RawData.PlumeMin, [0 NaN]);
RawData.PlumeCO = standardizeMissing(RawData.PlumeCO, [0 NaN]);
RawData.EF = standardizeMissing(RawData.EF, [0 NaN]);
RawData.rsqr = standardizeMissing(RawData.rsqr, [0 NaN]);
end

