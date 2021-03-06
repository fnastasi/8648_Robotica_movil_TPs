function new_particles = resample(particles, weights)
    % Returns a new set of particles obtained by performing
    % stochastic universal sampling.
    %
    % particles (M x D): set of M particles to sample from. Each row contains a state hypothesis of dimension D.
    % weights (M x 1): weights of the particles. Each row contains a weight.
    new_particles = zeros(size(particles, 1), 3);

    M = size(particles, 1);
    
    %% TODO: complete this stub
    
    % Se genera un vector en donde se tiene la suma acumulativa de los
    % pesos. El �ltimo elemento siempre deber�a ser igual a 1
    cumulative_weights = cumsum(weights);
    
    u = unifrnd(0,1/M);
    i = 1;
    for j = 1:M
        while(u > cumulative_weights(i))
            i = i+1;
        end
        new_particles(j,:) = particles(i,:);
        u = u + 1/M;
    end
    
    
end
