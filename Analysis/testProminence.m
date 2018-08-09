function RawData = testProminence(RawData)
% find CO peaks
[COPeaks, prominence] = islocalmax(RawData.deltaCO,'MinSeparation',minutes(3),'SamplePoints',RawData.time);
% identify peaks w/ promincence < 0.025 
tooLow = find (prominence < 0.025);

% establish CO peaks
RawData.COPeaks = RawData.deltaCO;
RawData.COPeaks (~COPeaks) = NaN;
RawData.COPeaks(tooLow) = NaN;

RawData.PeakCOAvg = RawData.COAvg;
RawData.PeakCOAvg (~COPeaks) = NaN;
RawData.PeakCOAvg(tooLow) = NaN;

fprintf 'CO peaks calculated. '

% find CO2 peaks
[CO2Peaks, prominence] = islocalmax(RawData.deltaCO2,'MinSeparation',minutes(3),'SamplePoints',RawData.time);
% identify peaks w/ promincence < 0.025 
tooLow = find (prominence < 0.025);

%establish CO2 peaks
RawData.CO2Peaks = RawData.deltaCO2;
RawData.CO2Peaks (~CO2Peaks) = NaN;
RawData.CO2Peaks(tooLow) = NaN;

RawData.PeakCO2Avg = RawData.CO2Avg;
RawData.PeakCO2Avg (~CO2Peaks) = NaN;
RawData.PeakCO2Avg(tooLow) = NaN;

fprintf 'CO2 peaks calculated. '


% find indices of CO peaks
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.COPeaks)) = [];

end

