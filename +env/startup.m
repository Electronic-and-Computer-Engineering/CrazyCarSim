function startup(envHandle)
    
%%% DATA Init %%%

    data = guidata(envHandle.UIFigure);
    data.carData.V_old = 0;
    data.Proc               = 'Stp'; 
    data.man                = 'Off'; 
    data.run_Plot           = 'Off';
    data.direction          = 'CCW';
    data.MainFrequency      = 25; % in Hz
    data.MainDur_s          = 1 / data.MainFrequency;
    data.t_waitval          = 0;
    data.plot_x             = 3.5;
    data.plot_y             = 0.6;
    data.plot_theta         = 0;
    data.vel                = 0;
    data.steering_angle     = 0;
    data.perc_speed         = 0;
    data.perc_steer         = (2*randi([0 1]) - 1)*0.5;
    data.closeRequ          = 0;
    data.BroadCast          = 0;
    data.LapTime            = 0;
    data.NumCars            = 1;
    data.TimeLane = [2.5, 0, 0.76, 1.5, 0, 0;...
                     3, 0, 0.76, 1.5, 0, 0;...
                     3.5, 0, 0.76, 1.5, 0, 0];
    data.speedIdf = 0;
    data.steerIdf = 0;
                 
    data.v_Time      = zeros(1,6000);
    data.v_DataFront = zeros(1,6000);
    data.v_DataLeft  = zeros(1,6000);
    data.v_DataRight = zeros(1,6000);
    
    plot(data.v_Time(end-75:end), data.v_DataFront(end-75:end), 'Parent', envHandle.DataFront);   
    plot(data.v_Time(end-75:end), data.v_DataLeft(end-75:end), 'Parent', envHandle.DataLeft);
    plot(data.v_Time(end-75:end), data.v_DataRight(end-75:end), 'Parent', envHandle.DataRight);
    
    %%% APP DATA Init %%%
    envHandle.IPAdressEditField.Value = '127.0.0.1';
    envHandle.LocalPortEditField.Value = num2str(5000);
    envHandle.HostPortEditField.Value = num2str(6000);
    envHandle.OnOffLamp.Color = [1,0,0];
    envHandle.BroadCastLamp.Color = [1,0,0];
    data.udpPortInfServer = udp(envHandle.IPAdressEditField.Value,str2double(envHandle.HostPortEditField.Value),'LocalPort', str2double(envHandle.LocalPortEditField.Value));            

    [data.map, ~] = track.createMapFromPic('map/track.png',[2940 6540],1000,0);
    show(data.map, 'Parent', envHandle.Carview);            
    hold(envHandle.Carview,'on'); title(envHandle.Carview,'');
    
    %%%% init Car %%%%
    data.carHandles = car.plotCar([data.plot_x,data.plot_y], deg2rad(0), data.plot_theta,'init',envHandle.Carview);
    [data.IR.Ranges,data.IR.xy,data.IRHandles] = car.IRSensorSim([data.plot_x,data.plot_y,data.plot_theta],data.map,[0, 45, - 45],0.01,0,'init',envHandle.Carview); %Simulate Sensors according to car position

    guidata(envHandle.UIFigure,data);
    envHandle.Carview.Visible = 'on';
    envHandle.UIFigure.Visible = 'on';
    drawnow; 
    time.milliPause(10);  % DRAWNOW 

end

