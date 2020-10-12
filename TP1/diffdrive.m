function [x_n, y_n, theta_n] = diffdrive(x, y, theta, vl, vr, t, l)
    % C�lculod de velocidad y velocidad de rotaci�n
    vel_rot = (vr - vl)/l;
    vel = (vr+vl)/2;
    
    % integraci�n de la ecuaciones de la cinem�tica del accionamiento
    % diferencial
    [tode,pose] = ode45(@(t,pose) dirKin(t,pose,vel,vel_rot), [0 t], [x y theta]);
    
    % Se devuelve el �ltimo paso de la integraci�n
    x_n = pose(end,1);
    y_n = pose(end,2);
    theta_n = pose(end,3);
end