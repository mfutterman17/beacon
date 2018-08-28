function [dataSet] = plumeDataWkdyAMPM(dataSet)
% make summary table to store data
varNames = {'Condition', 'numPlumes', 'meanEF', 'medianEF', 'meanR', 'medianR', 'meanP', 'medianP', 'meanTemp', 'medianTemp', 'meanTempPlumes', 'medianTempPlumes'};
X = zeros ([2 11]);
Y = ({'none'; 'Rsqr > 0.6'});
X = array2table (X);
Y = array2table (Y);
summary = [Y X];
summary.Properties.VariableNames = varNames;

%% for wkdy AM 750
% calculate number of plumes
numPlumes = find (~ismissing(dataSet.wkdyAM_Width750.PlumeCO));
Plumes1 = dataSet.wkdyAM_Width750 (numPlumes, :);
summary.numPlumes (1) = height(Plumes1);

% save Plumes1 to output structure
output750 = struct( 'all_plumes', Plumes1);

% fill table
summary.meanEF (1) = mean (Plumes1.EF, 'omitnan');
summary.medianEF (1) = median (Plumes1.EF, 'omitnan');
summary.meanR (1) = mean (Plumes1.rsquare, 'omitnan');
summary.medianR (1) = median (Plumes1.rsquare, 'omitnan'); 
summary.meanP (1) = mean (Plumes1.pCO,'omitnan');
summary.medianP (1) = median (Plumes1.pCO, 'omitnan');
summary.meanTemp (1) = mean (dataSet.wkdyAM_Width750.Temp2, 'omitnan');
summary.medianTemp (1) = median (dataSet.wkdyAM_Width750.Temp2, 'omitnan');
summary.meanTempPlumes (1) = mean (Plumes1.Temp2, 'omitnan');
summary.medianTempPlumes (1) = median (Plumes1.Temp2, 'omitnan');

% Rsquare - calculate number of plumes
numPlumes = find (Plumes1.rsquare > 0.6);
Plumes2 = Plumes1 (numPlumes, :);
summary.numPlumes (2) = height(Plumes2);

% save Plumes2 to output structure
output750.Rcondition = Plumes2;

% fill table
summary.meanEF (2) = mean (Plumes2.EF, 'omitnan');
summary.medianEF (2) = median (Plumes2.EF, 'omitnan');
summary.meanR (2) = mean (Plumes2.rsquare, 'omitnan');
summary.medianR (2) = median (Plumes2.rsquare, 'omitnan'); 
summary.meanP (2) = mean (Plumes2.pCO,'omitnan');
summary.medianP (2) = median (Plumes2.pCO, 'omitnan');
summary.meanTemp (2) = mean (dataSet.wkdyAM_Width750.Temp2, 'omitnan');
summary.medianTemp (2) = median (dataSet.wkdyAM_Width750.Temp2, 'omitnan');
summary.meanTempPlumes (2) = mean (Plumes2.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'omitnan');

% save summary to output structure
output750.summary = summary;

dataSet.plumesOnly.plumeswkdyAM_Width750 = output750;
%% for wkdyPM 500
% calculate number of plumes
numPlumes = find (~ismissing(dataSet.wkdyPM_Width500.PlumeCO));
Plumes1 = dataSet.wkdyPM_Width500 (numPlumes, :);
summary.numPlumes (1) = height(Plumes1);

% save Plumes1 to output structure
output = struct( 'all_plumes', Plumes1);

% fill table
summary.meanEF (1) = mean (Plumes1.EF, 'omitnan');
summary.medianEF (1) = median (Plumes1.EF, 'omitnan');
summary.meanR (1) = mean (Plumes1.rsquare, 'omitnan');
summary.medianR (1) = median (Plumes1.rsquare, 'omitnan'); 
summary.meanP (1) = mean (Plumes1.pCO,'omitnan');
summary.medianP (1) = median (Plumes1.pCO, 'omitnan');
summary.meanTemp (1) = mean (dataSet.wkdyPM_Width500.Temp2, 'omitnan');
summary.medianTemp (1) = median (dataSet.wkdyPM_Width500.Temp2, 'omitnan');
summary.meanTempPlumes (1) = mean (Plumes1.Temp2, 'omitnan');
summary.medianTempPlumes (1) = median (Plumes1.Temp2, 'omitnan');

