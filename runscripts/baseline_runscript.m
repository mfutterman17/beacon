addpath ('/global/home/users/mfutterman/matlab/beacon')
pool = parpool

fprintf 'Path added'

WindowWidth = [750];

     

% albany  2018/02

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2018_02');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/albany_2018_02_3min.mat','output')

    fprintf 'Saved Output File: albany_2018_02 3min. '

% albany 2018/03

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2018_03');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/results_8_28/albany_2018_03_3min.mat','output')

    fprintf 'Saved Output File: albany_2018_03 3min. '
    
    
exit 
