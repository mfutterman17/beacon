function BeaconDataTable = upload (input_directory)
%% this script separates datetime information from measurements for upload so that dates are not converted to Julian date. Avoids errors in conversion. 

% 1. Navigate to file and import file names: (Make sure you are in the appropriate file in MATLAB)
files = dir(fullfile(input_directory,'*.csv'));
name = {files.name};



% 2. Import each file individually
for idx = 1:size(name,1)
    importName = fullfile(input_directory,name{idx});
    opts = detectImportOptions(importName);
    opts.EmptyLineRule = 'skip';
    A = readtable(importName,opts);
    A = A(:, 1:22);
    A.Properties.VariableNames = {'Temp1' 'Pressure' 'Temp2' 'Humidity' 'DewPtTemp' 'MOxO3' 'MOxCO' 'MOxNO2' 'O3WE' 'O3AUX' 'COWE' 'COAUX' 'NOWE' 'NOAUX' 'NO2WE' 'NO2AUX' 'ParticulateHigh' 'ParticulateLow' 'ParticulateMatter' 'CO2' 'temp3' 'time'};
    % Convert cells to compatible form
     B = isa(A.DewPtTemp,'cell');
        if B == 1;
            C = A.DewPtTemp
            C = str2double(C);
            A.DewPtTemp = C;
        end
    % Build table of values w/o dates
    Numbers = table2array(A(:,1:end-1));
    %% start a new array Upload, concatenate newly imported file w/ Upload
        if idx == 1;
         UploadNumbers = [Numbers];
         UploadDates = [A.time];
        % concatenate newly imported file w/Upload
        else idx > 1;
            UploadNumbers = [UploadNumbers ; Numbers];
            UploadDates = [UploadDates ; A.time];
        end
end

BeaconDataTable = array2table(UploadNumbers);
UploadDates = array2table(UploadDates);
BeaconDataTable = [BeaconDataTable UploadDates];
BeaconDataTable.Properties.VariableNames = {'Temp1' 'Pressure' 'Temp2' 'Humidity' 'DewPtTemp' 'MOxO3' 'MOxCO' 'MOxNO2' 'O3WE' 'O3AUX' 'COWE' 'COAUX' 'NOWE' 'NOAUX' 'NO2WE' 'NO2AUX' 'ParticulateHigh' 'ParticulateLow' 'ParticulateMatter' 'CO2' 'temp3' 'time'};

end

