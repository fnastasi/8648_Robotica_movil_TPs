function [pose, ICC] = diffdrive_mod(x, y, theta, vl, vr, t, l)
    vel_rot = (vr - vl)/l;
    vel = (vr+vl)/2;
    R = l*(vr+vl)/ (vr-vl) / 2;
    [tode,pose] = ode45(@(t,pose) dirKin(t,pose,vel,vel_rot), [0 t], [x y theta]);
    ICC = [ pose(:,1) - R*sin(pose(:,3) ) , pose(:,2) + R*cos(pose(:,3) ) ];
end