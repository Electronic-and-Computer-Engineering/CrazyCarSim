function carHandles = plotCar(pos, steerAng, carAngle, event, EventHandle)

scale_car = 0.01; %in cm
car_l = 22*scale_car / 2;  %22
car_w = 10.5*scale_car / 2; %10.5
car_x_step = 2*scale_car;
carAngle_deg = carAngle * (180 / pi);
steerAng_deg = steerAng * (180 / pi);

%%% TYPE: APOLLO CAR %%%
car_x_vals = [-car_l:car_x_step:car_l,car_l:-car_x_step:-car_l]+pos(1);
car_y_vals = [[1,0.9,1,1,1,0.85,0.85,0.85,1,1,1,0.8].*car_w,[0.8,1,1,1,0.85,0.85,0.85,1,1,1,0.9,1].*-car_w]+pos(2);
%%%
carGraph = polyshape(car_x_vals,car_y_vals,'Simplify',false);
%carDecal_One = polyshape([-car_l,car_l,car_l,-car_l],[2,2,-2,-2].*scale_car+pos(2),'Simplify',false);
%%%%%%

tyres_width = 5*scale_car / 2;
tyres_thick = 1.5*scale_car / 2;
f_tyres_dist = 1.5*scale_car;
r_tyres_dist = 3.5*scale_car;

tyre_pos = [[car_l-f_tyres_dist-tyres_width, car_l-f_tyres_dist-tyres_width, -car_l+r_tyres_dist+tyres_width, -car_l+r_tyres_dist+tyres_width]+pos(1);[car_w-tyres_thick, tyres_thick-car_w, car_w-tyres_thick, tyres_thick-car_w]+pos(2)];

tyre_LF = polyshape([-tyres_width tyres_width tyres_width -tyres_width]+tyre_pos(1,1),[-tyres_thick -tyres_thick tyres_thick tyres_thick]+tyre_pos(2,1),'Simplify',false);
tyre_RF = polyshape([-tyres_width tyres_width tyres_width -tyres_width]+tyre_pos(1,2),[-tyres_thick -tyres_thick tyres_thick tyres_thick]+tyre_pos(2,2),'Simplify',false);
tyre_LR = polyshape([-tyres_width tyres_width tyres_width -tyres_width]+tyre_pos(1,3),[-tyres_thick -tyres_thick tyres_thick tyres_thick]+tyre_pos(2,3),'Simplify',false);
tyre_RR = polyshape([-tyres_width tyres_width tyres_width -tyres_width]+tyre_pos(1,4),[-tyres_thick -tyres_thick tyres_thick tyres_thick]+tyre_pos(2,4),'Simplify',false);

tyre_LF = rotate(tyre_LF,steerAng_deg, [tyre_pos(1,1) tyre_pos(2,1)]);
tyre_RF = rotate(tyre_RF,steerAng_deg, [tyre_pos(1,2) tyre_pos(2,2)]);

% 
carGraph = rotate(carGraph,carAngle_deg,pos);
tyre_LF = rotate(tyre_LF,carAngle_deg,pos);
tyre_RF = rotate(tyre_RF,carAngle_deg,pos);
tyre_LR = rotate(tyre_LR,carAngle_deg,pos);
tyre_RR = rotate(tyre_RR,carAngle_deg,pos);

if strcmp(event, 'init')
    carHandles.Tyres = plot([tyre_LF tyre_RF tyre_LR tyre_RR],'Parent',EventHandle,'FaceColor','k','FaceAlpha',1);
    carHandles.Back = plot(carGraph,'Parent',EventHandle,'FaceColor',[0.8 0.8 0.8],'FaceAlpha',0.75);
    %carHandles.Trace = plot(pos(1),pos(2),'Parent',EventHandle,'LineStyle','--');
    %carHandles.Decal = plot(carDecal_One,'Parent',EventHandle,'FaceColor',[0.14 0.6 0.6],'FaceAlpha',0.25);
else
    EventHandle.Tyres(1).Shape.Vertices = tyre_LF.Vertices;
    EventHandle.Tyres(2).Shape.Vertices = tyre_RF.Vertices;
    EventHandle.Tyres(3).Shape.Vertices = tyre_LR.Vertices;
    EventHandle.Tyres(4).Shape.Vertices = tyre_RR.Vertices;
    EventHandle.Back.Shape.Vertices = carGraph.Vertices;
    %EventHandle.Trace.XData = [EventHandle.Trace.XData, pos(1)];
    %EventHandle.Trace.YData = [EventHandle.Trace.YData, pos(2)];
    %carHandles.Decal.Shape.Vertices = carDecal_One.Vertices;
end 
    
end

