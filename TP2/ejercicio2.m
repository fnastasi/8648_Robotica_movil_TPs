close all

N = 5000;
pose_sig_array = zeros(3,N);

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

for i = 1:N
    pose_sig_array(:,i) = sample_motion_model(pose_act,odom,param); 
end

figure(1)
scatter(pose_sig_array(1,:),pose_sig_array(2,:));

