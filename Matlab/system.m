% n;ste fors'g med nye nulpunkter
% Ks og nulpunkter
Td = 1/6.86;
Ti = 1/1.66;
kp = 60; % 20 , 40, 60
Ks = kp*(Td*s^2+s+1/Ti)/s

%karakteristisk ligning
Ls = Ks*Gs; % openloop

Ts = (Ks*Gs)/(1+Ks*Gs); % closedloop
step(Ts);
stepinfo(Ts)
%%%%%%%
