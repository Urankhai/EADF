% @article{galdo2007geometry,
%   title={Geometry-based Channel Modeling for Multi-User MIMO Systems and Applications},
%   author={Galdo, GD and Haardt, M},
%   journal={Haardt, Ed. Verlag ISLE},
%   year={2007}
% }
clear
close all

load HelixStruct.mat
G_Re = readmatrix('HelixEADF3D_Re.csv');
G_Im = readmatrix('HelixEADF3D_Im.csv');

Gtot = G_Re + 1i*G_Im;
% figure
% surf(Bp,'linestyle','none')
theta = 0;                                                 % in degrees


angle1 = sqrt(2):sqrt(2):sqrt(5)*177;
ang1 = angle1*(pi/180);

angle2 = theta;                         
ang2 = angle2*(pi/180);

[L1,L2] = size(Gtot);

mu1 = (-(L1-1)/2:(L1-1)/2)';   % in 4.36
mu2 = (-(L2-1)/2:(L2-1)/2)';   % in 4.36

db1 = exp(1j * ang1.* mu1);                                 % in 4.35
db2 = exp(1j * ang2.* mu2);                                 % in 4.35

% Generated pattern for any given angle
b_ang1_ang2 = abs(db1'*Gtot*db2);                           % in 4.34

figure(10)
hold on
plot(b_ang1_ang2.*cos(ang1'), b_ang1_ang2.*sin(ang1'),'o')


