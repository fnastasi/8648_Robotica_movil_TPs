function heur = heuristic(cell, goal)
  
    
    %%
    k_A = 1;
    
    
    %%
    
    % Se agrega un destino que no es el real para ver como se comporta
    % el algoritmo A* si se agrega una heurística basada en agregar un
    % costo a un destino incorrecto
    goal_trucho = [37,19];
    
    %%
    
    
    heur = k_A * norm(goal-cell); % La heurística es proporcional a la distancia entre el nodo destino y el nodo hijo que se está analizando

    %heur = k_A * norm(goal_trucho-cell);   %Descomentar esta línea si se
                                            %quiere probar el algoritmo
                                            %con un destino no real
    
    
    %heur = 0; % DEBUG ALGORITMO DIJKSTRA -> DESCOMENTAR ESTA LÍNEA
    
  
end
