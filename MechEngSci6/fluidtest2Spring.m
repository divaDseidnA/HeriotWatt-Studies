% Q1

L = 318;
D = 117*10^(-3);
Q = 0.6/1000/60;
rho = 1000;
mu = 0.001;
A = (1/4)*(D^2)*pi;
u = Q/A;
Re = (rho*u*D)/mu;
f = 64/Re;
deltaP = f*rho*(L/D)*(u^2)/2

%Q2

L = 1066;
D=0.8;
mu = 0.049;
Q = 0.4*10^(-3);
rho = 880;
A = (1/4)*(D^2)*pi;
u = Q/A;
Re = (rho*u*D)/mu;
f = 64/Re;
h_f = (f*L*u^2)/(D*2*9.81)

