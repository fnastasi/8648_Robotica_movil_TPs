function drdt = dirKin(t,pose,vel,vel_rot)
    %ecuación diferencial dada por la cinemática del accionaamiento
    %diferencial
    %x^punto = v * cos(tita)
    %y^punto = v * sin(tita)
    %tita^punto = omega
    drdt = [
        vel*cos(pose(3)); % derivada de la posición x
        vel*sin(pose(3)); % derivada de la posición y
        vel_rot % derivada de tita 
    ];
end