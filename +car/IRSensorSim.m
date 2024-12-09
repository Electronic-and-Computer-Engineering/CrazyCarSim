function [ranges,xy,IRHandles] = IRSensorSim(data,map,angles,resolution,noiseInM, event, EventHandle)

% data is a vector including [x, y, theta]
% angles vector including angles of sensors

maxSight = [1.5, 0.8, 0.8]; %m 
ranges = zeros(1,length(angles));
IRpoints = zeros(length(angles),2);
SenRange = {0:resolution:maxSight(1);...
            0:resolution:maxSight(2);...
            0:resolution:maxSight(3)};
    for sensor = 1:length(angles)
            xy = zeros(2,length(SenRange{sensor}));
            [xy(1,:),xy(2,:)] = track.rotation(SenRange{sensor},0,-(angles(sensor))*pi/180-data(3));
            xy(1,:) = xy(1,:) + data(1);
            xy(2,:) = xy(2,:) + data(2);

            occval = getOccupancy(map,xy(:,:)');
            occpos = find(occval,1, 'first');
            if occpos ~= 0
                rang = SenRange{sensor};
                ranges(sensor) = rang(occpos);
                IRpoints(sensor,:) = xy(:,occpos)';
            else
                ranges(sensor) = maxSight(sensor);
                IRpoints(sensor,:) = xy(:,end)';
            end
    end
    
    ranges(1) = ranges(1) + (rand(1)*2*noiseInM - noiseInM);
    ranges(2) = ranges(2) + (rand(1)*2*noiseInM - noiseInM);
    ranges(3) = ranges(3) + (rand(1)*2*noiseInM - noiseInM);   

    if strcmp(event, 'init')
        IRHandles.IRLeft   = plot(IRpoints(1,1),IRpoints(1,2),'o','Parent',EventHandle,'MarkerSize',4,'MarkerEdgeColor','red','MarkerFaceColor','red');
        IRHandles.IRMiddle = plot(IRpoints(2,1),IRpoints(2,2),'o','Parent',EventHandle,'MarkerSize',4,'MarkerEdgeColor','red','MarkerFaceColor','red');
        IRHandles.IRRight  = plot(IRpoints(3,1),IRpoints(3,2),'o','Parent',EventHandle,'MarkerSize',4,'MarkerEdgeColor','red','MarkerFaceColor','red');
    else
        EventHandle.IRLeft.XData    = IRpoints(1,1);
        EventHandle.IRLeft.YData    = IRpoints(1,2);
        EventHandle.IRMiddle.XData  = IRpoints(2,1);
        EventHandle.IRMiddle.YData  = IRpoints(2,2);
        EventHandle.IRRight.XData   = IRpoints(3,1);
        EventHandle.IRRight.YData   = IRpoints(3,2);
    end    

end



