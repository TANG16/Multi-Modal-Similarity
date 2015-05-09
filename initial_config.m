function [file, pathFile, patchSize] = initial_config()
%% initial_config function will initialize all the variables like file name, path & patch size.
%   Keep this file local and not check in as it has machine specific configurations.

path = strcat(pwd,'/Multi-Modal-Similarity/Dataset/');
%path = strcat(pwd,'\Dataset\');
file = 'T1_01'; % Change the filename to pick corresponding .TIFF file and it will generate its distance matrix as .dat file
ext = '.TIFF';
fname = strcat(file, ext);
pathFile = strcat(path, fname);
patchSize = 16;

end

