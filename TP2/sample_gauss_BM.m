function s = sample_gauss_MB(u,b)
   % Funci�n que devuelve una muestra de una distribuci�n gaussiana.
   % Par�metros:
   % u = media
   % b = desv�o estandar
   
   % Se devuelve directamente el valor de la aproximaci�n donde se suma el valor esperado.
   u1 = unifrnd(0,1);
   u2 = unifrnd(0,1);
   
   % Muestra de una distribuci�n gaussiana estandar 
   sg = cos(2*pi*u1) * sqrt( -2* log(u2 ) );   
   
   % Combierto la muestra anterior a una gaussiana con media u y desv�o
   % estandar b
   s = b*sg + u;
end
