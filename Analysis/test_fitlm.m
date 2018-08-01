function [outputArg1,outputArg2] = test_fitlm(RawData,length)
%% testing fitlm function on the cluster

COminIndex = find (~ismissing (RawData.COmin));

for A = 1:(length)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    mdl = fitlm (output.Width500.deltaCO2([Istart:Iend]), output.Width500.deltaCO([Istart:Iend]));
    if mdl.Rsquared.Adjusted > 0.6
        X = PlumeIndex(Istart < PlumeIndex);
        indices(:,1) = X(X < Iend);
        if length(indices) > 1
            indices(:,2) = output.Width500.deltaCO(indices);
            index = (indices(find(indices(:,2) == (max(indices(:,2)))), 1));
            output.Width500.PlumeCO(index) = output.Width500.COAvg(index);
            output.Width500.PlumeMin(Istart) = output.Width500.COAvg(Istart);
            output.Width500.PlumeMin(Iend) = output.Width500.COAvg(Iend);
        end
        if length(indices) == 1
            output.Width500.PlumeCO(indices) = output.Width500.COAvg(indices);
            output.Width500.PlumeMin(Istart) = output.Width500.COAvg(Istart);
            output.Width500.PlumeMin(Iend) = output.Width500.COAvg(Iend);
        end
    end
    clearvars indices index
end
output.Width500.PlumeMin = standardizeMissing(output.Width500.PlumeMin, [0 NaN]);
output.Width500.PlumeCO = standardizeMissing(output.Width500.PlumeCO, [0 NaN]);
end

