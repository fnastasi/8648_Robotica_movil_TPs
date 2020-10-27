function p = prob_cond(x, u, x_)

    % x: posición siguiente
    % u: acción, puede tomar el valor 1 o -1
    % x_: posición actual
    
    %Esta función devuelve la probabilidad P(x|u,x')
    
    d = x - x_; % distancia entre la celda en que me encontraba y a la que eventualmente me encontraría
    
    if (u== 1) % Si el movimiento es de avance
        if x_ <=17 % Hasta la ante penúltima celda superior asigno las probabilidad según el valor de d
            switch d
                case 0
                    p = 0.25; 
                case 1
                    p = 0.5 ;
                case 2
                    p = 0.25; 
                otherwise
                    p = 0;
            end
        end
        if x_ == 18 % Devuelvo la probabilidad a partir de considerar que estoy en la penúltima celda superior
            switch d
                case 0
                    p = 0.25; 
                case 1
                    p = 0.75 ;
                otherwise
                    p = 0;               
            end
        end
        if x_ == 19% Devuelvo la probabilidad  a partir de considerar que estoy en la última ceda superior
            if x == 19
                p = 1;
            else
                p = 0;
            end
        end
    end
    
    
    
    
    if (u== -1)% Si el movimiento es de avance
        if x_ >=2
            switch d % Hasta la ante penúltima celda inferior asigno las probabilidad según el valor de d
                case 0
                    p = 0.25; 
                case -1
                    p = 0.5 ;
                case -2
                    p = 0.25; 
                otherwise
                    p = 0;
            end
        end
        if x_ == 1 % Devuelvo la probabilidad a partir de considerar que estoy en la penúltima celda inferior
            switch d
                case 0
                    p = 0.25; 
                case -1
                    p = 0.75 ;
                otherwise
                    p = 0;               
            end
        end
        if x_ == 0 % Devuelvo la probabilidad  a partir de considerar que estoy en la última ceda inferior
            if x == 0
                p = 1;
            else
                p = 0;
            end
        end
    end
end