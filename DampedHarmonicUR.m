function [x, v] = DampedHarmonicUR(w1, lam, AB, t)
% Harmonic Oscillator Analytic Solver given v0=0 and underdamped
% oscillation (zeta<1)
%w1 = damped frequency [Hz]
%lam = decay constant [1/s]
%AB = velocity magnitude [m/s]


x=0;
%x=A*exp(-lam.*t).*cos(w1.*t)+B*exp(-lam.*t).*sin(w1.*t);
v=-AB*w1*exp(-lam.*t).*sin(w1.*t);

end