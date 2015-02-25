%% Circuits and Machines B38EI2
% David Nagy (H00155797)

%% Q1
format shortEng
XL = (5*10^-3)*j; %[Ohm]
R1 = 5; %[Ohm]
XC = (50*10^-6); %[Ohm]
R2 = 12; %[Ohm]
E = 100; %[V]
f = 400; %[Hz]

omega = 2*pi*f %[1/s]
Z1 = XL*omega; %[Ohm]
Z3 = -j*1/(omega*XC); %[Ohm]
ZA = Z1 + R1 %[Ohm]
ZB = Z3 %[Ohm]
YA = 1/ZA %[1/Ohm]
YB = 1/ZB %[1/Ohm]
YAB = YA + YB %[1/Ohm]
ZAB = 1/YAB
VR2 = E*(R2/(R2+ZAB)) %[V]
Z = R2+ZAB %[Ohm]
I = E/Z %[A]
VZ3 = E - VR2 %[V]
VZ3A = E*(ZAB/(R2+ZAB)); %[V]
VZ1 = VZ3*(Z1/(R1+Z1)) %[V]
VR1 = VZ3*(R1/(R1+Z1)) %[V]
%% Phasor diagram

drawPhasors([E,VR2,I,VZ3,VZ1,VR1]);
%drawPhasors([VR2,E,VR1,VZ1,VZ3]);

%% Q2

E = 230; %[V]
f = 50; %[Hz]
omega = 2*pi*f; %[1/s]
Z1 = 10-15*j; %[Ohm]
Z2 = 20+40*j; %[Ohm]

%part a)
Zp = (1/Z1 + 1/Z2)^-1 %[Ohm]
Irms = E/Zp; %[A]
I = E/sqrt(imag(Zp)^2 + real(Zp)^2) %[A] length of E devided by length of Z
Papparent = E * I; %[VA]

%Power factor is the cosine of the phase angle btw v and i.
%The angle between V and I is always between 90°. Hence cos theta and 
%consequently power are always positive values.
thetaI = atan(imag(Irms)/real(Irms)); %[rad]
powerFactor = cos(thetaI) %[arb.uni]
S = Papparent %[VA]
P = S*powerFactor %[Watts]
Q = S*sin(thetaI) %[VAr]

%% %part b)

Zs = Z1 + Z2 %[Ohm]
Is = E/Zs; %[A]
Irms = E/sqrt(imag(Zs)^2 + real(Zs)^2);
V1 = E*(Z1/Zs); %[V]
V2 = E*(Z2/Zs); %[V]

S = Irms*E %[VA]

thetaI = atan(imag(Is)/real(Is)); %[rad]
powerFactor = cos(thetaI) %[arb.uni]
P = S * powerFactor %[Watts]
Q = S * sin(thetaI) %[VAr]

%% %part c)

E = 230; %[V]
S1 = 240*10^3; %[VA]
S2 = 85*10^3; %[VA]
S3 = 33.33*10^3; %[VA]
P3 = 25*10^3; %[W]

pfL1 = 0.866; %[arb.uni] lagging; inductive circuit -theta
pfL2 = 1; %[arb.uni]
pfL3 = P3/S3; %[arb.uni] leading; capacitive circuit +theta

theta1 = acos(0.866) %[rad]
theta2 = 0 %[rad]
theta3 = acos(pfL3) %[rad]

S1c = S1*cos(theta1) + S1 * sin(theta1)*j
S2c = S2*cos(theta2) + S2 * sin(theta2)*j
S3c = S3*cos(theta1) + S3 * sin(theta3)*j

P1 = S1 * pfL1; %[W]
P2 = S2 * pfL2; %[W]

Pc = P1 + P2 + P3 %[W]

Q1 = S1 * sin(theta1); %VAr
Q2 = S2 * sin(theta2); %VAr
Q3 = S3 * sin(theta3); %VAr

Qc = Q1 + Q2 + Q3 %VAr

thetaOverAll = atan(Qc/Pc)
pfOverAll = cos(thetaOverAll)