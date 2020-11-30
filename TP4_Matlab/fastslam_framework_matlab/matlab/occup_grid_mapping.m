
clear all
close all


z = [101;82;91;112;99;151;96;85;99;105]; % measurements in cm
res = 10; %resolution
grid_size = 200; 
c = [0:res:grid_size]; % coordinates of each grid
p_prior = 0.5*ones(1,size(c,2)); % A prior probability

lp_prior = log(p_prior./(1-p_prior)); % A prior log odds probability. Obs: array containing only zeros
lp = lp_prior; % Initial log odds probability

for i =1:size(z,1)
    lp = inv_sensor_model(z(i),c) + lp - lp_prior;
end

bel = 1 - 1./(1+exp(lp)); % Belief

figure
scatter(fix(c/10),bel);
grid()
title("Belief luego de las mediciones realizadas.")
xlabel("Celda")
ylabel("Belief")
saveas(gcf,'orig_bel.png')



bel_first_aprox = heaviside(bel - 0.5); % Aproximating result with a heaviside function


dicc = containers.Map([0, 0.5, 1], {'#FFFFFF','#808080', '#000000'}); % mapping values [0 , 0.5, 1] to colors [white, grey, black]

figure
title("Aproximación del belief a partir del redondeo de la probabilidad de cada celda.")
for i = 1:size(bel,2)-1
    pos = 10*(i-1);
    rectangle('Position', [pos,0,10,1], 'FaceColor',dicc(bel_first_aprox(i)));
end
xlabel('Distancia [cm]')
ylabel('Belief')
saveas(gcf,'aprox_bel.png')



% Second aproximation for belief: if position m_i < position m_i_max such that bel(m_i_max) = max(bel(m_j)) 
% over all m_j then bel(m_i) = 0, otherwise bel(m_i) = 1 and if m_i < m_i_max + 20 cm => bel(m_i) = 0.5
[~,idx] = max(bel);
c_max= fix(c(idx)/10) +1;

bel_second_aprox = zeros(1, size(bel,2));
bel_second_aprox(1:c_max-1)=  0;
bel_second_aprox(c_max:c_max+1)=  1;
bel_second_aprox(c_max+2:end)=  0.5;

figure
title("Aproximación del belief a partir de la celda con probabilidad máxima.")
for i = 1:size(bel,2)-1
    pos = 10*(i-1);
    rectangle('Position', [pos,0,10,1], 'FaceColor',dicc(bel_second_aprox(i)));
end
xlabel('Distancia [cm]')
ylabel('Belief')
saveas(gcf,'aprox_bel_2.png')
