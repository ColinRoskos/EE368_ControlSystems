%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab4 LTI Study
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 1:
% G = ( 6s^2 + 1 ) / ( s^3 + 3s^2 + 3s + 7 )
G = tf([6 0 1], [1 3 3 7]);
pzmap(G); sgrid;

% 3 poles and 2 zeros, all are lhp.

%% Exercise 2:
% B/A = T
T1 = tf([1], [1 .2 1]);
T2 = tf([1 0], [1, .2 1]);

t = 0:0.01:10;
subplot(1,2,1);
impulse(T1,t);
subplot(1,2,2);
step(T2,t);

% these are the same because step response is 1/s, impulse is 1
% T1*H = 1/D * 1 = 1/D , T2*H = s/D * 1/s = 1/D

%% Exercise 3:
% U = X/R

t = 0:0.01:10;
z = [3 6 12];

for i = 1:3
    s = tf('s');
    U = ( 15/ z(i) )*( s + z(i) ) / ( s^2 + 3*s + 15 );
    subplot(3, 2, 2*i-1);
    impulse(U, t);
    subplot(3, 2, 2*i);
    step(U, t);

end%for

%% Exercise 4

% y'' + 4y' + 4y = u, y(0) = y'(0) = 0
% determine analytically and with the step function

t = 0:0.01:10;
% analytical solution

[t, y] = ode45(@fun, t, [0 0]);

subplot(2,1,1);
plot(t, y);

Y2 = tf([1], [1 4 4]);

subplot(2,1,2);
step(t, Y2);


%% Pre study 1

% s / (s^2 + 2s + 1)
num = [1 0];
den = [1 2 1];

% creating the system from the previous num and den
sys = tf(num, den)

% sys =
%  
%         s
%   -------------
%   s^2 + 2 s + 1
%  

%% Pre study 2

s = tf('s');
sys = s/(s^2 + 2*s + 1)

% sys =
%  
%         s
%   -------------
%   s^2 + 2 s + 1
%  

%% Pre study 3

sys = zpk([0], [-1 1], 1)

% sys =
%  
%        s
%   -----------
%   (s+1) (s-1)
%  

%% Pre study 4
% print poles and zeros with sgrid

H = tf([2 5 1],[1 2 3]); 
pzmap(H); sgrid;


%% Pre study 5
% Simulation of Linear systems to different 
% inputs impulse, step and lsim

H = tf([2 5 1],[1 2 3]); 
t = 0:0.01:10;
subplot(1,2,1);
step(H,t);
subplot(1,2,2);
impulse(H,t);

%% Pre study 6
% When invoked without left-hand arguments, ‘lsim’ plots the response on the screen
%
%
[u,t] = gensig('square',4,10,0.1);
H = tf([2 5 1],[1 2 3])
lsim(H, u, t)

%% Functions used in exercise

function f = fun(t, y)
    dydt_1 = y(2);
    dydt_2 = -4*y(2) - 4*y(1) + unit_step(t);
    f = [dydt_1; dydt_2];
end

function u = unit_step(t)
    if t<0
        u = 0;
    else
        u = 1;
    end
end
