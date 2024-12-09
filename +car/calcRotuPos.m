function  [x,y,theta] = calcRotuPos(x_old, y_old,theta_old, speed_v,steer_deg,step_s, carData)
    
    %%%%%% Car Dimensions %%%%%%
    car_L = 0.14;   % length (m)
    car_W = 0.085;  % width  (m)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    beta = atan(car_L/(car_L/tan(deg2rad(steer_deg))));   
    theta = theta_old + beta*(speed_v/(car_L))*step_s;
    
    turnRadius = car_L / sin(theta-theta_old);
    Fr_cc = carData.m_cc * 9.81 * carData.c_r * 4;
    F_cen = (carData.m_cc*speed_v.^2) / turnRadius; %Centrifugal force
    
%     if (F_cen > Fr_cc)
%         disp('hey')
%     end

    x = x_old + speed_v * cos(theta) * step_s;
    y = y_old + speed_v * sin(theta) * step_s;
    


end

