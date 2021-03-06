%Ejercicio 2. 

clear all 
clc

% Carga de mediciones
scan = load('-ascii','laserscan.dat');
angle = linspace(-pi/2, pi/2, size(scan,2));

% 1 - gr�fico de mediciones en terna del sensor lidar: para cada �ngulo se
% tiene la medici�n de distancia que puede pensarse como el m�dulo de la
% posici�n del objeto que se detecta. Por lo tanto el conjunto de los
% arreglos (angle,scan) determina las coordenadas polares en el sistema de
% referencia del lidar

% Se calcula la posici�n en coordenadas carteesianas utilizando las mediciones
pos_lidar = [scan.*cos(angle);
             scan.*sin(angle)
            ];

x_lidar = pos_lidar(1,:);
y_lidar = pos_lidar(2,:);
        
        
% Se grafica la posici�n de los objetos detectados en la terna del sensor.
figure(1)
scatter(x_lidar, y_lidar,'filled');
axis('equal')
grid on;
title('Posici�n de las mediciones del sensor LiDaR en la terna del sensor')
xlabel('Eje x [m]')
ylabel('Eje y [m]')
saveas(gcf,'medic_sensor.png')

% 3 - Se calculan las posiciones del robot, del sensor y de las mediciones
% en la terna global. El resultado se grafica en una misma figura



% Obtenci�n de transformaci�n homogenea en el caso robot - terna globlal.
% Esto es, la matriz homog�nea que mapea las coordenadas en la terna del
% robot a la terna global.
t_robot = [1;0.5];
orient_robot = pi/4;

% Matriz de rotaci�n
R_robot_global = [
    cos(orient_robot) -sin(orient_robot) 
    sin(orient_robot) cos(orient_robot)
];

%Matriz homogenea
T_robot_global = [
    R_robot_global t_robot;
    zeros(1,2) 1
];


% Obtenci�n de transformaci�n homogenea en el caso sensor - robot.
% Esto es, la matriz homog�nea que mapea las coordenadas en la terna del
% sensor a la terna del robot.
t_sensor = [0.2;0];
orient_sensor = pi;

% Matriz de rotaci�n
R_sensor_robot = [
    cos(orient_sensor) -sin(orient_sensor) 
    sin(orient_sensor) cos(orient_sensor)
];


%Matriz homogenea
T_sensor_robot = [
    R_sensor_robot t_sensor;
    zeros(1,2) 1
];


% Los siguientes c�lculos est�n referidos a la terna global


pos_robot = t_robot; % Posici�n del robot en la terna global



pos_sensor = T_robot_global* [t_sensor ;1]; % Posici�n del sensor de la terna global
pos_sensor = pos_sensor(1:2,:); % Para obtener la posici�n en R^2  hay que deshacerse del 1 que se utiliza para multiplicar la matriz homog�nea.

pos_global = T_robot_global* T_sensor_robot * [pos_lidar;ones(1,size(scan,2))];% Posici�n de los objeto0s detectados en la terna global
pos_global = pos_global(1:2,:); % Para obtener la posici�n en R^2  hay que deshacerse del 1 que se utiliza para multiplicar la matriz homog�nea.


% Se grafica el robot, el sensor y las mediciones en la terna global
figure(2)
hold on
scatter(pos_robot(1),pos_robot(2),200,'filled','DisplayName','Pos. robot');
scatter(pos_sensor(1),pos_sensor(2),100,'filled','DisplayName','Pos. sensor');
scatter(pos_global(1,:),pos_global(2,:),20,'filled','DisplayName','Mediciones');
axis('equal')
grid on;
title('Posici�n de los objetos y las mediciones del sensor LiDaR en la terna global')
xlabel('Eje x [m]')
ylabel('Eje y [m]')
legend()
saveas(gcf,'medic_global.png')