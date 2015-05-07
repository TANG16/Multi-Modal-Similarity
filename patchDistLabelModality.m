
%% MLMI Project on Multi-Modal-Similarity.

% Steps to extract patches out of each modality image, represent them into Distance matrix, label them and compare with other modality.

%% Step 1: Read the grayscale image.

%% Step 2: Divide the image into number of patches using blockproc function in Matlab.
path = strcat(pwd,'\Dataset\');
file = 'T2_03'; % Change the filename to pick corresponding .TIFF file and it will generate its distance matrix as .dat file
ext = '.TIFF';
fname = strcat(file, ext);
pathFile = strcat(path, fname);
patches = ExtractBlocks(pathFile);


%% Step 3a: Compare patch by patch using SSD or NCC as distance measures.
% SSD - Make sure to use float, as raising integer to power of 2 will go out of range.
% NCC - Use Normalized 2-D cross-correlation (normxcorr2) function in Matlab.

matcol = 10;
noOfPatches = size(patches, 1);
distanceMatrix = zeros(noOfPatches,noOfPatches);
for i = 1:noOfPatches
    for j = 1:noOfPatches
        X = patches(i,:);
        %distanceMatrix(i,j) = mean(normxcorr2(patches(i,:),patches(j,:))); % for NCC
        distanceMatrix(i,j) = sum(sum((patches(i)-patches(j))^2)); % for SSD
        distanceMatrix(j,i) = distanceMatrix(i,j);
    end
end


% Step 3b: Plot the patch by patch co-relations on a Distance Matrix.

[rows,cols] = size(distanceMatrix);
totalRows = rows*(cols-1)/2; % Excluding the elements (j,i) for every (i,j) as it is a Symmetric Matrix.
distMatFile = zeros(totalRows,3);
k=1;
for i = 1:rows
   for j = i+1:cols
       distMatFile(k,:) = [i,j,distanceMatrix(i,j)];
       k = k+1;
   end
end

extDat = '.dat';
datfile = strcat(file,extDat);

%save(datfile, 'distMatFile', '-ascii');
dlmwrite(datfile,distMatFile)

%% Step 4: Compute the clustering according to the idea proposed in the paper using the Distance matrix computed above.
% Step 4a: Compute the Density matrix using
%          dc as some cut-off or threshold value.
%          For all points di in one row across all coulmns j of the distance matrix.
%          X(dij - dc)=1 if (dij - dc)<0 and X(dij - dc)=0 if(dij - dc)>0
%          Take the sum which is the density for point i.

% Step 4b: Compute the Delta matrix using
%          Minimum distance between point i and any other point with higher density value.
%          Take all points having density greater than the current point and take the least one out of them.

% Step 4c: Plot Density as X-Axis and Delta as Y-Axis matrices.
%          Select points with higher density and delta values as cluster centroids.


% Step 4d: Plot Density as X-Axis and Delta as Y-Axis matrices.
%          Select points with higher density and delta values as cluster centroids.

% Above Step 4 is already implemented in paper in the file cluster_dp.m
% Use it by wrapping a function around it.

%output = cluster_dp_func(distanceMatrix);
cluster_dp;

x=5;

%% Step 5: Label the patches in the same modality using the cluster centroids.


%% Step 6: Repeat the above four steps for all Modality images.

