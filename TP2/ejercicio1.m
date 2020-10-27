close all

N = 1e5; % Número de muestras, con 1e6 queda mejor pero tarda más
s_array = zeros(N,1); %arreglo de muestras
elap_time_array = zeros(N,1);
u = 0; % media
b = 1; % desvío estandar
Nbin = N/1e3; % cantidad de bins para el histograma

% histograma para la función sample_gauss_sum
% Se toma el tiempo que se tarda en muestrear una vez para luego promediar
for i = 1:N
    tic;
    s_array(i) = sample_gauss_sum(u,b);
    elap_time_array(i) = toc;
end

elap_time_avg_sum = mean(elap_time_array); % Se promedia el tiempo que se tardó en tomar N muestras
% Se genera un histograma
figure(1)
histogram(s_array,Nbin,'Normalization','pdf')
grid()
ylabel("Frecuencia normalizada")
xlabel("Muestras")
%saveas(gcf,'gauss_TCL.png')

% histograma para la función sample_gauss_rechazo
% Se toma el tiempo que se tarda en muestrear una vez para luego promediar
for i = 1:N
    tic;
    s_array(i) = sample_gauss_rechazo(u,b);
    elap_time_array(i) = toc; 
end

elap_time_avg_rechazo = mean(elap_time_array);% Se promedia el tiempo que se tardó en tomar N muestras
% Se genera un histograma
figure(2)
histogram(s_array,Nbin,'Normalization','pdf')
grid()
ylabel("Frecuencia normalizada")
xlabel("Muestras")
%saveas(gcf,'gauss_rechazo.png')


% histograma para la función sample_gauss_BM
% Se toma el tiempo que se tarda en muestrear una vez para luego promediar
for i = 1:N
    tic;
    s_array(i) = sample_gauss_BM(u,b);
    elap_time_array(i) = toc; 
end

elap_time_avg_BM = mean(elap_time_array);% Se promedia el tiempo que se tardó en tomar N muestras
% Se genera un histograma
figure(3)
histogram(s_array,Nbin,'Normalization','pdf')
grid()
ylabel("Frecuencia normalizada")
xlabel("Muestras")
%saveas(gcf,'gauss_BM.png')


% histograma para la función normrand
% Se toma el tiempo que se tarda en muestrear una vez para luego promediar
for i = 1:N
    tic;
    s_array(i) = normrnd(u,b);
    elap_time_array(i) = toc; 
end

elap_time_avg_normrnd = mean(elap_time_array);% Se promedia el tiempo que se tardó en tomar N muestras
% Se genera un histograma
figure(4)
histogram(s_array,Nbin,'Normalization','pdf')
grid()
ylabel("Frecuencia normalizada")
xlabel("Muestras")
%saveas(gcf,'gauss_matlab.png')





