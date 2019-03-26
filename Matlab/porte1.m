% Portefølje 1
clear;
% Parameters
m=1;
l=0.5;
g=9.82;
lp = pi/3;
I = 1/3*m*((2*l)^2);
b = 0.1;

% State space model / Linearized at pi/3

A = [0 1; (g*m*l*cos(lp))/I -b/I];
B = [0; 1/I];
C = [1 0];
D = 0;

openloop_ss = ss(A,B,C,D);
[gs_a, gs_b] = ss2tf(A,B,C,D);
openloop_tf = tf(gs_a, gs_b);

%Specification

tr = 1.0;
ts = 1.2;
mp=0.005;

wn = 1.8/tr

zeta = sqrt(((log(mp))/(-pi))^2/(1+((log(mp))/(-pi))^2))

sigma = 4.6/ts


% Regulering
s = tf('s');

kp=0;%2.46;
ki=0;
kd=0;

ks = kp + ki/s + s*kd;

cltf = ks*openloop_tf/(1+ks*openloop_tf);
