% --- F150 Calculation Sim Test Run --- 

% Retaining the setup code
F150_setup;

% Time Duration
dt = 0.001;
t = 0:dt:3; 

% Road Velocity Disturbance Signal Parameters (w)
bump_height = 0.1;
bump_duration = 0.2;
t_start = 0.5;


% Road Velocity Signal Array
w = zeros(size(t));
for i = 1:length(t)
    if t(i) >= t_start && t(i) <= (t_start + bump_duration)
        w(i) = (bump_height * pi / bump_duration) * sin((2*pi / bump_duration) * (t(i) - t_start));
    end
end

% Input Matrix
u = zeros(size(t));
U = [u',w'];

% Run
[y,t_out] = lsim(sys_loop,U,t);


% Drawing the graph figure of the simulation
figure;
subplot(2,1,1);
plot(t_out, y(:,1), 'r', "LineWidth", 1.5);
grid on;
ylabel('Chasis Acc');
title('F150 Baseline response');

subplot(2,1,2);
plot(t_out, y(:,2), 'b', "LineWidth", 1.5);
grid on;
xlabel('Time');
ylabel('Suspension Travel');

