% Parameters for takeoff roll Simulink model

g   = 9.81;      % m/s^2
m   = 6000;      % kg
W   = m * g;     % N

S   = 30;        % m^2   (wing area)
CL  = 1.8;       % takeoff CL (approx)
CD  = 0.04;      % takeoff CD (approx)
rho = 1.225;     % kg/m^3 (sea level ISA)

T_over_W = 0.35; % thrust-to-weight ratio
T        = T_over_W * W;

mu_roll  = 0.02; % rolling friction coefficient

% Stall speed and liftoff speed
CLmax = CL;  % for now assume CL ~= CLmax in this config
Vs    = sqrt(2 * W / (rho * S * CLmax));
V_to  = 1.2 * Vs;

% Simulation time
tFinal = 40;   % seconds, enough to complete the roll
