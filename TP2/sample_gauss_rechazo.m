function s = sample_gauss_rechazo(u,b)
   % Función que devuelve una muestra de una distribución gaussiana.
   % Parámetros:
   % u = media
   % b = desvío estandar
   
   % Máximo de la distribución gaussiana con desvío estandar b
   max = 1/b/(sqrt(2*pi));
   while (true)
       % Se muestrea una variable uniforme usando 3 desvío estandar dado que en ese rango se
       % encuentra el 99%  de probabilidad de obtener un valor
       s = unifrnd(-5*b,5*b) + u; 
       
       % Se muestrea una variable aleatoria entre 0 y el máximo de la distribución gaussiana 
       c = unifrnd(0,max); 
       
       % si el valor de s hace quebrar el loop si es menor al valor
       % correspondiente a la distribución evaluada en x. Por lo tanto hace
       % devolver el valor de s
       if ( ( 1/b/(sqrt(2*pi)) ) * exp( - 0.5* ( (s-u)^2 )/(b^2)  ) >= c)
           break
       end
   end
end
