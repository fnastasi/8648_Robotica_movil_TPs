function s = sample_gauss_rechazo(u,b)
   % Funci�n que devuelve una muestra de una distribuci�n gaussiana.
   % Par�metros:
   % u = media
   % b = desv�o estandar
   
   % M�ximo de la distribuci�n gaussiana con desv�o estandar b
   max = 1/b/(sqrt(2*pi));
   while (true)
       % Se muestrea una variable uniforme usando 3 desv�o estandar dado que en ese rango se
       % encuentra el 99%  de probabilidad de obtener un valor
       s = unifrnd(-5*b,5*b) + u; 
       
       % Se muestrea una variable aleatoria entre 0 y el m�ximo de la distribuci�n gaussiana 
       c = unifrnd(0,max); 
       
       % si el valor de s hace quebrar el loop si es menor al valor
       % correspondiente a la distribuci�n evaluada en x. Por lo tanto hace
       % devolver el valor de s
       if ( ( 1/b/(sqrt(2*pi)) ) * exp( - 0.5* ( (s-u)^2 )/(b^2)  ) >= c)
           break
       end
   end
end
