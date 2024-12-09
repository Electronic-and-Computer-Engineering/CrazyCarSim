%%%% Find all c Files in algorithm and mex them at once
files = dir('+algorithm');
dirFlags = [files.isdir]; % Chekc if DIR or not
dirFlags(1:2) = 0;
subFolders = {files(dirFlags).name};
countFolders = length(subFolders(1,:));

s = {};
cFiles = filemng.dirlist('+algorithm', '*.c');
for i = 1:length(cFiles)
    s = [s,cFiles{i}];
end

for i = 1:countFolders
   cFiles = filemng.dirlist(['+algorithm\',subFolders{1,i}], '*.c');
   if (~isnumeric(cFiles))
        for cIdx = 1:length(cFiles)
             s = [s,cFiles{i}];
        end
   end
end

mex(s{:},'-outdir','+algorithm')