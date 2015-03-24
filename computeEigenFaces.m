function computeEigenFaces(facediff)
% calculate Eigen faces and projected images
% and save them for later use

L=facediff'*facediff; % where L is the surrogate matrix
%facediff x facediff' is very very large since number of pixels is greater
%than training images

%returns diagonal matrix D of eigenvalues and matrix V 
%whose columns are the corresponding right eigenvectors, 
%so that facediff*V = V*D
[V D]=eig(L);
%diagonal elements of D are eigen values for both facediff*facediff' and
%facediff'*facediff

%eliminate and sort the eigen values 

eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        eig_vec = [eig_vec V(:,i)];
    end
end

Eigenfaces = facediff * eig_vec;

%compute the projection of facediff into facespace
ProjectedFaces = [];
for i = 1 : size(Eigenfaces,2);
    temp = Eigenfaces'*facediff(:,i);
    ProjectedFaces = [ProjectedFaces temp]; 
end

save('facedb\Eigenfaces','Eigenfaces');
save('facedb\ProjectedFaces','ProjectedFaces');



end

