function [RawData] = test_fitlm(RawData)
%% testing fitlm function on the cluster

COminIndex = find (~ismissing (RawData.COmin));
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

for A = 1:(length(COminIndex)-1)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    if Iend ~= Istart + 1
        mdl = fitlm (RawData.deltaCO2([Istart:Iend]), RawData.deltaCO([Istart:Iend]));
        dbstop if warning
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

