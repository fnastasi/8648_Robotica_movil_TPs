% Make librobotics available
addpath('librobotics');

clear all

% Read world data, i.e. landmarks
fprintf('Reading world data ...');
landmarks = read_world('../data/world.dat');
fprintf(' done\n');
% Read sensor readings, i.e. odometry and range-bearing sensor
fprintf('Reading sensor data ...');
data = read_data('../data/sensor_data.dat');
fprintf(' done\n');

% Cantidad de partículas
N = 100;
% Initialize particles
particles = initialize_particles(N);


for t = 1:size(data.timestep, 2)
%for t = 1:100
    if not(mod(t,20))
        fprintf('.');
    end
    new_particles = sample_motion_model(data.timestep(t).odometry, particles);

    weights = measurement_model(data.timestep(t).sensor, new_particles, landmarks);
    normalizer = sum(weights);
    weights = weights ./ normalizer;

    plot_state(new_particles, weights, landmarks, t);
    %weights
    particles = resample(new_particles, weights);
end

fprintf('\nFinal pose: ')
disp(mean_position(particles, weights))
