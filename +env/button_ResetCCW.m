function button_ResetCCW(src,callbackdata)
    data = guidata(src);     

    data.plot_x             = 3.5;
    data.plot_y             = 0.6;
    data.plot_theta         = 0;
    data.vel                = 0;
    data.steering_angle     = 0;
    data.perc_speed         = 0;
    data.perc_steer         = (2*randi([0 1]) - 1)*0.5;
    data.LapTime            = 0;
    data.direction          = 'CCW';
    
    data.plot_x = data.plot_x + 0.1;
    disp(num2str(data.plot_x));
    clear mex_main
    guidata(src,data);
    drawnow;  
end
