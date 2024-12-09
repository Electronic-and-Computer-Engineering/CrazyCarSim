function data = crashDetect(data)

% data is a vector including [x, y, theta]
% angles vector including angles of sensors

crash = getOccupancy(data.map,data.carHandles.Back.Shape.Vertices);
front = [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0];
back = [1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1];
%% car edge coordinates %%%
%%% Measured Force Data %%%
% s = 2.1   [m]
% t = 0.73  [s] data.plot_x,data.plot_y,data.plot_theta,data.vel

if any(crash.*front') %Front
    
    data.crashFlag = 1;
    s = 2.1; t = 0.7;
    v = s / t; s_imp = 0.15;
    gamma = s_imp / v;
    s_imp = data.vel * gamma;
    
    data.plot_x = data.plot_x - s_imp * cos(data.plot_theta);
    data.plot_y = data.plot_y - s_imp * sin(data.plot_theta); 
    data.vel = 0;   

elseif any(crash.*back') %BACK
    
    data.crashFlag = 1;
    s = 2.1; t = 0.7;
    v = s / t; s_imp = 0.15;
    gamma = s_imp / v;
    s_imp = data.vel * gamma;
    
    data.plot_x = data.plot_x + s_imp * cos(data.plot_theta);
    data.plot_y = data.plot_y + s_imp * sin(data.plot_theta); 
    data.vel = 0;
    
else
    data.crashFlag = 0;
    %msg = 'All Clear';
end

end



