% Portefølje 1
clear;
% Parameters
m=1;
l=0.5;
g=9.82;
lp = pi/3;
I = 1/3*m*((2*l)^2);
b = 0.1;

%% State space model / Linearized at pi/3

A = [0 1; (g*m*l*cos(lp))/I -b/I];
B = [0; 1/I];
C = [1 0];
D = 0;

openloop_ss = ss(A,B,C,D);
[gs_a, gs_b] = ss2tf(A,B,C,D);
openloop_tf = tf(gs_a, gs_b);

%%Specification

tr = 1.0;
ts = 1.2;
mp=0.005;

wn = 1.8/tr

zeta = sqrt(((log(mp))/(-pi))^2/(1+((log(mp))/(-pi))^2))

sigma = 4.6/ts


% Regulering
s = tf('s');

% Ks og nulpunkter
Td = 1/6.86;
Ti = 1/1.66;
kp = 40.86;
Ks = kp*(Td*s^2+s+1/Ti)/s

%karakteristisk ligning
Ls = Ks*Gs % openloop

rlocus(Ls)


Ts = (Ks*Gs)/(1+Ks*Gs) % closedloop

step(Ts)

stepinfo(Ts)

% n;ste fors'g med nye nulpunkter
% Ks og nulpunkter
Td = 1/6.86;
Ti = 1/1.66;
kp = 60.86;
Ks = kp*(Td*s^2+s+1/Ti)/s

%karakteristisk ligning
Ls = Ks*Gs % openloop

Ls = Ks*Gs % openloop

rlocus(Ls)

Ts = (Ks*Gs)/(1+Ks*Gs) % closedloop

step(Ts)

stepinfo(Ts)

% n;ste fors'g med nye nulpunkter
% Ks og nulpunkter
Td = 1/2;
Ti = 1/10;
kp = 21.86;
Ks = kp*(Td*s^2+s+1/Ti)/s

Ls = Ks*Gs % openloop

rlocus(Ls)
Ts = (Ks*Gs)/(1+Ks*Gs) % closedloop

pzmap(Ts)
step(Ts)

stepinfo(Ts)

Td = 1/6.86;
Ti = 1/1.66;
kp = 60.86;

Kd = Td*kp
Ki = (1/Ti)*kp

ks = kp*(Td*s^2+s+1/Ti)/s;
ks_simu= kp + Ki*(1/s)+Kd*s;

cltf = ks_simu*openloop_tf/(1+ks*openloop_tf);

clft_1= ks*openloop_tf/(1+ks*openloop_tf);
figure(1)
step(cltf)
stepinfo(cltf)

figure(2)
step(clft_1)
stepinfo(clft_1)


