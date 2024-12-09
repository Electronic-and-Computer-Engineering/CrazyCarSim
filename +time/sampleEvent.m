function [data, Tcond] = sampleEvent(SenType, data, timeInfo)
%
%
if(isfield(data,SenType))
   SenInfo = getfield(data,Sentype); 
   getSen = 1;
else
   warning(['The sensor type ', SenType, 'is not available and thus is NOT considered!']);
   getSen = 0;
end

if getSen
    sampleTime = 1/SenInfo.sampleFrequ;

    if(timeInfo.elapsedTime >= timeInfo.maxProcTime)   
        Tcond = 1;
    elseif (toc(SenInfo.elapsedTime) >= SenInfo.sampleTime)
        data = feval(func_handle,inputs); 
        Tcond = 2;
    else
        Tcond = 0;
    end
end

end

