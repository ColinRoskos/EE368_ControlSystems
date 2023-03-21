
subplot(2,1,1);
plot(out.x, "red", DisplayName="Position"); grid;
ylabel("Displacement (m)");
title("Position vs Time");
subplot(2,1,2);
plot(out.v, "blue", DisplayName="Velocity");
ylabel("Velocity (m/s)");
title("Velocity vs Time");

% %% Dual Plot 
% yyaxis right;
% plot(out.x, "red", DisplayName="Position");hold on;
% ylabel("Displacement (m)");
% ylim([-.4 1]);
% yyaxis left;
% plot(out.v, "blue", DisplayName="Velocity");
% ylabel("Velocity (m/s)");
% ylim([-.4 1]);
% legend; grid;
% xlabel("Time(s)");
% title("Mass-Spring System Model")
% hold off;