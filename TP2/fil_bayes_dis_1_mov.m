function bel_sig = fil_bayes_dis_1_mov(bel_act,u)
    %Esta función aplica el filtro de bayes en 1 movimiento.
    %Los parámetros son el belief actual y el movimiento
    
    %Se inicializa el belief resultante
    bel_sig = zeros(20,1);
    
    
    % Por cada posición calculo el belief
    for x = 0:19        
        bel = 0; % Inicializo el belief de la celda x en 0
        for  x_=0:19 
            bel = bel + prob_cond(x,u,x_)*bel_act(x_+1); % Aplico la sumatoria del filtro de Bayes discreto
        end
        bel_sig(x+1) = bel; % Le asigno a laa celda x el belief resultante.
    end
    
end