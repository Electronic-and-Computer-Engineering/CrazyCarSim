function [speed, steer] = keyToPerc(speedIdf, steerIdf, speed, steer)

    if (speedIdf == 1)
            speed = speed + 2;
        if (speed >= 100)
            speed = 100;
        end
    elseif (speedIdf == -1)
        speed = speed - 2;
        if (speed <= -100)
            speed = -100;
        end
    else
        speed = 0;
    end

    if (steerIdf == 1)
        steer = steer + 12.5;
        if (steer >= 100)
            steer = 100;
        end
    elseif (steerIdf == -1)
        steer = steer - 12.5;
        if (steer <= -100)
            steer = -100;
        end
    else
        steer = 0;
    end
    
end