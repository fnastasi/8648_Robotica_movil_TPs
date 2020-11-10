function particles = initialize_particles(count, type)
    % Returns a set of randomly initialized particles.
    if type ==  "gauss"
    
        particles = [
            normrnd(0.0, 1, count, 1), ...
            normrnd(0.0, 1, count, 1), ...
            unifrnd(-pi, pi, count, 1)
        ];
    elseif type == "unif"
         particles = [
            normrnd(-1, 10, count, 1), ...
            normrnd(-1, 10, count, 1), ...
            unifrnd(-pi, pi, count, 1)
        ];   
    end
end

