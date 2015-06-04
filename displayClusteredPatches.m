function sortedClusterPatches = displayClusteredPatches(clusterPatch, noOfPatches)
%% Map the patches to its clusters and display it.

%load('clusteredPatches.mat');
totalPatches = size(clusterPatch,1);
patchSize = sqrt(noOfPatches);

Image  = [];
sortedClusterPatches = sortrows(clusterPatch,1);

% uniqueClusters = unique(sortedClusterPatches(:,2));
% totalClusters = size(uniqueClusters,2);

for k = 1:totalPatches
    clusterNo = sortedClusterPatches(k,2);
    subPatch = ones(patchSize,patchSize);
    clusteredImage = clusterNo * subPatch;
    Image = [Image ,clusteredImage];
end
Image = reshape(Image,[patchSize*sqrt(totalPatches),patchSize*sqrt(totalPatches)]);

%% Plot the points belonging to each cluster with different colours.
figure;
imagesc(Image);

end

