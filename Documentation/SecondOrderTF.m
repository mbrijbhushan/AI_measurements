close all;

s=tf('s');

Ts = 1e-5;
z=tf('z',Ts);

%Lead-LPF
alpha = 10;%10
wc = 70*2*pi;%157*2*pi;% 100*2*pi%
tau = 1/(wc*4);
tau
w0 = 1/(1.25*tau);%1/(1.1*tau)
w0
zeta = 0.5;%0.5

lead_lpf = (alpha*tau*s+1)/(s^2/w0^2+2*zeta*s/w0+1);
lead_lpf_z = c2d(lead_lpf,Ts,'tustin')*1
fprintf('%.12f\n', lead_lpf_z.num{:});
fprintf('%.12f\n', lead_lpf_z.den{:});


%LPF
w = 2*pi*1000;
lpf = w^2/(s^2+2*zeta*w*s+w^2)
lpf_z1 = c2d(lpf,Ts,'tustin')
lpf_z2 = c2d(lpf,Ts,'matched')
fprintf('%.12f\n', lpf_z1.num{:});
fprintf('%.12f\n', lpf_z1.den{:});


% %Lead
% tau = 1/(wc*sqrt(alpha));
% lead = (alpha*tau*s+1)/(tau*s+1);
% lead_z = c2d(lead,Ts,'tustin');
% 
% %Int-Lag
% Ki = wc/10;
% lag = 1+Ki/s;
% % lag_z = c2d(lag,Ts,'tustin')
% lag_z = 1 + Ki*Ts*z/(z-1);
% KiTs = Ki*Ts

%notch
w_notch = 154*2*pi; %rad/s
zeta_z = 0.35/5;
zeta_p = 0.35;
notch = (s^2/w_notch^2 + 2*zeta_z*s/w_notch + 1)/(s^2/w_notch^2 + 2*zeta_p*s/w_notch + 1);
notch_z = c2d(notch,Ts,'matched')*1 + 00

% ctrl_z = notch_z*lead_lpf_z*lag_z;

% h = bodeplot(lpf_z,lead_lpf_z,notch_z);
% h = bodeplot(lpf,lpf_z1,lpf_z2);
h = bodeplot(lead_lpf);
p = getoptions(h);
p.FreqUnits = 'Hz';
p.MagUnits = 'abs';
p.MagScale = 'log';
p.grid='on';
p.Xlim=[1,1e3];
setoptions(h,p)