% Rsquare - calculate number of plumes
numPlumes = find (Plumes1.rsquare > 0.6);
Plumes2 = Plumes1 (numPlumes, :);
summary.numPlumes (2) = height(Plumes2);

% save Plumes2 to output structure
output.Rcondition = Plumes2;

% fill table
summary.meanEF (2) = mean (Plumes2.EF, 'omitnan');
summary.medianEF (2) = median (Plumes2.EF, 'omitnan');
summary.meanR (2) = mean (Plumes2.rsquare, 'omitnan');
summary.medianR (2) = median (Plumes2.rsquare, 'omitnan'); 
summary.meanP (2) = mean (Plumes2.pCO,'omitnan');
summary.medianP (2) = median (Plumes2.pCO, 'omitnan');
summary.meanTemp (2) = mean (dataSet.wkdyPM_Width500.Temp2, 'omitnan');
summary.medianTemp (2) = median (dataSet.wkdyPM_Width500.Temp2, 'omitnan');
summary.meanTempPlumes (2) = mean (Plumes2.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'omitnan');

% save summary to output structure
output.summary = summary;

dataSet.plumesOnly.plumeswkdyPM_Width500 = output;

%% for wkdy PM 750
% calculate number of plumes
numPlumes = find (~ismissing(dataSet.wkdyPM_Width750.PlumeCO));
Plumes1 = dataSet.wkdyPM_Width750 (numPlumes, :);
summary.numPlumes (1) = height(Plumes1);

% save Plumes1 to output structure
output750 = struct( 'all_plumes', Plumes1);

% fill table
summary.meanEF (1) = mean (Plumes1.EF, 'omitnan');
summary.medianEF (1) = median (Plumes1.EF, 'omitnan');
summary.meanR (1) = mean (Plumes1.rsquare, 'omitnan');
summary.medianR (1) = median (Plumes1.rsquare, 'omitnan'); 
summary.meanP (1) = mean (Plumes1.pCO,'omitnan');
summary.medianP (1) = median (Plumes1.pCO, 'omitnan');
summary.meanTemp (1) = mean (dataSet.wkdyPM_Width750.Temp2, 'omitnan');
summary.medianTemp (1) = median (dataSet.wkdyPM_Width750.Temp2, 'omitnan');
summary.meanTempPlumes (1) = mean (Plumes1.Temp2, 'omitnan');
summary.medianTempPlumes (1) = median (Plumes1.Temp2, 'omitnan');

% Rsquare - calculate number of plumes
numPlumes = find (Plumes1.rsquare > 0.6);
Plumes2 = Plumes1 (numPlumes, :);
summary.numPlumes (2) = height(Plumes2);

% save Plumes2 to output structure
output750.Rcondition = Plumes2;

% fill table
summary.meanEF (2) = mean (Plumes2.EF, 'omitnan');
summary.medianEF (2) = median (Plumes2.EF, 'omitnan');
summary.meanR (2) = mean (Plumes2.rsquare, 'omitnan');
summary.medianR (2) = median (Plumes2.rsquare, 'omitnan'); 
summary.meanP (2) = mean (Plumes2.pCO,'omitnan');
summary.medianP (2) = median (Plumes2.pCO, 'omitnan');
summary.meanTemp (2) = mean (dataSet.wkdyPM_Width750.Temp2, 'omitnan');
summary.medianTemp (2) = median (dataSet.wkdyPM_Width750.Temp2, 'omitnan');
summary.meanTempPlumes (2) = mean (Plumes2.Temp2, 'omitnan');
summary.medianTempPlumes (2) = median (Plumes2.Temp2, 'omitnan');

% save summary to output structure
output750.summary = summary;

dataSet.plumesOnly.plumeswkdyPM_Width750 = output750;
end
