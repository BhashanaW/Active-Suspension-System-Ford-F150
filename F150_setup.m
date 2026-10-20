% --- Project : Project Active Suspension System for Ford F150 --- 

% Global Parameters of F150
ms = 550; % sprung mass per corner
mu = 55; % unsprung mass per corner
ks = 28000; % suspension spring stiffness
cs = 2500; % passive damper coefficient
kt = 190000; % tire vertical stiffness

% State Space System Matrix

A = [  0,     1,     0,      -1;
    -ks/ms, -cs/ms,  0,     cs/ms;
       0,     0,     0,       1;
     ks/mu, cs/mu,  -kt/mu, -cs/mu];


% Control Input Matrix

B = [ 0;
    1/ms;
      0;
    -1/mu];

% Disturbance Matrix

G = [0;
     0;
    -1;
     0];

% Input Matrix System

B_avg = [B, G];

D_avg = [1/ms, 0
          0,   0];

% Output Matrix

C = [-ks/ms, -cs/ms, 0, cs/ms;
        1,      0,   0,   0];

D = [1/ms;
      0];

% -- Defining MATLAB State Space Model --

sys_loop = ss(A, B_avg, C, D_avg);

% Channel Names

sys_loop.InputName =  {'Actuator Force - u', 'Road Velocity - w'};
sys_loop.OutputName = {'Chasis Accleration', 'Suspension Travel'};


disp('Ford F150 State Space Model Been Initiated : ');
disp(sys_loop);
