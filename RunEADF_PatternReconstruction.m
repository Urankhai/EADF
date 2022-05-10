% @article{galdo2007geometry,
%   title={Geometry-based Channel Modeling for Multi-User MIMO Systems and Applications},
%   author={Galdo, GD and Haardt, M},
%   journal={Haardt, Ed. Verlag ISLE},
%   year={2007}
% }
clear
close all

load HelixStruct.mat

antenna_pattern = 10.^(pat/10);

theta = azi;                                                % 181 angles
N1 = length(theta);

phi = ele;                                                  % 360 angles
N2 = length(ele);

dang1 = pi/(N1-1);                                          % in expression 4.29
dang2 = 2*pi/N2;                                            % in expression 4.29

array1 = (0:359)'*dang1;                                    % in 4.30
array2 = (0:359)'*dang2;                                    % in 4.30

B = antenna_pattern;
Br = fliplr(B(:,2:end-1));

Bp = [B, Br];                                               % in 4.32
% figure
% surf(Bp,'linestyle','none')
theta = 20;                                                 % in degrees
pp = Bp(:,theta+1);
s = AF_func_polar(pp);
figure(10)
plot(s(:,1),s(:,2))

% dft
L = 15;                                                     % assuming significant frequencies
[Gtot, mu1, mu2] = AF_dft2(Bp, array1, array2, L, L);
figure
surf(abs(Gtot),'linestyle','none')

angle1 = sqrt(2):sqrt(2):sqrt(5)*157;        
ang1 = angle1*(pi/180);

angle2 = theta;                         
ang2 = angle2*(pi/180);

db1 = exp(1j * ang1.* mu1);                                 % in 4.35
db2 = exp(1j * ang2.* mu2);                                 % in 4.35

% Generated pattern for any given angle
b_ang1_ang2 = abs(db1'*Gtot*db2);                           % in 4.34

figure(10)
hold on
plot(b_ang1_ang2.*cos(ang1'), b_ang1_ang2.*sin(ang1'),'o')


