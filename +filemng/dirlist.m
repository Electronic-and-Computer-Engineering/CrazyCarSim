function namelist = dirlist(path,suffix,flagging)
%
%Created 29-03-2014 Mayer Florian BSc. Austria, Dobl
%
%dirlist function should produce a search for files with necessary suffix
%the default suffix is '*.wav'
%
%Input: path: inputpath were the files should be located
%     suffix: ending of the variable you are searching for DEFAULT: '*.wav'
%
%Output: namelist: list of the content of the folder

if ischar(path)
    if ~exist('suffix')   
       suffix = '*.wav';
    end
    files = dir(fullfile(path,suffix));
    minDirRes = 1;
else
    files = dir(path);
    minDirRes = 3;
end

if ~exist('flagging')   
       flagging = '';
end

determined = length(files);
if determined < minDirRes
    namelist = -1; 
else
    if strcmp(flagging,'ftp')
        for marshaller = 1:determined    
            namelist{marshaller,1} = files(marshaller).name;    
        end 
    else
        for marshaller = minDirRes:determined    
            namelist{marshaller,1} = fullfile(path,files(marshaller).name);    
        end 
    end
    
end

