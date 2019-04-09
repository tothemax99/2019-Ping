% fit start

t=1e-6*(1:length(ping));
plot(t,ping);

to=1.06e-4;
st=0.9*exp(3.5e4*(t-to)).*sin(32e3*2*pi*(t-to));
hold on
plot(t,st)
hold off

%zeta = 0.1715
%w0 = 32480