clear all
close all
h = helix;
fc = 2e9;
% D = pattern(h, 2e9, -90:1:90, 1:1:360); % in dBi
% d = 10.^(D/10); % High resolution
azimuth = 0:1:180;
elevation = 0:1:359;
[pat,azimuth,elevation] = pattern(h,fc,azimuth,elevation);

HelixData.pat = pat;
HelixData.azi = azimuth;
HelixData.ele = elevation;

save('HelixStruct', '-struct', 'HelixData');
disp('Done!')