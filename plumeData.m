function [dataSet] = plumeData(dataSet)

% make summary table to store data
varNames = {'Condition', 'numPlumes', 'meanEF', 'medianEF', 'meanR', 'medianR', 'meanP', 'medianP', 'meanTemp', 'medianTemp', 'meanTempPlumes', 'medianTempPlumes'};
X = zeros ([2 11]);
Y = ({'none'; 'Rsqr > 0.6'});
X = array2table (X);
Y = array2table (Y);
summary = [Y X];
summary.Properties.VariableNames = varNames;

%% full dataset - Width500
% calculate number of plumes
numPlumes = find (~ismissing(dataSet.Width500.PlumeCO));
Plumes1 = dataSet.Width500 (numPlumes, :);
summary.numPlumes (1) = height(Plumes1);

% save Plumes1 to output structure
plumeStruct500 = struct( 'all_plumes', Plumes1);

% fill table
summary.meanEF (1) = mean (Plumes1.EF, 'omitnan');
summary.medianEF (1) = median (Plumes1.EF, 'omitnan');
summary.meanR (1) = mean (Plumes1.rsquare, 'omitnan');
summary.medianR (1) = median (Plumes1.rsquare, 'omitnan'); 
summary.meanP (1) = mean (Plumes1.pCO,'omitnan');
summary.medianP (1) = median (Plumes1.pCO, 'omitnan');
summary.meanTemp (1) = mean (dataset.Temp2, 'ominan');
summary.medianTemp (1) = median (dataset.Temp2, 'ominan');
summary.meanTempPlumes (1) = mean (Plumes1.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'ominan');

%% Rsquar% calculate number of plumes
numPlumes = find (Plumes1.rsquare > 0.6);
Plumes2 = Plumes1 (numPlumes, :);
summary.numPlumes (2) = height(Plumes2);

% save Plumes2 to output structure
plumeStruct500.Rcondition = Plumes2;

% fill table
summary.meanEF (2) = mean (Plumes2.EF, 'omitnan');
summary.medianEF (2) = median (Plumes2.EF, 'omitnan');
summary.meanR (2) = mean (Plumes2.rsquare, 'omitnan');
summary.medianR (2) = median (Plumes2.rsquare, 'omitnan'); 
summary.meanP (2) = mean (Plumes2.pCO,'omitnan');
summary.medianP (2) = median (Plumes2.pCO, 'omitnan');
summary.meanTemp (2) = mean (dataset.Temp2, 'ominan');
summary.medianTemp (2) = median (dataset.Temp2, 'ominan');
summary.meanTempPlumes (2) = mean (Plumes2.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'ominan');

% save summary to output structure
plumeStruct500.summary = summary;

% add output structure to original dataSet
dataSet.plumesOnly.plumeStruct500 = plumeStruct500;

%% full dataset - Width750
% calculate number of plumes
numPlumes = find (~ismissing(dataSet.Width750.PlumeCO));
Plumes1 = dataSet.Width750 (numPlumes, :);
summary.numPlumes (1) = height(Plumes1);

% save Plumes1 to output structure
plumeStruct750 = struct( 'all_plumes', Plumes1);

% fill table
summary.meanEF (1) = mean (Plumes1.EF, 'omitnan');
summary.medianEF (1) = median (Plumes1.EF, 'omitnan');
summary.meanR (1) = mean (Plumes1.rsquare, 'omitnan');
summary.medianR (1) = median (Plumes1.rsquare, 'omitnan'); 
summary.meanP (1) = mean (Plumes1.pCO,'omitnan');
summary.medianP (1) = median (Plumes1.pCO, 'omitnan');
summary.meanTemp (1) = mean (dataset.Temp2, 'ominan');
summary.medianTemp (1) = median (dataset.Temp2, 'ominan');
summary.meanTempPlumes (1) = mean (Plumes1.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'ominan');

%% Rsquare calculate number of plumes
numPlumes = find (Plumes1.rsquare > 0.6);
Plumes2 = Plumes1 (numPlumes, :);
summary.numPlumes (2) = height(Plumes2);

% save Plumes2 to output structure
plumeStruct750.Rcondition = Plumes2;

% fill table
summary.meanEF (2) = mean (Plumes2.EF, 'omitnan');
summary.medianEF (2) = median (Plumes2.EF, 'omitnan');
summary.meanR (2) = mean (Plumes2.rsquare, 'omitnan');
summary.medianR (2) = median (Plumes2.rsquare, 'omitnan'); 
summary.meanP (2) = mean (Plumes2.pCO,'omitnan');
summary.medianP (2) = median (Plumes2.pCO, 'omitnan');
summary.meanTemp (2) = mean (dataset.Temp2, 'ominan');
summary.medianTemp (2) = median (dataset.Temp2, 'ominan');
summary.meanTempPlumes (2) = mean (Plumes2.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'ominan');

% save summary to output structure
plumeStruct750.summary = summary;

% add output structure to original dataSet
dataSet.plumesOnly.plumeStruct750 = plumeStruct750;

end

