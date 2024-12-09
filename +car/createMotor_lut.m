clear all
%close all

vel_in = 0;
n_l_old = 0;
V = -4.44;
time_s = linspace(0,18,900);
step_s = time_s(2) - time_s(1);

volToN = linspace(-4.44,4.44,800);
lut_vToN = zeros(800,2);

% for idxV = 1:1:length(volToN)
%     V = volToN(idxV);
%     vel_in = 0;
%     for mm = 1:1:length(time_s)       
%        vel_out(mm) = car.motor_model(V,vel_in,step_s);
%        vel_in = vel_out(mm);
%     end    
%     lut_vToN(idxV,:) = [volToN(idxV), vel_out(end)];   
% end
% save('lut_motor.mat','lut_vToN');
% clear lut_vToN volToN

if 1  
   for mm = 1:1:length(time_s)       
       vel_out(mm) = car.motor_model(V,vel_in,step_s);
       vel_in = vel_out(mm);
   end
   V = 4.44;
   for mm = length(time_s)/2:1:length(time_s)       
       vel_out(mm) = car.motor_model(V,vel_in,step_s);
       vel_in = vel_out(mm);
   end
   figure(1)
   plot(time_s, vel_out);
   ylabel('Velocity (m/s)','FontSize',12);
   xlabel('Time (s)','FontSize',12);
   grid minor
   hold on
end