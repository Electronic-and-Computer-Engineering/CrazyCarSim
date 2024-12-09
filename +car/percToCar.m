function [speed_voltage, steer_angle] = percToCar(perc_speed, perc_steer)

V_max = 4;
steer_deg_max = 22;

%%%%%%%%%%%%%%%%%%%%%%%% Speed
speed_voltage = (V_max/100) * perc_speed; 

%%%%%%%%%%%%%%%%%%%%%%%% Steering
steer_angle = (steer_deg_max/100) * perc_steer; 

end