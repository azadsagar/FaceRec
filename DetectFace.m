%function detects face in a given image and return box cordinate (2x2
%matrix)

function faceImg=DetectFace(img)

faceDetector=vision.CascadeObjectDetector();
bbox=step(faceDetector,img);
faceImg=imcrop(img,bbox);

end
