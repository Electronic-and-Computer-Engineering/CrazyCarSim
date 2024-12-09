%% This function should gather Varagin names and the variable

function gathVar = getVarargin(input)

    warning off backtrace
    numOfArgs = length(input);
    gathVar = [];
    
    if isstruct(input{1})
        gathVar = input{1};
        return;
    elseif mod(numOfArgs,2)
       numOfArgs = numOfArgs - 1;
       if (numOfArgs == 0)
           warning(['(getVarargin)"',input{1},'" is ignored due to missing value"']);
           warning on backtrace
           return;
       else
           warning(['(getVarargin)"',input{numOfArgs+1},'" is ignored due to missing value"']);
       end
    elseif numOfArgs
       for idxArg = 1:2:numOfArgs
            gathVar = setfield(gathVar,input{idxArg},input{idxArg+1});
       end    
       warning on backtrace
       return;
    end    
end