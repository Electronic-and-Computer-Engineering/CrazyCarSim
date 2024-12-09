function broadCastSW(src,~)

    data = guidata(src);
    LocalPortField = findobj(src.Parent,'Tag','LocalPortField');
    HostPortField = findobj(src.Parent,'Tag','HostPortField');
    IPAdressField = findobj(src.Parent,'Tag','IPAdressField');
    BroadCastLamp = findobj(src.Parent,'Tag','BroadCastLamp');
            
    if strcmp(src.Value,'On')                
        instrPorts = instrfind;
        for i = 1:length(instrPorts)                    
            fclose(instrPorts(i));
            delete(instrPorts(i));                   
        end

        data.udpPortInfServer = udp(IPAdressField.Value,str2double(HostPortField.Value),'LocalPort', str2double(LocalPortField.Value));
        fopen(data.udpPortInfServer);
        BroadCastLamp.Color = [0,1,0];
        data.BroadCast = 1;
    else
        fclose(data.udpPortInfServer);
        BroadCastLamp.Color = [1,0,0];
        data.BroadCast = 0;                
    end

    guidata(src,data);


end

