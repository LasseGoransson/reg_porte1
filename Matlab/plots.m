%clear
close all


data = sim_unlin_input;
phandle = figure('Name','float_me');

plot(data(:,1),data(:,2))
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Control Signal')
set(phandle,'Position',[10 10 200 200])

Plot2LaTeX(phandle,'images/matlab_rlocus')

stepinfo(data(:,2),data(:,1))



close all

data = sim_unlin_output;
phandle = figure('Name','float_me');

plot(data(:,1),data(:,2))
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Output Signal')
set(phandle,'Position',[10 10 200 200])

Plot2LaTeX(phandle,'images/sim_unlin_output')

stepinfo(data(:,2),data(:,1))

%clear
close all

data = sim_lin_input;
phandle = figure('Name','float_me');

plot(data(:,1),data(:,2))
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response - Control Signal')
set(phandle,'Position',[10 10 200 200])

Plot2LaTeX(phandle,'images/sim_lin_input')

stepinfo(data(:,2),data(:,1))



close all

data = sim_lin_output;
phandle = figure('Name','float_me');

plot(data(:,1),data(:,2))
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Step Response')
set(phandle,'Position',[10 10 200 200])

Plot2LaTeX(phandle,'images/sim_lin_output')

stepinfo(data(:,2),data(:,1))

close all
