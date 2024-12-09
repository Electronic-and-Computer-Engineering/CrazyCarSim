function runPlot(src,~)

    data = guidata(src);
    canvas_Fig = findobj(src.Parent,'Tag','GUI_tag');
    DataFront_Axs = findobj(src.Parent,'Tag','Data_Front');
    DataLeft_Axs = findobj(src.Parent,'Tag','Data_Left');
    DataRight_Axs = findobj(src.Parent,'Tag','Data_Right');
    
    if strcmp(src.Value,'On')                
        data.run_Plot = 'On';
        canvas_Fig.Position = [canvas_Fig.Position(1) canvas_Fig.Position(2) 1600 447];
        DataFront_Axs.Visible = 'on';
        DataLeft_Axs.Visible = 'on';
        DataRight_Axs.Visible = 'on';     
    else
        data.run_Plot = 'Off';  
        canvas_Fig.Position = [canvas_Fig.Position(1) canvas_Fig.Position(2) 1025 447];
        DataFront_Axs.Visible = 'off';
        DataLeft_Axs.Visible = 'off';
        DataRight_Axs.Visible = 'off'; 
    end
    
    drawnow;
    time.milliPause(10^-6);
    guidata(src,data);
end

