function steer_angle = SteerServo_model(steer_angle,des_steer_angle,stepTime_s)

steer_deg_max = 22;
t_ZeroToMax = 0.2; % time in seconds
v_perDegree = steer_deg_max / t_ZeroToMax; %degree/s
zeroNoise = 0.25;

if ((des_steer_angle == 0) && (steer_angle < 0))
    des_steer_angle = zeroNoise;
else if ((des_steer_angle == 0) && (steer_angle > 0))    
    des_steer_angle = zeroNoise * -1;
end
    
if steer_angle < des_steer_angle
    steer_angle = steer_angle + v_perDegree*stepTime_s;
    if steer_angle > des_steer_angle
        steer_angle = des_steer_angle;
    end
elseif steer_angle > des_steer_angle
    steer_angle = steer_angle - v_perDegree*stepTime_s;
    if steer_angle < des_steer_angle
        steer_angle = des_steer_angle;
    end
else
    steer_angle = des_steer_angle;
end

end

