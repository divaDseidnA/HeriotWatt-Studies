%% Thermodynamics Assignment 2

%% Q1

p1 = 4*10^6; %[Pa] due to the type of processes p1 = p6 = p5 = p4
p2 = 5*10^4; %[Pa] p2 = p3
h1 = 3214; %[kJ/kg]
h3 = 340.6; %[kJ/kg]
T4 = interp_D(1013,1091,1304,75,100); %[degree C]
h4 = interp_D(80,T4,82,334.9,343.3); %[kJ/kg]
s2 = 6.769; %[kJ/kgK] due to the isentropic process s1 = s2
s2G = 7.594; %[kJ/kg] saturated vapour
s2F = 1.091; %[kJ/kg] saturated water
phi = (s2-s2F)/(s2G-s2F) ; %[ratio] quality
h2G = 2645.9; %[kJ/kg] enthalpy of saturated vapour
h2F = h3; %[kJ/kg] enthalpy of saturated water
h2 = qualityD(phi,h2F,h2G); %[kJ/kg]
etaThermal = (-(h2-h1)+(h4-h3))/(h1-h4) %[ratio] thermal efficiency

%% Q2

p1 = 15*10^6; %[Pa] due to the type of processes p1 = p6 = p5 = p4
p2 = 1.5*10^4; %[Pa] p2 = p3
T1 = 625; %[degree C]
h1 = interp_D(600,T1,650,3582,3712); %[kJ/kg]
h3 = 226.1; %[kJ/kg]
s2 = interp_D(600,625,650,6.678,6.822); %[kJ/kgK] and s1 = s2
s2G = 8.009; %[kJ/kg] saturated vapour
s2F = 0.755; %[kJ/kg] saturated water
phi = (s2-s2F)/(s2G-s2F) ; %[ratio] quality
h2G = 2599.1; %[kJ/kg] enthalpy of saturated vapour
h2F = h3; %[kJ/kg] enthalpy of saturated water
h2 = qualityD(phi,h2F,h2G); %[kJ/kg]
s3 = s2F; %[kJ/kgK] 
T4 = interp_D(0.697,s3,1.006,50,75); %[degree C]
h4 = interp_D(50,T4,75,222.2,326.0); %[kJ/kg]
etaThermal = (-(h2-h1)+(h4-h3))/(h1-h4) %[ratio] thermal efficiency
isEffTurbine = 0.87; %[ratio]
isEffPump = 0.85; %[ratio]
realEtaThermal = (-(h2-h1)*isEffTurbine+(h4-h3)*isEffPump)/(h1-h4) %[ratio]
h2Real = 0.87 * (h2-h1)+h1; %[kJ/kg]
phiReal = (h2Real-h2F)/(h2G-h2F) %[ratio] quality

%% Q3

mDot = 20; %[kg/s]
p1 = 6*10^6; %[Pa] due to the type of process p1 = p6 = p5 = p4
p2 = 5*10^4; %[Pa] p2 = p3 = p3Sub
T1 = 450; %[degree C]
h1 = 3302; %[kJ/kg]
h3 = 340.6; %[kJ/kg]
T3 = 81.4; %[degree C]
T3Sub = 81.4-6.4; %[degree C]
s3Sub = 1.015; %[kJ/kgK]
T4 = interp_D(1.012,s3Sub,1.302,75,100); %[degree C]
h4 = interp_D(75,T4,100,318.7,423.5); %[kJ/kg]
h3Sub = 313.9; %[kJ/kg]
s2 = 6.719; %[kJ/kgK]
s2G = 7.594; %[kJ/kg] saturated vapour
s2F = 1.091; %[kJ/kg] saturated water
phi = (s2-s2F)/(s2G-s2F) ; %[ratio] quality
h2G = 2645.9; %[kJ/kg] enthalpy of saturated vapour
h2F = h3; %[kJ/kg] enthalpy of saturated water
h2 = qualityD(phi,h2F,h2G); %[kJ/kg]
isEffTurbine = 0.94; %[ratio]
isEffPump = 1; %[ratio]
heatRate = mDot * (h1-h4) %[kW]
wPump = mDot * (h4-h3Sub) * isEffPump %[kW]
wNetReal = mDot * ((h2-h1) * isEffTurbine + (h4-h3Sub)) %[kW]
etaThermal = (-(h2-h1)+(h4-h3Sub))/(h1-h4) %[ratio] thermal efficiency
realEtaThermal = (-(h2-h1)*isEffTurbine+(h4-h3Sub)*isEffPump)/(h1-h4) %[ratio]

%% Q4

HVcoal = 29300; %[kJ/kg]
wElectrical = 120 * 10^3; %[kW]
p1 = 9*10^6; %[Pa]
T1 = 550; %[degree C]
h1 = interp_D(80,90,100,3521,3501); %[kJ/kg]
h3 = 226.1; %[kJ/kg]
s3 = 0.755; %[kJ/kgK]
s_at50 = interp_D(80,90,100,0.7,0.699); %[kJ/kgK] 0.699
s_at75 = interp_D(80,90,100,1.01,1.009); %[kJ/kgK] 1.009
T4 = interp_D(s_at50,s3,s_at75,50,75); %[degree C]
h4_at50 = interp_D(80,90,100,216.2,217.9); %[kJ/kg]
h4_at75 = interp_D(80,90,100,320.3,322); %[kJ/kg]
h4 = interp_D(50,T4,75,h4_at50,h4_at75); %[kJ/kg]
s1_at550 = interp_D(80,90,100,6.878,6.756); %[kJ/kgK]
s2 = s1_at550; %[kJ/kgK]
s2G = 8.009; %[kJ/kg] saturated vapour
s2F = 0.755; %[kJ/kg] saturated water
phi = (s2-s2F)/(s2G-s2F); %[ratio] quality
h2G = interp_D(80,90,100,2758.1,2724.9); %[kJ/kg] enthalpy of saturated vapour
h2F = interp_D(80,90,100,1316.8,1407.7); %[kJ/kg] enthalpy of saturated water
h2 = qualityD(phi,h2F,h2G); %[kJ/kg]
mDot = -wElectrical /((h2-h1)/0.9); %[kg/s] pump work is negligible
heatRequired = (h1-h4) * mDot; %[kW]
coalDot = heatRequired / HVcoal / 0.8; %[kg/s] only 0.8 of the coal is transferred to heat generation
efficiency =  wElectrical / (coalDot * HVcoal) %[ratio]
coalRate = coalDot * 3600 / 1000 %[t/h]
