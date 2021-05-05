function [A, mu1, mu2] = AF_dft2(a, array1, array2, L1, L2)

A = zeros(L1, L2);

mu1 = (-(L1-1)/2:(L1-1)/2)';   % in 4.36
mu2 = (-(L2-1)/2:(L2-1)/2)';   % in 4.36


for k = 1:L1
    for l = 1:L2
        dft1 = exp(-1j * array1 * mu1(k))/length(array1);   % after 4.33
        dft2 = exp(-1j * array2 * mu2(l))/length(array2);   % after 4.33
        A(k,l) = dft1'*a*dft2;
    end
end