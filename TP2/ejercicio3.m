
% Belief inicial
bel = [zeros(10,1);1;zeros(9,1)];

% Se inicializa el belief para aplicar el algoritmo
bel_sig = bel;

% Se realizan 9 movimientos de avance
for i=1:9
    bel_sig = fil_bayes_dis_1_mov(bel_sig,1);
end


% Se realizan 3 movimientos de retroceso
for j = 1:3
    bel_sig = fil_bayes_dis_1_mov(bel_sig,-1);
end

% Se verifica que la suma sigue dando 1
sum(bel_sig)


% Se grafica el belief inicial y final en un mismo gráfico
x_array = 0:19;

figure(1)
scatter(x_array,bel_sig,75,'filled')
hold on
scatter(x_array,bel,75,'filled')
grid()
xlabel('Celdas')
ylabel('Belief')
legend('Belief inicial','Belief final')
%saveas(gcf,'belief_comp.png')



% Se grafica solo el belief final 
figure(2)
scatter(x_array,bel_sig,75,'filled')
grid()
xlabel('Celdas')
ylabel('Belief')
%saveas(gcf,'belief.png')

