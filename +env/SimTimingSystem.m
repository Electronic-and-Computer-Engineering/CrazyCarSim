function data = SimTimingSystem(data, timerHandle)

if strcmp(data.direction, 'CCW')
      if ((data.plot_x > data.TimeLane(2,1)) && (data.plot_x < data.TimeLane(3,1)) && data.TimeLane(1,5))
         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
            data.TimeLane(1,5) = 0;
            data.LapTime = data.LapTime + data.MainDur_s;
            timerHandle.Text = datestr(seconds(data.LapTime),'MM:SS,FFF');
            data.LapTime = 0;
         elseif (data.plot_y > data.TimeLane(1,3)) && (data.plot_y < data.TimeLane(1,4))
             if ~data.TimeLane(1,6)
                data.TimeLane(1,5) = 0;
                data.LapTime = data.LapTime + data.MainDur_s;
             end
         end 
      elseif ((data.plot_x > data.TimeLane(2,1)) && (data.plot_x < data.TimeLane(3,1)) && ~data.TimeLane(1,5))
         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
            data.TimeLane(1,5) = 0;
            data.LapTime = data.LapTime + data.MainDur_s;         
         elseif (data.plot_y > data.TimeLane(1,3)) && (data.plot_y < data.TimeLane(1,4))
            data.TimeLane(1,5) = 1;
            data.TimeLane(1,6) = 1;
            data.LapTime = data.LapTime + data.MainDur_s;
         end    
      else
         data.TimeLane(1,6) = 0;
         data.LapTime = data.LapTime + data.MainDur_s;
      end 
elseif strcmp(data.direction, 'CW')
      if ((data.plot_x < data.TimeLane(2,1)) && (data.plot_x > data.TimeLane(1,1)) && data.TimeLane(1,5))
         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
            data.TimeLane(1,5) = 0;
            data.LapTime = data.LapTime + data.MainDur_s;
            timerHandle.Text = datestr(seconds(data.LapTime),'MM:SS,FFF');
            data.LapTime = 0;
         elseif (data.plot_y > data.TimeLane(1,3)) && (data.plot_y < data.TimeLane(1,4))
             if ~data.TimeLane(1,6)
                data.TimeLane(1,5) = 0;
                data.LapTime = data.LapTime + data.MainDur_s;
             end
         end 
      elseif ((data.plot_x < data.TimeLane(2,1)) && (data.plot_x > data.TimeLane(1,1)) && ~data.TimeLane(1,5))
         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
            data.TimeLane(1,5) = 0;
            data.LapTime = data.LapTime + data.MainDur_s;         
         elseif (data.plot_y > data.TimeLane(1,3)) && (data.plot_y < data.TimeLane(1,4))
            data.TimeLane(1,5) = 1;
            data.TimeLane(1,6) = 1;
            data.LapTime = data.LapTime + data.MainDur_s;
         end    
      else
         data.TimeLane(1,6) = 0;
         data.LapTime = data.LapTime + data.MainDur_s;
      end 
end
            
%     if (data.plot_x < data.TimeLane(3,1)) && (data.plot_x > data.TimeLane(2,1)) && (data.TimeLane(1,4) == 0)
%         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
%             data.TimeLane(1,4) = 1;
%             data.LapTime = data.LapTime + data.MainDur_s;
%         end
%     elseif (data.plot_x < data.TimeLane(2,1)) && data.TimeLane(1,4)
%         if (data.plot_y > data.TimeLane(1,2)) && (data.plot_y < data.TimeLane(1,3))
%             timerHandle.Text = datestr(seconds(data.LapTime),'MM:SS,FFF');
%             data.LapTime = 0;
%             data.TimeLane(1,4) = 0;
%         end
%     elseif (data.plot_y > data.TimeLane(1,3))
%             data.TimeLane(1,4) = 0;
%          
%     else
%         data.LapTime = data.LapTime + data.MainDur_s;
%     end
    
end


