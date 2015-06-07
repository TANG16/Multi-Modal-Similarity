function reducedImage = reduceBoundingBox(Image)
%REDUCEBOUNDINGBOX 
%Image = imread('E:\TUM\Courses\Summer Semester 2015\Machine Learning in Medical Imaging\Project\Multi-Modal-Similarity\Dataset\T1_01.TIFF');
%imshow(Image);

row = size(Image,1);
col = size(Image,2);

getRows = find(sum(Image,2)>0);
newRowStart = min(getRows);
newRowEnd = max(getRows);

getCols = find(sum(Image,1)>0);
newColStart = min(getCols);
newColEnd = max(getCols);

reducedImage = Image(newRowStart:newRowEnd,newColStart:newColEnd);

%figure, imshow(reducedImage, []);

end