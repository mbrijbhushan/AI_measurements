close all;

%Check ss to tf in LabVIEW

Ts = 0%1/(1e5);
s=tf('s');


%From LabVIEW ss to tf vi

A = [0.93723, -382.409;
9.68615e-6, 0.998088];

B = [0.00306303;
    1.53151E-8];

C = [120928, -2.38713E+7]

D = 191.205

sys = ss(A,B,C,D, Ts)

[b,a] = ss2tf(A,B,C,D)


%LPF
w = 2*pi*10;
lpf = w^2/(s^2+2*zeta*w*s+w^2)
lpf_zpk = zpk(lpf)
lpf_z1 = c2d(lpf,Ts,'tustin')
lpf_z2 = c2d(lpf,Ts,'matched')
fprintf('%.12f\n', lpf_z1.num{:});
fprintf('%.12f\n', lpf_z1.den{:});

%Check bilinear transform vi
[numd,dend] = bilinear(lpf.num{:}, lpf.den{:}, 1/Ts)
[zd,pd,kd]=bilinear(lpf_zpk.Z{:},lpf_zpk.P{:},lpf_zpk.K, 1/Ts)