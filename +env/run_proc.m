function run_proc(envHandle)
    while(ishandle(envHandle.UIFigure))
              
         data = guidata(envHandle.UIFigure);
                
         if strcmp(data.Proc,'Run') %%%%%%%%%%%%%%%%%%%%%%  That's were the magic happens %%%%%%%%%%%%%%%%      
            
            % CAR Commands to Voltage
            [speed_voltage, des_steer_angle] = car.percToCar(data.perc_speed, data.perc_steer); 
            
            
            % Simulate Sensors according to car position
            [data.IR.Ranges,data.IR.xy] = car.IRSensorSim([data.plot_x,data.plot_y,data.plot_theta],data.map,[0, 45, -45],0.01,0,'update',data.IRHandles); 
            % Simulate the engine of the vehicle            
            [data.vel, data.carData] = car.motor_model(speed_voltage,data.vel,data.MainDur_s);    
            
            % Simulate steering reaction of the vehicle
            data.steering_angle  = car.SteerServo_model(data.steering_angle ,des_steer_angle,data.MainDur_s);
            
            % Plot the vehicle according to the current speed and steering
            % values of the vehicle
            [data.plot_x,data.plot_y,data.plot_theta] = car.calcRotuPos(data.plot_x,data.plot_y,data.plot_theta,data.vel,data.steering_angle,data.MainDur_s,data.carData);
            
            if strcmp(data.man, 'Off')
                %%%%%%%%%%%%%% Feel Free to Place your Algorithm here %%%%%%%%
                data.IR.Ranges_mm = floor(data.IR.Ranges .* 1000);
                data.ticks = floor((data.vel*1000)/(5*data.MainFrequency));

                [data.perc_steer, data.perc_speed] = algorithm.mex_main(data.IR.Ranges_mm(1),data.IR.Ranges_mm(2),...
                    data.IR.Ranges_mm(3),data.ticks,data.MainFrequency);

                data.perc_steer = double(data.perc_steer);
                data.perc_speed = double(data.perc_speed);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            else
%                 [data.perc_speed, data.perc_steer] = env.keyToPerc(data.speedIdf, data.steerIdf, data.perc_speed, data.perc_steer);
%                 data.speedIdf = 0;
%                 data.steerIdf = 0;
            end
            


            car.plotCar([data.plot_x,data.plot_y], deg2rad(data.steering_angle), data.plot_theta,'update', data.carHandles); %PLOT CAR           
            data.v_Time = circshift(data.v_Time,-1);
            data.v_Time(end) = max(data.v_Time) + data.MainDur_s;
            data.v_DataFront = circshift(data.v_DataFront,-1);
            data.v_DataFront(end) = data.IR.Ranges(1);
            data.v_DataLeft = circshift(data.v_DataLeft,-1);
            data.v_DataLeft(end) = data.IR.Ranges(2);
            data.v_DataRight = circshift(data.v_DataRight,-1);
            data.v_DataRight(end) = data.IR.Ranges(3);
            
            if strcmp(data.run_Plot,'On')
               envHandle.DataFront.Children.XData = data.v_Time(end-75:end);
               envHandle.DataFront.Children.YData = data.v_DataFront(end-75:end);
               envHandle.DataFront.XLim = [data.v_Time(end-75), data.v_Time(end)];
               envHandle.DataLeft.Children.XData  = data.v_Time(end-75:end);
               envHandle.DataLeft.Children.YData = data.v_DataLeft(end-75:end);
               envHandle.DataLeft.XLim = [data.v_Time(end-75), data.v_Time(end)];
               envHandle.DataRight.Children.XData = data.v_Time(end-75:end);
               envHandle.DataRight.Children.YData = data.v_DataRight(end-75:end); 
               envHandle.DataRight.XLim = [data.v_Time(end-75), data.v_Time(end)];
               time.milliPause(10^-9);
            end
            
            data = car.crashDetect(data); %check If vehicle crashed ---> Re-Spawn car
            data = env.SimTimingSystem(data,envHandle.TimeOutput);
            
         end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                      
         guidata(envHandle.UIFigure,data);
         %%%%%% REFRESH %%%%%%%
         drawnow;
         time.milliPause(10^-9);
         %%%%%%
         if data.closeRequ
             break;
         end
     end
     delete(envHandle.UIFigure);
end

