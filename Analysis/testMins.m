function [RawData] = testMins(RawData)
% find minima btwn plumes
PlumeIndex = [1:height(RawData)]';
PlumeIndex (ismissing(RawData.PlumeCOdelta)) = [];
PlumeTimes = RawData.time (PlumeIndex);
RawData.COminTimes = NaT ([height(RawData),1]);

for B = 1:(length(PlumeIndex)-1)
    Istart = PlumeIndex (B);
    Iend = PlumeIndex(B+1);
    COminPoss = islocalmin (RawData.deltaCO([Istart:Iend]));
    COmin = RawData ([Istart:Iend], {'deltaCO', 'time'});
    COmin = COmin(COminPoss,:);
    
    % find minimum closest, but >= 1 minute away from low peak
    for A = 1:(height(COmin))
        if COmin.time (A) >= ( PlumeTimes (B) + minutes(1) )
            index = find (RawData.time == COmin.time(A));
            RawData.COminTimes (index) = COmin.time (A);
            if ~isnat (RawData.COminTimes (index))
                break
            end
        end
    end
    % find minimum closest, but >= 1 minute away from high peak
    for C = height(COmin):-1:1
        if COmin.time (C) <= ( PlumeTimes (B+1) - minutes(1) )
            index = find (RawData.time == COmin.time(C));
            RawData.COminTimes (index) = COmin.time (C);
            if ~isnat (RawData.COminTimes (index))
            break
            end
        end
    end
    RawData.COmin = standardizeMissing(RawData.COmin, [NaN -999 0]);
    
end

