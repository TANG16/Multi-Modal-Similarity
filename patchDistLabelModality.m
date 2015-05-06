
% MLMI Project on Multi-Modal-Similarity.

% Steps to extract patches out of each modality image, represent them into Distance matrix, label them and compare with other modality.

% Step 1: Read the grayscale image.

% Step 2: Divide the image into number of patches using blockproc function in Matlab.

% Step 3a: Compare patch by patch using SSD or NCC as distance measures.
% SSD - Make sure to use float as raising integer to power of 2 will go out of range.
% NCC - Use normxcorr2 function in Matlab.

% Step 3b: Plot the patch by patch co-relations on a Distance Matrix.

% Step 4: Compute the clustering according to the idea proposed in the paper using the Distance matrix computed above.

% Step 5: Label the patches in the same modality using the cluster centroids.

% Step 6: Repeat the above four steps for all Modality images.

