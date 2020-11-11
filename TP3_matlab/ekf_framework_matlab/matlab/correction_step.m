function [mu, sigma] = correction_step(mu, sigma, z, l)
    % Updates the belief, i. e., mu and sigma, according to the sensor model
    %
    % The employed sensor model is range-only.
    %
    % mu: 3 x 1 vector representing the mean (x, y, theta) of the normal distribution
    % sigma: 3 x 3 covariance matrix of the normal distribution
    % z: structure containing the landmark observations, see
    %    read_data for the format
    % l: structure containing the landmark position and ids, see
    %    read_world for the format


    % Compute the expected range measurements.
    % This corresponds to the function h.
    expected_ranges = zeros(size(z, 2), 1);
    for i = 1:size(z, 2)
        % Todo: Implement
        % El valor de la medición es la norma euclidiana de la diferencia
        expected_ranges(i) =  norm(  [ l(z(i).id).x - mu(1) , l(z(i).id).y - mu(2) ] );
    end

    % Jacobian of h
    H = zeros(size(z, 2), 3);

    % Measurements in vectorized form
    Z = zeros(size(z, 2), 1);
    for i = 1:size(z, 2)
        H(i, :) = [mu(1) - l(z(i).id).x,  mu(2) - l(z(i).id).y, 0] / expected_ranges(i) ;
        Z(i) = z(i).range ;
    end

    R = diag(repmat([0.5], size(z, 2), 1));
    
    % Covarianza de innovación
    S = H*sigma*H' + R ;
    
    % Ganancia de Kalman
    K = sigma*H'*inv(S);
    
    % Media corregido por medición
    mu = mu + K*(Z - expected_ranges);
    
    % Covarianza corregida por medición
    sigma = ( eye(size(mu,1)) -  K*H)*sigma;
end
