close all

N = 5000; % Cantidad de muestras
pose_sig_array = zeros(3,N); % Array donde se guardan los resultados

pose_act = [
    2;
    4;
    0
];

odom = [
    pi/2;
    0;
    1
];

param = [
    0.1;
    0.1;
    0.01;
    0.01
];

%C�lculo de la pose siguiente
for i = 1:N
    pose_sig_array(:,i) = sample_motion_model(pose_act,odom,param); 
end

%Gr�fico de las poses obtenidas
figure(1)
scatter(pose_sig_array(1,:),pose_sig_array(2,:));
xlabel("Eje x [m]")
ylabel("Eje y [m]")
xlim([1,3])
ylim([4.5,5.2])
grid()
%saveas(gcf,'odom.png')





% Se vuelve a simular el movimiento del robot con valores de alpha_i
% 1 orden menor.

param = [
    0.01;
    0.01;
    0.001;
    0.001
];

%C�lculo de la pose siguiente
for i = 1:N
    pose_sig_array(:,i) = sample_motion_model(pose_act,odom,param); 
end

%Gr�fico de las poses obtenidas
figure(2)
scatter(pose_sig_array(1,:),pose_sig_array(2,:));
xlabel("Eje x [m]")
ylabel("Eje y [m]")
xlim([1,3])
ylim([4.3,5.2])
grid()
%saveas(gcf,'odom_peq_error.png')









% Se vuelve a simular el movimiento del robot con valores de alpha_i
% 1 orden mayor al original.

param = [
    1;
    1;
    .1;
    .1
];

%C�lculo de la pose siguiente
for i = 1:N
    pose_sig_array(:,i) = sample_motion_model(pose_act,odom,param); 
end

%Gr�fico de las poses obtenidas
figure(3)
scatter(pose_sig_array(1,:),pose_sig_array(2,:));
xlabel("Eje x [m]")
ylabel("Eje y [m]")
%xlim([0.51,])
%ylim([4.5,5.2])
grid()
%saveas(gcf,'odom_gran_error.png')

