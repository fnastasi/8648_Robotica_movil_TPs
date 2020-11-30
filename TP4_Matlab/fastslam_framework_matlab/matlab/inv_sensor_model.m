function l_inv= inv_sensor_model(z,c)
    N = size(c,2); %grid size
    l_inv = 0.5 * ones(1,N); % a prior log odds
    b = false(1,N); % aux logical array

    b = b | (c < z); % if  cell position < measurement => assign 1 to that cell
    l_inv(b) = 0.3;
    b = false(1,N); % reset auxiliar array

    b = b | (c >= z & c < z + 20 ); % if cell position > measument and < measurement + 20 cm => assign 1 to that cell
    l_inv(b) = 0.6;
    
    l_inv = log(l_inv./(1-l_inv));
end