
addpath ('/global/home/users/mfutterman/matlab/beacon')
pool = parpool

fprintf 'Path added'

WindowWidth = [500; 750];

    
% portola 2017/08

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2017_08');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_08_2min.mat','output')

    fprintf 'Saved Output File: portola_2017_08 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_08_3min.mat','output')

    fprintf 'Saved Output File: portola_2017_08 3min. '

% portola 2017/09

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2017_09');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_09_2min.mat','output')

    fprintf 'Saved Output File: portola_2017_09 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_09_3min.mat','output')

    fprintf 'Saved Output File: portola_2017_09 3min. '

% portola 2017/10

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2017_10');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_10_2min.mat','output')

    fprintf 'Saved Output File: portola_2017_10 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_10_3min.mat','output')

    fprintf 'Saved Output File: portola_2017_10 3min. '

% portola 2017/11

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2017_11');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_11_2min.mat','output')

    fprintf 'Saved Output File: portola_2017_11 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_11_3min.mat','output')

    fprintf 'Saved Output File: portola_2017_11 3min. '
    
 % portola 2017/12

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2017_12');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_12_2min.mat','output')

    fprintf 'Saved Output File: portola_2017_12 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2017_12_3min.mat','output')

    fprintf 'Saved Output File: portola_2017_12 3min. '

% portola 2018/01

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2018_01');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_01_2min.mat','output')

    fprintf 'Saved Output File: portola_2018_01 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_01_3min.mat','output')

    fprintf 'Saved Output File: portola_2018_01 3min. '

% portola 2018/02

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2018_02');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_02_2min.mat','output')

    fprintf 'Saved Output File: portola_2018_02 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_02_3min.mat','output')

    fprintf 'Saved Output File: portola_2018_02 3min. '
    
% portola 2018/03

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2018_03');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_03_2min.mat','output')

    fprintf 'Saved Output File: portola_2018_03 2min. '

    output = output_structure2 (RawData,WindowWidth);

    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);
    
    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_03_3min.mat','output')

    fprintf 'Saved Output File: portola_2018_03 3min. '

% portola 2018/04

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/portola/data/2018_04');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_04_2min.mat','output')

    fprintf 'Saved Output File: portola_2018_04 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/portola_2018_04_3min.mat','output')

    fprintf 'Saved Output File: portola_2018_04 3min. '    
    

% albany 2017/08

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2017_08');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_08_2min.mat','output')

    fprintf 'Saved Output File: albany_2017_08 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_08_3min.mat','output')

    fprintf 'Saved Output File: albany_2017_08 3min. '

% albany 2017/09

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2017_09');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_09_2min.mat','output')

    fprintf 'Saved Output File: albany_2017_09 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_09_3min.mat','output')

    fprintf 'Saved Output File: albany_2017_09 3min. '

% albany 2017/10

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2017_10');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_10_2min.mat','output')

    fprintf 'Saved Output File: albany_2017_10 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_10_3min.mat','output')

    fprintf 'Saved Output File: albany_2017_10 3min. '

% albany 2017/11

    BeaconDataTable = upload('/global/home/users/mfutterman/mycondo/beacondata/albany/data/2017_11');

    fprintf 'Upload Complete'

    RawData = minuteAvg(BeaconDataTable);

    fprintf 'Avg Complete'

    output = output_structure (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_11_2min.mat','output')

    fprintf 'Saved Output File: albany_2017_11 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2017_11_3min.mat','output')

    fprintf 'Saved Output File: albany_2017_11 3min. '
  
% albany 2018/02    
    
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

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2018_02_2min.mat','output')

    fprintf 'Saved Output File: albany_2018_02 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2018_02_3min.mat','output')

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

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2018_03_2min.mat','output')

    fprintf 'Saved Output File: albany_2018_03 2min. '

    output = output_structure2 (RawData,WindowWidth);
    
    output = plumeData (output);
    
    output = weekdaysOnly (output);
    
    output = ampm (output);
    
    output = plumeDataWeekdays (output);
    
    output = plumeDataWkdyAMPM (output);

    save('/global/home/users/mfutterman/matlab/beacon/results/albany_2018_03_3min.mat','output')

    fprintf 'Saved Output File: albany_2018_03 3min. '

exit
