function milliPause(time)
%   MILLIPAUSE(X) pauses for X milliseconds.
%
%   Example of use:
%       %Pause for 100 milliseconds
%       milliPause(100); 
%
    t = time/1000;
    tic;
    while toc < t
    end
end
