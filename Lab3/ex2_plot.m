% This file is named ex2_plots.m. 
% It plots the data produced by exl_model.mdl for 
% several values of B. Execute exl_parameter.m first. 

out = sim("ex1_model") % Has the same effect as clicking on 
                       % Start on the toolbar. 
plot(out.x, 'DisplayName', sprintf("B=%d", B))     % Plots the initial run with B=4 
title("Mass-Spring System Model, varying B-value") % setting the figure title
hold on         % Plots later results on the same axes % as the first. 

B = 8;                  % New value of B; other parameter values % stay the same. 
out = sim("ex1_model")  % Rerun the simulation with new B value. 
plot(out.x, 'DisplayName', sprintf("B=%d", B))             % Plots new x on original axes. 

B = 12; out = sim("ex1_model"); plot(out.x, 'DisplayName', sprintf("B=%d", B))
B = 25; out = sim("ex1_model"); plot(out.x, 'DisplayName', sprintf("B=%d", B))
legend;
hold off