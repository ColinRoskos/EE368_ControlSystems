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


