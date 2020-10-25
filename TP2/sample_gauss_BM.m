function s = sample_gauss_MB(u,b)
   % Función que devuelve una muestra de una distribución gaussiana.
   % Parámetros:
   % u = media
   % b = desvío estandar
   
   % Se devuelve directamente el valor de la aproximación donde se suma el valor esperado.
   u1 = unifrnd(0,1);
   u2 = unifrnd(0,1);
   
   % Muestra de una distribución gaussiana estandar 
   sg = cos(2*pi*u1) * sqrt( -2* log(u2 ) );   
   
   % Combierto la muestra anterior a una gaussiana con media u y desvío
   % estandar b
   s = b*sg + u;
end
