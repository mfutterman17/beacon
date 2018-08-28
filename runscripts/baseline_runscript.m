addpath ('/global/home/users/mfutterman/matlab/beacon')
pool = parpool

fprintf 'Path added'

WindowWidth = [750];

    
% explo1 2017/07

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_07');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_07_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_07 3min. '
    
% explo1 2017/08

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_08');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_08_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_08 3min. '

% explo1 2017/09

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_09');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_09_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_09 3min. '

% explo1 2017/10

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_10');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_10_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_10 3min. '

% explo1 2017/11

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_11');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_11_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_11 3min. '
    
 % explo1 2017/12

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2017_12');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2017_12_3min.mat','output')

    fprintf 'Saved Output File: explo1_2017_12 3min. '

% explo1 2018/01

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/explo1/data/2018_01');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/explo1_2018_01_3min.mat','output')

    fprintf 'Saved Output File: explo1_2018_01 3min. '
   
% laney 2017/07

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_07');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_07_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_07 3min. '
    
% laney 2017/08

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_08');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_08_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_08 3min. '

% laney 2017/09

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_09');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_09_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_09 3min. '

% laney 2017/10

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_10');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_10_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_10 3min. '

% laney 2017/11

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_11');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_11_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_11 3min. '
    
 % laney 2017/12

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2017_12');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2017_12_3min.mat','output')

    fprintf 'Saved Output File: laney_2017_12 3min. '

% laney 2018/01

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/laney/data/2018_01');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/laney_2018_01_3min.mat','output')

    fprintf 'Saved Output File: laney_2018_01 3min. '    
    
exit 
