function s = sample_gauss_sum(u,b)
   % Funci�n que devuelve una muestra de una distribuci�n gaussiana.
   % Par�metros:
   % u = media
   % b = desv�o estandar
   
   % Se devuelve directamente el valor de la aproximaci�n donde se suma el valor esperado.
   s = ( (0.5) * sum(unifrnd(-b,b, 12,1)) ) + u;
   
end
