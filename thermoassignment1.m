%% Thermodynamics Assignment 1


%function [value] = interp_D(valx1,valxmid,valx2,valy1,valy2)
%value = valy1 + (valy2-valy1)*((valxmid-valx1)/(valx2-valx1));

%function [value] = quality(phi,liquid,gas)
%value = (1-phi)*liquid + phi*gas;
%% Q1

%a
l = interp_D(150,160,200,3.685,4.016);
g = interp_D(150,160,200,5.310,4.930);
q1a = quality(0.75,l,g)

%b
a = interp_D(40,44,60,6.477,6.211);
b = interp_D(40,44,60,6.582,6.333);
q1b = interp_D(325,345,350,b,a)

%c
c = interp_D(20,24.5,40,2.089,2.087);
d = interp_D(20,24.5,40,2.330,2.327);
q1c = interp_D(175,185,200,c,d)
%% Q2

p = 1.4 * 10^5; %[Pa]
gamma = 1.4; %[arb.uni]
R = 297; %[J/kgK]
cv = 742.5; %[J/kgK]
cp = 1039.5; %[J/kgK]
T1 = 443; %[K]
T2 = 318; %[K]
Tsur = 32+273; %[K]

q1 = cp*T1; %[J/kg]
q2 = cp*T2; %[J/kg]

qDot = q2-q1 %[J/kg]

v1 = (T1*R)/p; %[kg/m^3]
v2 = (T2*R)/p; %[kg/m^3]
wDot = -(v1-v2)*p %[J/kg]
deltas = cp*log(T2/T1) %[J/kgK]
sSurrndgs = -qDot/Tsur; %[J/kgK]
sUniv = deltas + sSurrndgs %[J/kgK]

%% Q4
%The turbine receives saturated water at 160 degree C.
%The water leaves the turbine at 25 degree C. The turbine operates
%between these two high (433K) and low (298K) temperature reservoirs.
%The work output as it is stated in the question is 22MW; and some heat
%is rejected in accordancce with the second law of thermodynamics. 
%The sum of the rejected heat and the net work output equals the heat 
%input.

%The heat input can be calculated if the specific enthalpy is known 
%for the working fluid when it enters into the turbine. This can 
% be obtained by interpolations from water/steam tables.

%Using these high and low temperature reservoirs the Carnot cycle
%efficiency is the highest thoeretical efficiency for the turbine in
%question if it works in continuous cycles.

mDot = 440; %[kg/s]
T1 = 160+273; %[K]
T2 = 25+273; %[K]
wOut = 22*10^3; %[kJ/s]
saturationP = interp_D(151.9,160,179.9,5,10); %[bar]
satSpecEnth = interp_D(5,saturationP,10,640.4,763.0); %[kJ/kg]
enthAt25 = interp_D(5,saturationP,10,105.3,105.8); %[kJ/kg]
qDotOut = enthAt25 - satSpecEnth + (wOut/mDot); %[kJ/kg]
qIn = enthAt25 - satSpecEnth; %[kJ/kg]
etaActual = (-wOut/mDot)/qIn %[ratio]
etaCarnot = 1 - T2/T1 %[ratio]
heatRejected = qDotOut * mDot %[kJ/s]

%% Q5
%Statement A: working fluid is liquid water.

%Statement B: from high temperature reservoir at 640 degree C, the working
%fluid is superheated steam regardless of the pressure.

%Statement C: if dryness factor is larger than 0.9, droplets destroy the
%turbine blades.

%Statement D: the lowest operation pressure of the turbine is atmospheric 
%pressure.

%Keeping  A, it is preferable to choose the higher temperature 
%reservoir with 640 degree C. Since higher efficiency can be achieved 
%(i.e. efficiency of the Carnot cycle depends only on the ratio of the 
%temperature low and high temperature reservoirs). 

%We cannot keep A and B at the same time. Keeping B and C requires
%that the pressure must be maintained below the atmoshperic pressure. 
%So B and C cannot be true when D is true. D is a reasonable assumption,
%since maintaining lower pressure than atmospheric requires vacuum pumps
%those devices usually are expensive thus a solution that violates D would 
%not be cost effective in the long run. 

%I would keep B, C and D; and choose the concentrating collectors solution 
%and at the same time I would raise the temperature of the lower 
%temperature reservoir from 34 degree C to 99.7 degree C. 
%By this the theoretical efficiency of
%my system would be 0.5917 which is higher than the theoretical efficiency
%of the solar pond with 90 degree C water and 34 degree C lower temperature
%reservoir that has efficiency of 0.1543.

lowTempRes = 34+273; %[K]
highTempRes1 = 90+273; %[K]
highTempRes2 = 640+273; %[K]

eta1Carnot = 1 - lowTempRes/highTempRes1 %[ratio]
eta2Carnot = 1 - lowTempRes/highTempRes2 %[ratio]

%% Q6
%This problem is similar to case of a hot cup of coffee cooling on the
%table. That case from the cup of coffee (high temperature reservoir) heat
%is transferred to the surrounding (low temperature reservoir). This is a
%natural thermodynamic process.
%The second law of thermodynamics states that in a natural thermodynamic
%process, there is an increase in the sum of the entropies of the
%participating systems.

heatDot = 2; %[kW]
hotResvr = 800; %[K]
coldResvr = 300; %[K]

deltas = heatDot/coldResvr - heatDot/hotResvr %[kW/K]

%The value of deltas is larger than 0, that means the second law holds for
%this problem.

%% Q7
%Reversible processes are always frictionless. In this case considering a
%turbine and water/steam mixture as a working fluid, it can be seen clearly
%that friction develops along the process. Thus the process takes place 
%is irreversible.

T1 = 400+273; %[K]
T2 = 60.1+273; %[K] saturation temperature @ 0.2 bar

p1 = 40*10^5; %[Pa]
p2 = 0.2*10^5; %[Pa]

phi = 0.93; %[arb. uni.]
A = 0.14; %[m^2]
mDot = 3; %[kg/s]

h1 =3214*1000; %[J/kg]
h2 = quality(phi,251.6,2609.8)*1000;

vf = 0.001017; %[m^3/kg]
vg = 7.7; %[m^3/kg]
vOut = quality(phi,vf,vg); %[m^3/kg]
rhoOut = vOut^-1; %[kg/m^3]

uAv = mDot/(A*rhoOut); %[m/s]

wDot = 0.9*mDot*((h2+0.5*uAv^2)-h1) %[J/s]
s1 = 6.769; %[kJ/kgK]
s2 = quality(phi,0.832,7.909); %[kJ/kgK]
deltas = s2-s1 %[kJ/kgK]
univEnt = -deltas %[kJ/kgK]

%Since the the entropy of the system is positive, 
%the process is irreversible.

%% Q8

R = 287; %[J/kgK]
gamma = 1.4; %[arb. uni.]
cp = 1004.5; %[J/kgK]
cv = 717.5; %[J/kgK]

deltas = cp*log(1.65)-R*log(4) %[J/kgK]

