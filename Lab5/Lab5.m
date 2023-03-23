%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab 5 | Performace of First order and second order systems
%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 1
% RC Circuit

R_a = 2*10^3;
C_a = .01 * 10^-15;

tau_a = R_a*C_a;
T_a = tf([1], [tau_a 1])

R_b = 2.5*10^3;
C_b = .003 * 10^-15;

tau_b = R_b*C_b;
T_b = tf([1], [tau_b 1])

subplot(2,1,1);
step(T_a);
title("System a");
subplot(2,1,2);
step(T_b);
title("System b");

% Unit Step Response 
%
% T_a =
%  
%          1
%   --------------
%   s(2e-14 s + 1)
%  
% 
% T_b =
%  
%           1
%   ----------------
%   s(7.5e-15 s + 1)
%

%% Exercise 2
% Spring-Mass System
% M = 1;
% B = 1;
% K = 1;
% 
% T_2 = tf([1], [M B K]);
% wn = sqrt(K/M);
% ze = B/(2*M*wn);

ze_table = [.1 .4 .7 1. 2.];
wn = 1;
leg = []

t = 0 : .01 : 12;

for i=1:5
    ze = ze_table(i);

    T = tf([wn^2], [1 2*ze*wn wn^2])
    step(T); hold on;
    leg = [leg strcat("zeta = ", string(ze))];
    S1 = stepinfo(T, "SettlingTimeThreshold", .02);
    
    
    S2 = stepinfo(T, 'RiseTimeThreshold',[0.1 0.9]);

    fprintf("\nRise Time (Z = %.1f) : %6.4f\n", ze, S2.RiseTime);
    fprintf("Peak Time (Z = %.1f) : %6.4f\n", ze, S2.PeakTime);
    fprintf("Overshoot (Z = %.1f) : %3.1f%%\n", ze, S2.Overshoot);
    fprintf("Settling Time (Z = %.1f) : %6.4f\n", ze, S2.SettlingTime);
    
    SteadyState = tzw_response(1000, ze, wn);
    SteadyState = SteadyState(end);
    fprintf("Steady State (Z = %.1f) : %6.4f\n", ze, SteadyState);

    settling_time = 4/(ze * wn);
    fprintf("Calculated Settling Time (Z = %.1f) : %6.4f\n\n", ze, settling_time);
    
end
legend(leg);
title("Step Response with varying dampenning zeta")
%%
Ts = 4/(ze*wn)

T_w2 = tf([wn^2], [1 2*ze*wn wn^2]);

subplot(2,1,1);
step(T_2);
subplot(2,1,2);
[t_y, y] = step(T_w2, 15);
plot(y, t_y);
max_value = max(t_y)
max_value_t = t_y(Ts)

function [t, y] = zw_response(ze, wn)
    T = tf([wn^2], [1 2*ze*wn wn^2]);
    [t, y] = step(T);
end

function y = tzw_response(t, ze, wn)
    y = 1 - 1/(sqrt(1-ze)).*exp(-1*ze*wn.*t).*sin(wn*sqrt(1-ze^2.*t)+acos(ze));
end

