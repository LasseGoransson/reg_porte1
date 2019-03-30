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
Gs = tf(gs_a, gs_b)

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
kp = 20.86;
Ks = kp*(Td*s^2+s+1/Ti)/s;

%karakteristisk ligning
Ls1 = Ks*Gs % openloop

%phandle = figure('Name','float_me');

Ts = (Ks*Gs)/(1+Ks*Gs); % closedloop

phandle = figure('Name','float_me');

[x,y] = step(Ts);
plot(y,x);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Output Signal')
set(phandle,'Position',[10 10 300 300])

Plot2LaTeX(phandle,'images/kp_20_step')




stepinfo(Ts);

% n;ste fors'g med nye nulpunkter
% Ks og nulpunkter
Td = 1/6.86;
Ti = 1/1.66;
kp = 60.86;
Ks = kp*(Td*s^2+s+1/Ti)/s;

%karakteristisk ligning
Ls = Ks*Gs; % openloop

Ts = (Ks*Gs)/(1+Ks*Gs); % closedloop

phandle = figure('Name','float_me');

[x,y] = step(Ts);
plot(y,x);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Output Signal')
set(phandle,'Position',[10 10 300 300])

Plot2LaTeX(phandle,'images/kp_40_step')

stepinfo(Ts);

Td = 1/6.86;
Ti = 1/1.66;
kp = 60.86;

Kd = Td*kp
Ki = (1/Ti)*kp

ks = kp*(Td*s^2+s+1/Ti)/s;
ks_simu= kp + Ki*(1/s)+Kd*s

cltf = ks_simu*Gs/(1+ks*Gs);
Ts=cltf;
phandle = figure('Name','float_me');

[x,y] = step(Ts);
plot(y,x);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Output Signal')
set(phandle,'Position',[10 10 300 300])

Plot2LaTeX(phandle,'images/kp_60_step')


clft_1= ks*Gs/(1+ks*Gs);
figure(1)
%step(cltf)
stepinfo(cltf);

figure(2)
%step(clft_1)
stepinfo(clft_1);


figure(2)
step(clft_1)
stepinfo(clft_1);


close all
