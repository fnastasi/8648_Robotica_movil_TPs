%does closest-point matching between the point sets X and P.
%Input:  X, P.
%Output: P_matched, which you get by reordering the elements in P so
%        that they match the elements in X.
function P_matched=closest_point(X,P,vers)
    
    % Se realizaron 3 versiones de como asignar a l vector X, puntos del
    % vector P. Si bien siempre se utilizó el criterio de los puntos más
    % cercanos solo con la versión 3.
    
    P_matched = zeros(size(P));
    
    
     
    if (vers ==1) % Versión 1
        
        p_Num=size(P,2);
        for i=1:p_Num
            x_aux = X(:,i);
            p_aux = P(:,1);
            for j =1:p_Num            
                if ( norm( P(:,j) - x_aux) < norm( p_aux - x_aux  ) ) 
                    p_aux = P(:,j);
                end
            end
            P_matched(:,i) = p_aux;
        end
        
    end
    
    
    if (vers == 2) % Versión 2
        
        X_aux = X;
        P_aux = P;
        while(~isempty(X_aux))

            xNum=size(X_aux,2);
            pNum=size(P_aux,2);

            x = X_aux(:,1);
            x_cand = x; % x candidate
            i_cand = 1;
            p = P_aux(:,1);
            p_cand = p; % p candidate
            j_cand = 1;
            sm_dist = norm(x_cand - p_cand  ); % smallest distance so far
            for i = 1:xNum            
                for j = 1:pNum
                     sm_dist_cand = norm(X_aux(:,i) - P_aux(:,j)); % smallest distance candidate
                     if (sm_dist_cand  < sm_dist) 
                         sm_dist = sm_dist_cand;
                         x_cand = X_aux(:,i);
                         i_cand = i;
                         p_cand = P_aux(:,j);
                         j_cand = j;
                     end
                end
            end


            %j_min = find(X(:,1) == x_cand); % Index in P that corresponds to x_cand
            j_min = 1;
            while( any(X(:,j_min) ~= x_cand) )
                j_min = j_min +1;
            end

            P_matched(:,j_min) = p_cand; % assign best point to result
            X_aux(:,i_cand) = []; % Remove values from array
            P_aux(:,j_cand) = [];
        end
        
    end
    
    
    if (vers==3) % Versión 3
        P_aux = P;
        
        xNum=size(X,2);
        
        for i = 1:xNum 
            
            x = X(:,i); 
            p_cand = P_aux(:,1); % p candidato
            j_cand = 1;  
            pNum=size(P_aux,2);
            sm_dist = norm(x - p_cand  ); % Distancia más pequeña con la que se inicializa
            
            for j = 1:pNum

                 sm_dist_cand = norm( x - P_aux(:,j)); % Candidato a distancia más pequeña
                 if (sm_dist_cand  < sm_dist) % Si la nueva distancia es menor a la que se tiene, proponer al punto como candidato
                     sm_dist = sm_dist_cand;
                     p_cand = P_aux(:,j);
                     j_cand = j;
                 end
            end
            
            P_matched(:,i) = p_cand; % assign best point to result
            %X_aux(:,i_cand) = []; % Remove values from array
            P_aux(:,j_cand) = [];

        end
        
    end
    
    %P_matched = P; %Debug line
end

