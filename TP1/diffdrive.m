function [x_n, y_n, theta_n] = diffdrive(x, y, theta, vl, vr, t, l)
    % Cálculod de velocidad y velocidad de rotación
    vel_rot = (vr - vl)/l;
    vel = (vr+vl)/2;
    
    % integración de la ecuaciones de la cinemática del accionamiento
    % diferencial
    [tode,pose] = ode45(@(t,pose) dirKin(t,pose,vel,vel_rot), [0 t], [x y theta]);
    
    % Se devuelve el último paso de la integración
    x_n = pose(end,1);
    y_n = pose(end,2);
    theta_n = pose(end,3);
end