function drdt = dirKin(t,pose,vel,vel_rot)
    drdt = [
        vel*cos(pose(3));
        vel*sin(pose(3));
        vel_rot
    ];
end