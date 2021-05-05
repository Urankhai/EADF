function s = AF_func_polar(p)

N = length(p);
angles = 2*pi*(0:N-1)'/360;

x = p.*cos(angles);
y = p.*sin(angles);

s = [x,y];

