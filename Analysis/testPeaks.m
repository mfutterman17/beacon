function  testData = testPeaks(testData)
COminIndex = find (~ismissing (testData.COmin));
PlumeIndex = [1:height(testData)]';
PlumeIndex (ismissing(testData.COPeaks)) = [];

%find plumes where rsquared > 0.4 and slope > 0
for A = 1:(length(COminIndex)-1)
    Istart = COminIndex(A);
    Iend = COminIndex(A + 1);
    if Iend ~= (Istart + 1)
        mdl = fitlm (testData.deltaCO2([Istart:Iend]), testData.deltaCO([Istart:Iend]));
        if mdl.Rsquared.Adjusted > 0.4
            X = PlumeIndex(Istart < PlumeIndex);
            indices(:,1) = X(X < Iend);
            if length(indices) > 1
                indices(:,2) = testData.deltaCO(indices);
                index = (indices(find(indices(:,2) == (max(indices(:,2)))), 1));
                if testData.pCO (index) > 0.004
                    line = polyfit (testData.deltaCO2([Istart:Iend]), testData.deltaCO([Istart:Iend]),1);
                    slopeDelt = line(1,1);
                    if slopeDelt > 0
                        testData.PlumeCO(index) = testData.COAvg(index);
                        testData.PlumeMin(Istart) = testData.COAvg(Istart);
                        testData.PlumeMin(Iend) = testData.COAvg(Iend);
                        testData.EF (index) = slopeDelt;
                    end
                end
            end
            if length(indices) == 1
                if testData.pCO (indices) > 0.004
                    line = polyfit (testData.deltaCO2([Istart:Iend]), testData.deltaCO([Istart:Iend]),1);
                    slopeDelt = line(1,1);
                    if slopeDelt > 0
                        testData.PlumeCO(indices) = testData.COAvg(indices);
                        testData.PlumeMin(Istart) = testData.COAvg(Istart);
                        testData.PlumeMin(Iend) = testData.COAvg(Iend);
                        testData.EF(indices) = slopeDelt;
                    end
                end
            end
        end
        if A == floor(length(COminIndex)/2)
            fprintf 'Plumes halfway calculated. ' 
        end
    end
    clearvars indices index
end
testData.PlumeMin = standardizeMissing(testData.PlumeMin, [0 NaN]);
testData.PlumeCO = standardizeMissing(testData.PlumeCO, [0 NaN]);
testData.EF = standardizeMissing(testData.EF, [0 NaN]);
end

