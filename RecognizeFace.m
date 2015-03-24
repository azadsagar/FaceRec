function [ faceIndex ] = RecognizeFace ( img,facemean,ProjectedFaces,Eigenfaces)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if size(img,3)~=1
    img=img(:,:,1);
end

[row col]=size(img);

if row~=200 || col~=200
    img=imresize(img,[200 200]);
    row=200;
    col=200;
end

img=reshape(img',row*col,1);

diff=double(img)-facemean;

ProjectedTestFace = Eigenfaces'*diff; %projected face of test img

%EuclideanDistance

EuclideanDistance = [];
for i = 1 : size(Eigenfaces,2)
    q = ProjectedFaces(:,i);
    temp = ( norm( ProjectedTestFace - q ) )^2;
    EuclideanDistance = [EuclideanDistance temp];
end

[minEucDist , faceIndex] = min(EuclideanDistance);

end