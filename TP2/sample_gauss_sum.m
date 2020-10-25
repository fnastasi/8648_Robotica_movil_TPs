function s = sample_gauss_sum(u,b)
   % Función que devuelve una muestra de una distribución gaussiana.
   % Parámetros:
   % u = media
   % b = desvío estandar
   
   % Se devuelve directamente el valor de la aproximación donde se suma el valor esperado.
   s = ( (0.5) * sum(unifrnd(-b,b, 12,1)) ) + u;
   
end
