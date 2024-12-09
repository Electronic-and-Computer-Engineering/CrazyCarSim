function plotCarClear(CarHandles)

    numberOfFields = numel(fieldnames(CarHandles));
    fields = fieldnames(CarHandles);
    
    for clearIdx = 1:numberOfFields      
        set(getfield(CarHandles,fields{clearIdx}),'Visible','off')
        carHandles = rmfield(CarHandles,fields{clearIdx});        
    end

end

