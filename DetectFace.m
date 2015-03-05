%function detects face in a given image and return box cordinate (2x2
%matrix)

function faceImg=DetectFace(img)

faceDetector=vision.CascadeObjectDetector();
bbox=step(faceDetector,img);
[maxFaces dummy]=size(bbox);

if maxFaces~=0
    faceImg=cell(maxFaces,1);
    
    for i=1:maxFaces
        for face=1:i
            faceImg{face}=imcrop(img,bbox(face:maxFaces:maxFaces*dummy));
        end
    end
else
    faceImg=[];
end

end
