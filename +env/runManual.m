function runManual(src,~)

    data = guidata(src);
    canvas_Fig = findobj(src.Parent,'Tag','GUI_tag');
    
    if strcmp(src.Value,'On')                

        data.man = 'On';
        canvas_Fig.KeyPressFcn =   @env.keypressed_CC;
        canvas_Fig.KeyReleaseFcn = @env.keypressed_CC;

    else
        
        canvas_Fig.KeyPressFcn = '';
        canvas_Fig.KeyReleaseFcn = '';
        data.man = 'Off';  
        
    end
    drawnow;
    time.milliPause(0.0000001);
    guidata(src,data);
end

