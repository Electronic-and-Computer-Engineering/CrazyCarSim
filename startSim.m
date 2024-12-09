%% Start CC-Simulation
close all force;
clear all;
clc;

%%%% Check Toolboxes %%%
env.checkToolboxes();
%%%%%%%%%%%%%%%%%%%%%%  
% Load Interface
environmentHandle = env.initCCHandleEnv();
% MEX C Files
mexSuppport.runMex;
% Set StartupConditions
env.startup(environmentHandle);
% save('SimGUI.mat','environmentHandle');
% Run Process
env.run_proc(environmentHandle);
