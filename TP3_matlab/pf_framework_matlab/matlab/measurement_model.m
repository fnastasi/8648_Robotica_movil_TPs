function weight = measurement_model(z, x, l)
    % Computes the observation likelihood of all particles.
    %
    % The employed sensor model is range only.
    %
    % z: set of landmark observations. Each observation contains the id of the landmark observed in z(i).id and the measured range in z(i).range.
    % x: set of current particles
    % l: map of the environment composed of all landmarks
    sigma = [0.2];
    weight = ones(size(x, 1), 1);

    if size(z, 2) == 0
        return
    end
    
    for i = 1:size(z, 2)
        landmark_position = [l(z(i).id).x, l(z(i).id).y];
        measurement_range = [z(i).range];
        
        
        %% TODO: compute weight
        
        % Se calcula la distancia a partir de la posición de la partícula y
        % la posición del landmark
        d_map = [landmark_position(1) - x(:,1)  , landmark_position(2) - x(:,2)  ];
        d_map = sqrt(sum(d_map.^2,2)); %d_map debería ser una columna de valores
        
        %d_map
        
        % Calculo los pesos suponiendo que las probabilidades son
        % independientes (por lo que hay que multiplicarlos)
        weight = weight.*normpdf(d_map - measurement_range,0, sigma);
    end

    weight = weight ./ size(z, 2);
end
