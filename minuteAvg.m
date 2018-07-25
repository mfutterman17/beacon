function RawData = minuteAvg(RawData)
%%Pull out CO and CO2 data

RawData = RawData(:,{'COWE' 'COAUX' 'CO2' 'time'});
RawData.CO = RawData.COWE - RawData.COAUX;
RawData.COWE = [];
RawData.COAUX = [];
RawData = movevars(RawData, 'CO', 'Before', 'time');

%Convert zeros to missing
RawData.CO = standardizeMissing(RawData.CO, [NaN -999 0]);

dupTimes = sort(RawData.time);
TF = (diff(dupTimes) == 0);
dupTimes = dupTimes(TF);
dupTimes = unique(dupTimes);


%make average values of duplicate times
for A = 1:length(dupTimes);
locations = find(RawData.time == dupTimes (A));
dups = RawData(locations,:);
% calculate averages for new values
    newCO = mean(dups.CO,'omitnan');
    newCO2 = mean(dups.CO2,'omitnan');
% delete second location
    RawData (locations(2),:) = [];
% replace CO and CO2 data with averages
    RawData {locations(1),'CO2'} = newCO2;
    RawData {locations(1),'CO'} = newCO;
end


RawData = sortrows(RawData, 3);
RawData.COAvg = movmean(RawData.CO, minutes(1),'omitnan','SamplePoints',RawData.time);
RawData.CO2Avg = movmean(RawData.CO2, minutes(1),'omitnan','SamplePoints',RawData.time);


end

