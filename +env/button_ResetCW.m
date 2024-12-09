function button_ResetCW(src,callbackdata)
    data = guidata(src);     

    data.plot_x             = 2.5;
    data.plot_y             = 0.6;
    data.plot_theta         = -pi;
    data.vel                = 0;
    data.steering_angle     = 0;
    data.perc_speed         = 0;
    data.perc_steer         = (2*randi([0 1]) - 1)*0.5;
    data.LapTime            = 0;
    data.direction          = 'CW';
    
    clear mex_main
    guidata(src,data);
    drawnow;  
end
