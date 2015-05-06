
% MLMI Project on Multi-Modal-Similarity.

% Steps to extract patches out of each modality image, represent them into Distance matrix, label them and compare with other modality.

% Step 1: Read the grayscale image.

% Step 2: Divide the image into number of patches using blockproc function in Matlab.

% Step 3a: Compare patch by patch using SSD or NCC as distance measures.
% SSD - Make sure to use float as raising integer to power of 2 will go out of range.
% NCC - Use normxcorr2 function in Matlab.

% Step 3b: Plot the patch by patch co-relations on a Distance Matrix.

% Step 4: Compute the clustering according to the idea proposed in the paper using the Distance matrix computed above.
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

%% Above step 4 already implemented in paper in the file cluster_dp.m
% Use it by wrapping a function around it.


% Step 4d: Plot Density as X-Axis and Delta as Y-Axis matrices.
%          Select points with higher density and delta values as cluster centroids.

% Step 5: Label the patches in the same modality using the cluster centroids.

% Step 6: Repeat the above four steps for all Modality images.

