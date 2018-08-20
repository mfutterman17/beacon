addpath ('/global/home/users/mfutterman/matlab/beacon')
pool = parpool

fprintf 'Path added'

WindowWidth = [500; 750];

    
% korematsu 2017/07

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_07');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_07_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_07 3min. '
    
% korematsu 2017/08

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_08');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_08_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_08 3min. '

% korematsu 2017/09

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_09');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_09_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_09 3min. '

% korematsu 2017/10

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_10');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_10_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_10 3min. '

% korematsu 2017/11

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_11');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_11_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_11 3min. '
    
 % korematsu 2017/12

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2017_12');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2017_12_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2017_12 3min. '

% korematsu 2018/01

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/korematsu/data/2018_01');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_20/korematsu_2018_01_3min.mat','output')

    fprintf 'Saved Output File: korematsu_2018_01 3min. '
    
exit 