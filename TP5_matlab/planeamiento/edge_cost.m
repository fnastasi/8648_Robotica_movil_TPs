function cost = edge_cost(parent, child, map)
  
    
    cost = 0;
 
    %%% YOUR CODE FOR CALCULATING THE COST FROM VERTEX parent TO VERTEX child GOES HERE
    
    child_y = child(1);
    child_x = child(2);
    
    cost_child =  map(child_y, child_x);  % Costo del nodo hijo segun la grilla de ocupaci�n
    
    % Umbral del costo. Se eligi� este valor seg�n la imagen que se obtuvo
    % a partir de la matrix map. Se observ� que a partir de 0.4 se podr�a
    % apreciar obst�culos
    if cost_child  > 0.4  % Si la probabilidad de ocupaci�n es mayor a 4, se considera un obst�culo y el costo es infinito
        cost = cost + inf;
    end
    
    dist_pc = norm(parent - child); % Distancia padre a  hijo
    
    %Par�metros para ajustar el algoritmo
    k_D_cost = 1; 
    k_D_dist = 1;
    
    %%
    
    % Descomentar el siguiente if si se quiere dar un costo mucho mayor
    % a los nodos diagonales y con esto hacer que el robot nunca planee una
    % trayectoria con este tipo de movimientos
    
    %if dist_pc == sqrt(2)
    %    dist_pc = dist_pc*10;  
    %end
    
    %%
    
    % Esto fue un intento no exitoso de agregar costo a aquellos children
    % que no tengan un obst�culo en uno de sus nodos adyacentes de forma tal
    % de que se elijan aquellos nodos que se encuentren al lado de una
    % pared u obst�culo. El objetivo principal de esta parte del c�digo era
    % lograr que el robot se mantenga siempre al lado de una pared u
    % obst�culo
    
    %obs_n = map(child(1) + 1, child(1) ) > 0.4; % obst�culo al norte
    %obs_s = map(child(1) - 1, child(1) ) > 0.4; % obst�culo al sur
    %obs_e = map(child(1), child(1) + 1 ) > 0.4; % obst�culo al este
    %obs_w = map(child(1), child(1) - 1 ) > 0.4; % obst�culo al oeste
    %if ~(obs_n || obs_s || obs_e || obs_w)
    %    cost = cost + 10;
    %end
    
    
    
    %%
    
    
    
    % Costo total es la suma combinaci�n lineal del costo dado por la
    % grilla de ocupaci�n y la distancia padre-hijo.
    cost = cost + k_D_dist * dist_pc + k_D_cost *cost_child; % Usar este costo, los otros son de prueba
    
    %cost = cost + dist_pc;
    %cost = cost +  1 +  k_D*cost_child;
        
end