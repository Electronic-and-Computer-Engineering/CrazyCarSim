function [vel_out, carData] = motor_model(V_in,vel_in ,step_s)

lutExist = isfile('+car/lut_motor.mat');
if isfile('+car/lut_motor.mat')
    load('+car/lut_motor.mat');
%%% find nearest value in lut %%%%
    [~,v_idx] = (min(abs(lut_vToN(:,1) - V_in)));
    vel_v = lut_vToN(v_idx,2);   
    if (abs(V_in) < 1.11)
        V = 0;
        n_v = 0;
    else
        V = V_in;
        n_v = vel_v / 0.11;
    end
else
    V = V_in;
end
%%% Motor Data %%%%
R_m = 0.55; % Ohm
k_m = 0.002753408439503;
carData.n_l = (vel_in / 0.11);
%%%%%%%%%%%%%%%%%%%%
%%%%% Car Data %%%%%
%%%%%%%%%%%%%%%%%%%%
carData.m_cc = 0.6;
carData.c_r = 0.05851;
carData.A = 0.0084;
carData.c_alpha = 0.44;
carData.air_dens = 1.2041; 
carData.gear_ratio = 5.2727;
carData.r_wheel = 18 / 1000;
carData.r_wheel_dyn = carData.r_wheel * 0.98;
%%%%%%%%%%%%%%%%%%%%%
%%% Engine Torque %%%
%%%%%%%%%%%%%%%%%%%%%

T_e = ((V - carData.n_l * k_m * carData.gear_ratio)/R_m)*k_m;
F_eng = (T_e * carData.gear_ratio) / (4*carData.r_wheel_dyn);

if lutExist
    if (V_in == 0)
        Fr_cc = carData.m_cc * 9.81 * carData.c_r;
    elseif (V_in > 0)
        if (carData.n_l >= 0) 
            if (carData.n_l <= n_v * 1.0125)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r;
            elseif (carData.n_l > n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r * 4;
            end
        elseif (carData.n_l < 0)
            if (carData.n_l <= n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r * 4;
            elseif (carData.n_l > n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r;
            end
        end
    elseif (V_in < 0)  
        if (carData.n_l <= 0) 
            if (carData.n_l >= n_v * 1.0125)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r;
            elseif (carData.n_l < n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r * 4;
            end
        elseif (carData.n_l > 0)
            if (carData.n_l >= n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r * 4;
            elseif (carData.n_l < n_v)
                Fr_cc = carData.m_cc * 9.81 * carData.c_r;
            end
        end
    end
else
    Fr_cc = carData.m_cc * 9.81 * carData.c_r;
end
Fa_cc = (carData.air_dens * carData.A * carData.c_alpha * vel_in^2)/2;

b = (Fr_cc + Fa_cc);       % Ns / m

vel_out = vel_in + (-b/carData.m_cc) * step_s * vel_in + (F_eng / carData.m_cc) * step_s;

end
