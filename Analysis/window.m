function  [tstart, tend] = window (hrstart, minstart,secstart, timeLength)
tstart = datetime (2017, 07, 27, hrstart, minstart, secstart);
tend = tstart + timeLength;
xlim ([tstart tend])
end

