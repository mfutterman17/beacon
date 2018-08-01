function [output] = windows_for_baseline(RawData,WindowWidth)
for iWindow = 1:length(WindowWidth)
 window_fn = sprintf('Width%d', WindowWidth(iWindow));
 output.(window_fn) = baseline2 (RawData, WindowWidth(iWindow));
 if iWindow == 1
    output = struct(window_fn, output.(window_fn));
 end
end

