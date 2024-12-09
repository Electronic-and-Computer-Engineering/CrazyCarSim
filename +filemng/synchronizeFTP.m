function [] = synchronizeFTP(target, struct_ftp, flag)

%%% Inputs:     target  == target directory
%               ftp     == ftp-server settings       
%               flag    == additional flag for different sync types
%
%%% Output:     combined value

if ~exist('flag','var')
   flag = 'default'; 
end

%% Create DataFolder --> They wont be created if the folder does exist
for statIdx = 1:length(target.stationCode)
    filemng.existMkdir(fullfile('StationData',target.stationCode{statIdx}));
end

%% Create FP Connection
ftp_targetobject = ftp(struct_ftp.server, struct_ftp.username, struct_ftp.password);
ftp_bin_files    = filemng.dirlist(ftp_targetobject,'*.bin','ftp');

%% Search for File Idx using Sation Codes

for mm_idx = 1:length(target.stationCode)
    
    fprintf('\n ==== Copying Data from Station %d ---> (perc) ', mm_idx);
    fileIdxC = strfind(ftp_bin_files,[target.stationCode{mm_idx},'_']);
    
    for k = 1:length(fileIdxC)    
        if isempty(fileIdxC{k})
            fileIdxC{k} = 0;
        end
    end
    
    fileIdx = find(cell2mat(fileIdxC) == 1);
    
    copyIdx = 1;
    while(copyIdx <= length(fileIdx))
        perc = (100 / length(fileIdx))*copyIdx;        
        displayFunc.dispCmdLine_PercProgress(perc,10);
        if ~isfile(fullfile('StationData',target.stationCode{mm_idx},ftp_bin_files{fileIdx(copyIdx)}))
            mget(ftp_targetobject,ftp_bin_files{fileIdx(copyIdx)},fullfile('StationData',target.stationCode{mm_idx}));
        end
        copyIdx = copyIdx + 1;
    end
end





end

