function [perc_speed, perc_steer] = percByte2Perc(speed, steering)

%%%%%%%%%%%%%%%%%%%%%%%% Speed
if speed >= 150
   perc_speed = speed - 150;
   if perc_speed > 100
      perc_speed = 100;
   end 
elseif speed <= 100
   perc_speed = speed - 100;
   if perc_speed < -100
      perc_speed = -100;
   end
else
   perc_speed = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%% Steering
if steering > 100
   perc_steer = steering - 100;
   if perc_steer > 100
      perc_steer = 100;
   end   
elseif steering <= 100
   perc_steer = steering - 100;
   if perc_steer < -100
      perc_steer = -100;
   end
else
   perc_steer = 0;
end

end