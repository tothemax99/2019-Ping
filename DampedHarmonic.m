% Harmonic Oscillator Properties

m=(2.1e-6*48e-6*451e-6)/4*2329+(4/3)*(pi*4.5e-6^3)*2650; %mass in [kg] of a small silicon block
%si = 2329 kg/m^3, sio2 = 2650 kg/m^3
c=0.5e-6; %damping amount in [kg/s]
k=0.2; %spring constant in [N/m]

l1 = (-c + sqrt(c^2 - 4*m*k))/(2*m);
l2 = (-c - sqrt(c^2 - 4*m*k))/(2*m);

x0=16e-6; %initial position in [m]
v0=0; %initial velocity in [m/s]

Am=[1  1  x0;
    l1 l2 v0];
Am=rref(Am);


a=Am(1,3);
b=Am(2,3); %find coefficients for expansion of solution

t=(1:1:5000)/1e6; %linspace(0,4e-3, 1000); %simulate 1ms
x=a*exp(l1*t)+b*exp(l2*t);
v=a*l1*exp(l1*t)+b*l2*exp(l2*t);
%plotyy(t,x,t,v);
%plot(t,x);
%plot(1020:4019, v)

w0=sqrt(k/m)
zeta=c/(2*sqrt(m*k))
lam=w0*zeta
w1=w0*sqrt(1-zeta^2)
A=x0;
B=x0*lam/w1;
C=zeta^2/(1-zeta^2);
xa=A*exp(-lam.*t).*cos(w1.*t)+B*exp(-lam.*t).*sin(w1.*t);
va=-A*w1*exp(-lam.*t).*((1+C)*sin(w1.*t));
plot(t,x,t,xa)
%plot(t,v,t,va)
%zeta