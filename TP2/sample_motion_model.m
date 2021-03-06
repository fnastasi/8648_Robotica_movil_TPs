function pose_sig = sample_motion_model(pose_act, odom, param )
    
    % obtenci�n de par�metros a partir de los argumentos de la funci�n

    x_act = pose_act(1);
    y_act = pose_act(2);
    tita_act = pose_act(3);
    
    D_rot1 = odom(1);
    D_rot2 = odom(2);
    D_trans = odom(3);
    
    alpha1 = param(1);
    alpha2 = param(2);
    alpha3 = param(3);
    alpha4 = param(4);
    
    
    % Se agrega la incerteza a la odometr�a
    b_rot1 =  alpha1*abs(D_rot1) + alpha2 * D_trans;
    D_rot1_somb = D_rot1 + sample_gauss_sum(0, b_rot1);
    
    b_rot2 = alpha1*abs(D_rot2) + alpha2 * D_trans;
    D_rot2_somb = D_rot2 + sample_gauss_sum(0, b_rot2);
    
    b_trans = alpha3*D_trans + alpha4* ( abs(D_rot1) + abs(D_rot2) );
    D_trans_somb = D_trans + sample_gauss_sum(0, b_trans );
    
    x_sig = x_act + D_trans_somb*cos(tita_act + D_rot1_somb);
    y_sig = y_act + D_trans_somb*sin(tita_act + D_rot1_somb);
    tita_sig = tita_act + D_rot1_somb + D_rot2_somb;
    
    pose_sig = [x_sig;
                y_sig;
                tita_sig;
    ];
    
end
