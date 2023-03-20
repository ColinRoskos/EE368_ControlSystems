%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Controls Systems Lab
% Lab 2 : Getting familiar with Matlab
% Colin Roskos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%
%% Assignment
% use homogeneity and superposition properties to show that model 
%   (1) is linear whereas model (3) is nonlinear

%%%%%%%%%%%
%% In Class Segment 1
%%%%%%%%%%%
% Cruise Control

v0 = 0;
[t,v] = ode45(@(t,v) cruise_speed(t,v), [0 125], v0);
plot(t,v); grid on;
title('Cruise speed time response to a constant traction force Fa(t)');

%%%%%%%%%%%
%% In Class Segment 1
%%%%%%%%%%%
% Spring Mass System

X0 = [0;0];
options = odeset('RelTol',[1e-4 1e-4],'AbsTol',[1e-5 1e-5],'Stats','on');
[t,X]=ode45(@(t,X) mass_spring(t,X), [0 200],X0);
figure;
plot(t,X); grid on;
title('Mass-Spring Assuming an initial deflection');

%%%%%%%%%%%
%% Exercise 1
%%%%%%%%%%%
% 
clear all;
X0 = [0;0];
options = odeset('RelTol',[1e-4 1e-4],'AbsTol',[1e-5 1e-5],'Stats','on');
[t1,X1]=ode45(@(t,X) mass_spring300r1(t,X), [0 200],X0);
[t2,X2]=ode45(@(t,X) mass_spring300r2(t,X), [0 200],X0);
[t3,X3]=ode45(@(t,X) mass_spring300r3(t,X), [0 200],X0);
f1 = figure;
f2 = figure;


figure(f1)
plot(t1,X1(:,1)); hold on;
plot(t2,X2(:,1));
plot(t3,X3(:,1)); grid on; hold off;
title('Position of Mass-Spring Assuming an initial deflection');
figure(f2)
plot(t1,X1(:,2)); hold on;
plot(t2,X2(:,2));
plot(t3,X3(:,2)); grid on; hold off;
title('Velocity of Mass-Spring Assuming an initial deflection');

%% Exercise 2
X0 = [0;0];
options = odeset('RelTol',[1e-4 1e-4],'AbsTol',[1e-5 1e-5],'Stats','on');
[t,X]=ode45(@(t,X) mass_spring1(t,X), [0 200],X0);
figure;
plot(t,X); grid on;
title('Mass-Spring Assuming an initial deflection');

function dvdt=cruise_speed(t, v)
    %flow rate
    M=750; %(Kg)
    B=30; %( Nsec/m)
    Fa=300; %N
    % dv/dt=Fa/M-B/M v
    dvdt=300/750-30/750*v;
end

function dXdt=mass_spring300r1(t, X)
    %flow rate
    M=750; %(Kg)
    B=30; %( Nsec/m)
    Fa=300; %N
    K=15; %(N/m)
    r=1;
    % dX/dt
    dXdt(1,1)=X(2);
    dXdt(2,1)=-B/M*X(2)-K/M*X(1)^r+Fa/M;
end
function dXdt=mass_spring300r2(t, X)
    %flow rate
    M=750; %(Kg)
    B=30; %( Nsec/m)
    Fa=300; %N
    K=15; %(N/m)
    r=2;
    % dX/dt
    dXdt(1,1)=X(2);
    dXdt(2,1)=-B/M*X(2)-K/M*X(1)^r+Fa/M;
end
function dXdt=mass_spring300r3(t, X)
    %flow rate
    M=750; %(Kg)
    B=30; %( Nsec/m)
    Fa=300; %N
    K=15; %(N/m)
    r=3;
    % dX/dt
    dXdt(1,1)=X(2);
    dXdt(2,1)=-B/M*X(2)-K/M*X(1)^r+Fa/M;
end

function dXdt=mass_spring1(t, X)
    %flow rate
    M=10; %(Kg)
    B=.5; %( Nsec/m)
    Fa=1; %N
    K=1; %(N/m)
    r=1;
    % dX/dt
    dXdt(1,1)=X(2);
    dXdt(2,1)=-B/M*X(2)-K/M*X(1)^r+Fa/M;
end
