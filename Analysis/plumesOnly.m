function [RawData, PeakInfo] = plumesOnly(RawData)

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
    end
end

% convert empty rows in COmin to NaN
RawData.COmin = standardizeMissing(RawData.COmin, [NaN -999 0]);

fprintf 'minima calculated. '


COminIndex = find (~ismissing (RawData.COmin));
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

varNames = {'Min_Start', 'Min_End', 'Rsquare', 'Slope', 'Peak_Index'};
varTypes = {'double', 'double', 'double', 'double', 'double'};
PeakInfo = table ('Size', [0 5], 'VariableTypes', varTypes);
PeakInfo.Properties.VariableNames = varNames;

%find plumes where rsquared > 0.4 and slope > 0
for A = 1:(length(COminIndex)-1)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    if Iend ~= (Istart + 1)
        mdl = fitlm (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]));
        PeakInfo.Min_Start (A) = Istart;
        PeakInfo.Min_End (A) = Iend;
        PeakInfo.Rsquare (A) = mdl.Rsquared.Adjusted;
        if mdl.Rsquared.Adjusted > 0.4
            X = PlumeIndex(Istart < PlumeIndex);
            indices(:,1) = X(X < Iend);
            if length(indices) > 1
                indices(:,2) = RawData.deltaCO(indices);
                index = (indices(find(indices(:,2) == (max(indices(:,2)))), 1));
                line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
                slopeDelt = line(1,1);
                PeakInfo.Slope (A) = slopeDelt;
                PeakInfo.Peak_Index (A) = index;
                if slopeDelt > 0
                    RawData.PlumeCO(index) = RawData.COAvg(index);
                    RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                    RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
                    RawData.EF (index) = slopeDelt;
                end
            end
            if length(indices) == 1
                line = polyfit (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]),1);
                slopeDelt = line(1,1);
                PeakInfo.Slope (A) = slopeDelt;
                PeakInfo.Peak_Index (A) = indices;
                if slopeDelt > 0
                    RawData.PlumeCO(indices) = RawData.COAvg(indices);
                    RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
                    RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
                    RawData.EF(indices) = slopeDelt;
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
PeakInfo = standardizeMissing (PeakInfo, [0 NaN]);
end

