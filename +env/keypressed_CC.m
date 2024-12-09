function keypressed_CC(src,callbackdata)
    data = guidata(src);     
    
    if strcmp(callbackdata.Modifier, 'control')
        if strcmp(callbackdata.EventName, 'KeyPress')
            data.speedIdf = 1;
        elseif strcmp(callbackdata.EventName, 'KeyRelease')
            data.speedIdf = 0;
        end
    elseif strcmp(callbackdata.Modifier, 'alt')
        if strcmp(callbackdata.EventName, 'KeyPress')
            data.speedIdf = -1;
        elseif strcmp(callbackdata.EventName, 'KeyRelease')
            data.speedIdf = 0;
        end
    end
    
    if strcmp(callbackdata.Key, 'leftarrow')
        if strcmp(callbackdata.EventName, 'KeyPress')
            data.steerIdf = 1;
        elseif strcmp(callbackdata.EventName, 'KeyRelease')
            data.steerIdf = 0;
        end
    elseif strcmp(callbackdata.Key, 'rightarrow')
        if strcmp(callbackdata.EventName, 'KeyPress')
            data.steerIdf = -1;
        elseif strcmp(callbackdata.EventName, 'KeyRelease')
            data.steerIdf = 0;
        end
    end
    
    guidata(src,data);
    time.milliPause(10^-6);
    drawnow;  
end
