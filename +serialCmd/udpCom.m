function [perc_speed,perc_steer] = udpCom(comObj,data)
    
    perc_speed = data.perc_speed;
    perc_steer = data.perc_steer;
             
    if(comObj.BytesAvailable > 0 && data.BroadCast)
        recV = zeros(1,comObj.BytesAvailable); %% reset received data
        recV = fread(comObj,comObj.BytesAvailable,'char'); %read whole UDP data package

        if(((recV(1) == 'S') && (recV(2) == ':')) && ((recV(end) == 'E') && (recV(end-1) == ':')))                                                         
             perc_speedByte = (recV(4));
             perc_steerByte = (recV(3));
            
             IRFront_h = bitshift(uint16(data.IR.Ranges(2)*1000),-8);
             IRFront_l = data.IR.Ranges(2)*1000 - bitshift(IRFront_h,8);
             
             IRleft_h = bitshift(uint16(data.IR.Ranges(1)*1000),-8);
             IRleft_l = data.IR.Ranges(1)*1000 - bitshift(IRleft_h,8);
             
             IRRight_h = bitshift(uint16(data.IR.Ranges(3)*1000),-8);
             IRRight_l = data.IR.Ranges(3)*1000 - bitshift(IRRight_h,8);
             
             IRSpeed_h = bitshift(uint16(data.vel*1000),-8);
             IRSpeed_l = data.vel*1000 - bitshift(IRSpeed_h,8);
             
             cmdToPC = ['C',':',IRFront_h,IRFront_l,IRleft_h,IRleft_l,IRRight_h,IRRight_l,IRSpeed_h,IRSpeed_l,':','E']; 
             
             fwrite(comObj,cmdToPC,'uint8'); % After processing send the new control commands                                
             % Set rec to 1 (true) to receive data again 
        end

        [perc_speed, perc_steer] = serialCmd.percByte2Perc(perc_speedByte, perc_steerByte); 
    end
    
end