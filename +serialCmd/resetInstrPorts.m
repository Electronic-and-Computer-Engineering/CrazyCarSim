function resetInstrPorts

 instrPorts = instrfind;

for i = 1:length(instrPorts)
    
    fclose(instrPorts(i))
    delete(instrPorts(i))
    
end

