function  window (hrstart, minstart,timeLength)
tstart = datetime (2017, 07, 27, hrstart, minstart, 00);
tend = tstart + timeLength;
xlim ([tstart tend])
en