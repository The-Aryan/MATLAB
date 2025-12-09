clc; clear;

W_kg      = 6000;
W         = W_kg * 9.81;
S         = 30;
CLmax     = 1.8;
rho       = 1.225;
T_over_W  = 0.35;

% W_kg     = input('Enter mass (kg): ');
% S        = input('Enter wing area (m^2): ');
% CLmax    = input('Enter CLmax: ');
% T_over_W = input('Enter T/W: ');

perf = aircraftPerfCalc(W, S, CLmax, rho, T_over_W);

fprintf('Stall speed:        %.1f m/s (%.1f knots)\n', ...
    perf.Vs, perf.Vs * 1.94384);

fprintf('Takeoff distance:   %.0f m\n', perf.s_to);

fprintf('Climb speed (1.3Vs): %.1f m/s (%.1f knots)\n', ...
    perf.V_climb, perf.V_climb * 1.94384);

fprintf('Rate of climb:      %.2f m/s (%.0f ft/min)\n', ...
    perf.ROC, perf.ROC * 196.8504);

W_kg_vec = 4000:500:9000;
s_to_vec = zeros(size(W_kg_vec));

for i = 1:numel(W_kg_vec)
    W_i = W_kg_vec(i) * 9.81;

    p = aircraftPerfCalc(W_i, S, CLmax, rho, T_over_W);
    s_to_vec(i) = p.s_to;
end

figure;
plot(W_kg_vec, s_to_vec, 'o-');
xlabel('Weight (kg)');
ylabel('Takeoff distance (m)');
title('Effect of Weight on Takeoff Distance');
grid on;