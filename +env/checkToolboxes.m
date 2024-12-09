function checkToolboxes()

%%%%%% 
load('+env/toolboxes.mat');
V = ver;
VName = {V.Name};
flagVector = zeros(1,length(toolboxes));
for mm = 1:length(toolboxes)
    if any(strcmp(VName, toolboxes{mm}))
        flagVector(mm) = 1;
    end    
end

flagVector = ~(flagVector);
needed_tb = toolboxes(flagVector);

if (max(flagVector) == 1)
   msg = sprintf('!!! YOU NEED TO INSTALL FOLLOWING TOOLBOXES:\n\n'); 
   for mm = 1:length(needed_tb)
       msg = sprintf([msg, needed_tb{mm},'\n']); 
   end
   error(msg);
end