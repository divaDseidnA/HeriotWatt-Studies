%% Circuits and Machines B38EI2
% David Nagy (H00155797)

%% Q1
format short
XL = (5*10^-3)*j; %[Ohm]
R1 = 5; %[Ohm]
XC = (50*10^-6)*-j; %[Ohm]
R2 = 12; %[Ohm]
E = 100; %[V]
f = 400; %[Hz]

omega = 2*pi*f %[1/s]
Z1 = XL*omega; %[Ohm]
Z3 = omega*(1/XC); %[Ohm]
ZA = Z1 + R1 %[Ohm]
ZB = Z3 %[Ohm]
YA = 1/ZA %[1/Ohm]
YB = 1/ZB %[1/Ohm]
YAB = YA + YB %[1/Ohm]
ZAB = 1/YAB
VR2 = E*(R2/(R2+ZAB)) %[V]
Z = R2+ZAB; %[Ohm]
I = E/Z; %[A]
VR1 =1 ;%[V]
VZ3 = E - VR2%[V]
VZ3A = E*(ZAB/(R2+ZAB)); %[V]
VZ1 = VZ3*(Z1/(R1+Z1)); %[V]
VR1 = VZ3*(R1/(R1+Z1)); %[V]
%drawPhasors([VR2,E,I,VR1,VZ1,VZ3]);
drawPhasors([VR2,E,VR1,VZ1,VZ3]);

%% Q2




