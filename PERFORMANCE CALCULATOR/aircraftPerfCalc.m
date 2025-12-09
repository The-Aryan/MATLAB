function perf = aircraftPerfCalc(W, S, CLmax, rho, T_over_W)

% Inputs:
%   W         - Weight (N)
%   S         - Wing area (m^2)
%   CLmax     - Max lift coefficient (dimensionless)
%   rho       - Air density (kg/m^3)
%   T_over_W  - Thrust-to-weight ratio (dimensionless)
%
% Output:
%   perf      - Struct with fields:
%               Vs      - Stall speed (m/s)
%               s_to    - Approx. takeoff distance (m)
%               V_climb - Climb speed used (m/s)
%               ROC     - Rate of climb (m/s)

g = 9.81;
perf.Vs = sqrt((2*W)/(rho*S*CLmax));
perf.s_to = (W / (0.5 * rho * S * CLmax * T_over_W^2))^2;
perf.V_climb = T_over_W * g;
perf.ROC = (perf.V_climb^2) / (2 * W);

CD0 = 0.02;
k   = 0.045;

V   = perf.V_climb;
T   = T_over_W * W;

CL_climb = (2 * W) ./ (rho * V.^2 * S);
CD_climb = CD0 + k * CL_climb.^2;

D_climb = 0.5 * rho * V.^2 * S .* CD_climb;

T_excess = T - D_climb;
perf.ROC = (T_excess .* V) ./ W;

end