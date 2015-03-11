%% Thermodynamics Assignment 3


clear all
clc
format ShortEng

%% Q1
R = 0.287; %[kJ/kg/K]
pMin = 1.013*10^5; %[Pa]
pMax = 9*10^5; %[Pa]
T1 = 25+273.15; %[K]
T3 = 1250+273.15; %[K]
rp = pMax/pMin; %[ratio]

%a
gamma = 1.4; %[ratio]
thermalEfficiency = 1 - 1/(rp^((gamma-1)/gamma))
workRatio = 1 - T1/T3*(rp^((gamma-1)/gamma))

%b
%The thermal efficiency increased with gamma by 12%. However, the work
%ratio decreased by 10%. Therefore it is better to stick with air,
%unless infinite amount of fuel is available. Since the power output per 
%unit fuel input is higher when the working fluid is air.
gammaRep = 1.667; %[ratio]
newEfficiency = 1 - 1/(rp^((gammaRep-1)/gammaRep))
newWorkRatio = 1 - T1/T3*(rp^((gammaRep-1)/gammaRep))

%c
powerOutPut = 5 * 10^3; %[kW]
cp = 1.0045; %[kJ/kg/K]
T4 = T3/(rp^((gamma-1)/gamma)); %[K]
T2 = T1*(rp^((gamma-1)/gamma)); %[K]
massFlow = powerOutPut/(cp*(T3-T4)-cp*(T2-T1)) %[kg/s]

%% Q2

wCom = cp*(T2-T1); %[kJ/kg]  
wTur = cp*(T4-T3); %[kJ/kg]
compIsenEff = 0.82; %[ratio]
turbIsenEff = 0.88; %[ratio]
T2dash = (T2-T1)/compIsenEff+T1; %[K]
T4dash = -turbIsenEff*(T3-T4)+T3 %[K]
deltaS12 = cp*log(T2dash/T1)-R*log(pMax/pMin) %[kJ/kg/K]
deltaS34 = cp*log(T4dash/T3)-R*log(pMin/pMax) %[kJ/kg/K]
netWork = -cp*(T3-T4dash)+cp*(T2dash-T1) %[kJ/kg]
qSupplied = cp*(T3-T2dash); %[kJ/kg]
Efficiency = -netWork/qSupplied %[ratio]

%% Q3  

%a)
gamma = 1.4; %[ratio]
rv = 13.5; %[ratio]
cv = 0.7175; %[kJ/kg/K]
T1 = 30+273.15; %[K]
T3 = 1720+273.15; %[K]
T2 = T1*rv^(gamma-1) %[K]
tempRatio = T3/T2; %[ratio]
volumeRatio = rv*1/tempRatio; %[ratio]
T4 = T3/volumeRatio^(gamma-1) %[K]
qRec = cp*(T3-T2);
qRej = cv*(T4-T1);
efficiency  = (qRec - qRej)/qRec  %[ratio]

%b)
m = 0.1; %[kg]
pMax = 49 * 10^5; %[Pa]
cp = 1004.5; %[J/kg/K]
cv = 717.5; %[J/kg/K]
R = 287; %[J/kg/K]
netWork = cv*(T4-T3)+R*(T2-T3)+cv*(T2-T1); %[J/kg]
vMin = R * T2/ pMax %[m^3/kg]
vMax = vMin*13.5 %[m^3/kg]
MEP = -netWork/(vMax-vMin); %[J/m^3] or [Pa]
MEPperkg = MEP / 0.1 %[Pa/kg]

%% Q4
gamma = 1.4; %[ratio]
cv = 717.5; %[J/kg/K]
R = 287; %[J/kg/K]
T1 = 34+273.15; %[K]
T3 = 2150+273.15; %[K]
p1 = 1.013 * 10^5; %[Pa]
rv = 10.2; %[ratio]
T2 = T1*rv^(gamma-1)
T4 = T3/rv^(gamma-1)
v1 = R*T1/p1; %[m^3/kg]
v2 = v1 / 10.2; %[m^3/kg]
p2 = R*T2/v2 %[Pa]
p3 = R*T3/v2 %[Pa]
p4 = R*T4/v1 %[Pa]
syms V;
kUp = p3*v2^gamma; %[Pa(m^3/kg)^1.4]
kDown = p1*v1^gamma; %[Pa(m^3/kg)^1.4]
fUp = kUp/V^gamma;
fDown = kDown/V^gamma;
wOut = int(fUp,v2,v1);
wIn = int(fDown,v2,v1);
netSpecWork = -wOut+wIn; %[J/kg]
qIn = cv*(T3-T2); %[J/kg]
efficiency = -netSpecWork/qIn; %[ratio]
MEP = -netSpecWork/(v1-v2); %[Pa]
netSpecW = vpa(netSpecWork,5) %[J/kg]
thermalEff = vpa(efficiency,5) %[ratio]
meanEffPres = vpa(MEP,5) %[Pa]























