function Sundays(dataset)
% make table for sundays
sundays = unique (day(dataset.time (weekdays == 1)));

week1 = find (days == 2);
for A = 3:8
     w = find (days == A);
     week1 = [week1 ; w]; 
end

week2 = find (days == 9);
for A = 10:15
     w = find (days == A);
     week2 = [week2 ; w]; 
end

week3 = find (days == 16);
for A = 17:22
    w = find (days == A);
    week3 = [week3 ; w];
end

week4 = find (days == 23);
for A = 24:29
    w = find (days == A);
    week4 = [week4; w]; 
end


