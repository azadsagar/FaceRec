function updateMasterDB(faceDirPath,img)
%   convert faces to 1D vector and arrange them in columns.
%   each column of facedb matrix represt a face
%   calculate the face mean
%   calculate diffrence from face mean
%   save the matrices for later use

    dirFiles=dir(strcat(faceDirPath,'\facedb.mat'));
    [maxFiles dummy]=size(dirFiles);

    if maxFiles~=0
        load(strcat(faceDirPath,'\facedb'));
        [row col]=size(img);
        temp=reshape(img',row*col,1); % convert to 1D img vector
        facedb=[facedb temp]; %append column
    else
        %build the database
        facedb=[];
        dirFiles=dir(strcat(faceDirPath,'\*.jpg'));

        [maxFiles dummy]=size(dirFiles);
		tmp=img;

        if maxFiles~=0
           for i=1:maxFiles
               
			   if i==maxFiles
				img=tmp;
			   else
			   
			   imgFile=strcat(faceDirPath,'\');
               imgFile=strcat(imgFile,num2str(i));
               imgFile=strcat(imgFile,'.jpg');
               img=imread(imgFile);
               end
               
               [row col z]=size(img);
               if z~=1
                   img=rgb2gray(img); %convert to grayscale image if its not
               end

               if ~(row==200 && col==200)
                   img=imresize(img,[200 200]); %resize the image to 200x200
               end

               %convert to 1D image vector from 2D imgage vector
               temp=reshape(img',row*col,1);

               facedb=[facedb temp];
           end

        else
            msgbox('Training Files Not Found','Error');
        end
    end
    
    %now compute the mean
    facemean=mean(facedb,2);
    
    %compute the difference of image
    facediff=[];
    maxFaces=size(facedb,2);
    
    for i=1:maxFaces
        temp=double(facedb(:,i))-facemean; %subtract mean from each column
        facediff=[facediff temp];
    end
    
    %save everything
    save('facedb\facedb','facedb');
    save('facedb\facemean','facemean');
    save('facedb\facediff','facediff');
    
end