function [outputArg1,outputArg2] = test_fitlm(RawData,length)
%% testing fitlm function on the cluster

COminIndex = find (~ismissing (RawData.COmin));

for A = 1:(length)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
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
            RawData.PlumeCO(indices) = RawData.COAvg(indices);
            RawData.PlumeMin(Istart) = RawData.COAvg(Istart);
            RawData.PlumeMin(Iend) = RawData.COAvg(Iend);
        end
    end
    clearvars indices index
end
RawData.PlumeMin = standardizeMissing(RawData.PlumeMin, [0 NaN]);
RawData.PlumeCO = standardizeMissing(RawData.PlumeCO, [0 NaN]);
end

