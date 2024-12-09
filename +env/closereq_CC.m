function closereq_CC(src,callbackdata)
    data = guidata(src);     
%         if strcmp(data.udpPortInfServer.Status,'open') %% Ensures the prevent error at closing if no udp connection has been established
%            fclose(data.udpPortInfServer); %% Closes existing udp-Connection
%         end
    data.closeRequ = 1;               
    guidata(src,data);
    drawnow;  
end
