function runSwitch(src,~)

    data = guidata(src);
    OnOffLamp = findobj(src.Parent,'Tag','OnOffLamp');
    % MEX C Files
    mexSuppport.runMex;
    if strcmp(src.Value,'On')                
        OnOffLamp.Color = [0,1,0];
        data.Proc = 'Run';
        data.LapTime = 0;
    else
        OnOffLamp.Color = [1,0,0];
        data.Proc = 'Stp';                
    end
    drawnow;
    time.milliPause(0.001);
    guidata(src,data);
end

