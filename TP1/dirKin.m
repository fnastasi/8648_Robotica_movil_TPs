function drdt = dirKin(t,pose,vel,vel_rot)
    %ecuaci�n diferencial dada por la cinem�tica del accionaamiento
    %diferencial
    %x^punto = v * cos(tita)
    %y^punto = v * sin(tita)
    %tita^punto = omega
    drdt = [
        vel*cos(pose(3)); % derivada de la posici�n x
        vel*sin(pose(3)); % derivada de la posici�n y
        vel_rot % derivada de tita 
    ];
end