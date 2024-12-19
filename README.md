# CrazyCar-Simulator 0.9a
==========================

### Instructions for Porting Your Algorithm to the Simulator as C-Code

1.  **Install a C-Compiler in MATLAB**
    
    *   Open MATLAB and go to the "Add-Ons" menu.
    *   Search for and install the **MinGW64** Add-On.'Instrument Control Toolbox' 'Lidar Toolbox' 'Navigation Toolbox' 'Robotics System Toolbox' 'ROS Toolbox'
        
2.  **Configure the Compiler**
    
    *   Open the MATLAB Command Window.  
    *   arduinoCode kopierenmex -setup C        
    *   This sets up MinGW as the default C-compiler.       
    *   For Mac users, ensure you have installed the **XCode Command Line Tools** or appropriate XCode support.
        
3.  **Understand the Role of mex**
    
    *   The mex command compiles C-code into a MATLAB function.        
    *   Place your C-files in the folder called +algorithm.
        
4.  **Note:** The simulator does not execute in real-time but simulates with time steps.
    
    *   bashCode kopieren +algorithm/mex\_main.c **Do not modify this file.**        
    *   bashCode kopieren +algorithm/c\_files/algo.c In this file, you will receive the following inputs:
        
        *   Sensor data (in millimeters),            
        *   The number of ticks,            
        *   The frequency of the algorithm (or simulator).
            
5.  **Static Values**
    
    *   Any global static values in your code will persist until you press the **RESET** button in the simulator.
        
6.  **Start the Simulator**
    
    *   Code kopierenstartSim.m
        
7.  **Check Required Toolboxes**
    
    *   scssCode kopierenenv.checkToolboxes();        
    *   If any toolbox is missing, it will be listed in the MATLAB Command Window. Use the "Add-Ons" menu to install missing toolboxes.
        

**Note:** There is no debugger for MEX files, so you must debug issues manually by reviewing the errors shown during compilation.

1.  Use the function mexSuppport.runMex to compile all C-modules in the +algorithm folder into MATLAB functions.    
2.  If there are errors in your C-code, they will be displayed in the MATLAB Command Window during the build process.
    

### What is Simulated?

*   DC motor engine    
*   Steering Servo    
*   Body of the car    
*   Tyres    
*   Infrared-Sensors (IR)    
*   Crash detection    
*   LAP-Time    
*   UDP Connection → Control the simulator via IP
