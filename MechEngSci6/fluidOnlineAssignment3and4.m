%% Fluid Online Assignment 3

%Q1 Water flows at a rate of 35 l/min through a pipe of diameter 250 mm.
%Density 1000 kg/m3 ; viscosity 0.001 kg/( ms ).
Q = 35/1000/60; %l/min
D = 250*10^-3; %m
u = 4*Q/pi/D^2;
rho = 1000;
mu = 0.001;
Re = rho*u*D/mu;
%Answer: Weakly turbulent flow develops

%Q1b Water flows at a rate of 15 l/min through a pipe of diameter 250 mm.
%Density 1000 kg/m3 ; viscosity 0.001 kg/( ms ).
Q = 15/1000/60; %l/min
D = 250*10^-3; %m
u = 4*Q/pi/D^2;
rho = 1000;
mu = 0.001;
Re = rho*u*D/mu;


%Q2 Calculate the Fanning friction factor for flow of an oil with a density of 844 kg/m3 and dynamic viscosity of 0.03 kg/(ms) in a pipe with inner diameter 1.2 m at a flow rate of 626 m3/hr.  The pipe wall has a surface roughness of 0.2 mm.
D = 1.2;
Q = 626/3600;
u = 4*Q/pi/D^2;
%Colbrook implicit equation

%Q2b Calculate the Fanning friction factor for flow of water with a density of 1000 kg/m3 and dynamic viscosity 0.001 kg/(ms) in a pipe of inner diameter 2.2 m at a flow rate of 12 m3/s.  The pipe wall has a surface roughness of 0.3 mm
D = 2.2;
Q = 12;
u = 4*Q/pi/D^2;
%Colbrook implicit equation

%Q3 Calculate the Fanning friction factor for flow of water with a density of 1000 kg/m3 and dynamic viscosity 0.001 kg/(ms) in a pipe of inner diameter 2.3 m at a flow rate of 76 m3/s.  The pipe wall has a surface roughness of 8.8 mm
D = 2.3;
Q = 76;
u = 4*Q/pi/D^2;
%Colbrook implicit equation

%Q3b Calculate the pressure drop for flow of air with a density of 1.225 kg/m3 and dynamic viscosity of 1.79*10-5 kg/(ms) in a 12 m long duct of inner diameter 27 mm at a flow rate of 53 l/s.  The pipe has a surface roughness of 0.6 mm.
Q = 53/1000; %[m^3/s]
D = 27*10^-3; %[m]
L = 12; %[m]
u = 4*Q/pi/D^2; %[m/s]
rho = 1.225;
e = 0.6*10^-3; %[m]
mu = 1.79*10^-5;
Re = rho*u*D/mu;
g = 9.81;
f = 0.01272;
hf = 4*f*L*u^2/(D*2*g);
deltap = rho*g*hf

%% Fluid Online Assignment 3
%Q1 Determine the loss coefficient for a sudden expansion of a pipe from 11 mm to 37 mm.
D1 = 11*10^-3; %[m]
D2 = 37*10^-3; %[m]
A1 = D1^2/4*pi; %[m^2]
A2 = D2^2/4*pi; %[m^2]
K = (1-A1/A2)^2;

%Q1 Determine the minor loss coefficient for a pipeline consisting of a flush inlet, 6 flanged regular 90-degree elbows and a swing check valve.
flushInlet = 0.5;
Flanged6Regular = 0.3 * 8;
swingCheck = 2;
K=flushInlet+Flanged6Regular+swingCheck;

%Q1 Determine the minor loss coefficient for flow through a pipeline with a slightly rounded inlet, 3 threaded long-radius 90-degree elbows, a 1/2-closed gate valve, and an outlet.
slightlyRoundedInlet = 0.2;
ThreadedLongRadius90DegreeElbow3 = 0.7*3;
HlfClosedGateValve =2.1;
Outlet =1;
K = slightlyRoundedInlet+ThreadedLongRadius90DegreeElbow3+HlfClosedGateValve+Outlet

%Q2 Determine the head loss due to minor losses for flow at a flow rate of 1 l/s in a pipeline consisting of a slightly rounded inlet, 9 threaded long-radius 90-degree elbows, a 1/2-closed gate valve, and an outlet, and an outlet in 16 mm pipes.
Q = 0.7/1000; %[m^3/s]
D = 15*10^-3; %[m]
u = 4*Q/pi/D^2; %[m/s]
Ksum =0.5+9*0.3+2+1;
g = 9.81;
hf = Ksum*u^2/(2*g)
