function varargout = master(varargin)
% MASTER MATLAB code for master.fig
%      MASTER, by itself, creates a new MASTER or raises the existing
%      singleton*.
%
%      H = MASTER returns the handle to a new MASTER or the handle to
%      the existing singleton*.
%
%      MASTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MASTER.M with the given input arguments.
%
%      MASTER('Property','Value',...) creates a new MASTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before master_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to master_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help master

% Last Modified by GUIDE v2.5 25-Mar-2015 02:45:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @master_OpeningFcn, ...
                   'gui_OutputFcn',  @master_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before master is made visible.
function master_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to master (see VARARGIN)

% Choose default command line output for master
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes master wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = master_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbtnOpenImg.
function pbtnOpenImg_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnOpenImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fileName
global pathName
global userImage;
global faceImage;
global faces;
global maxFaces;

[fileName pathName] = uigetfile('*.jpg;*.png;*.bmp','Select File to Open');
if isstr(fileName) && isstr(pathName)
    userImage=imread(strcat(pathName,fileName));
    imshow(userImage,'Parent',handles.uiImg1);
    faces=DetectFace(userImage);
    maxFaces=size(faces);
    set(handles.textMaxFaces,'String',maxFaces(1));
    updateGUI(hObject,handles,1);
end
    


% --- Executes on button press in pbtnLiveCam.
function pbtnLiveCam_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnLiveCam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global userImage;
global faceImage;
global faces;
global maxFaces;

btnString=get(handles.pbtnLiveCam,'String');


if strcmp(btnString,'Capture')
    
    set(handles.pbtnLiveCam,'Enable','off');
    userImage=getsnapshot(vid);
    stoppreview(vid);
    imshow(userImage,'Parent',handles.uiImg1);
    faces=DetectFace(userImage);
    maxFaces=size(faces);
    set(handles.textMaxFaces,'String',maxFaces(1));
    
    updateGUI(hObject,handles,1);
    
    set(handles.pbtnLiveCam,'String','Live Cam');
    set(handles.pbtnLiveCam,'Enable','on');
    
    if(maxFaces(1)>1)
        set(handles.pbNext,'Enable','on');
    end
    
else
    
    set(handles.pbtnLiveCam,'Enable','off');
    vid=videoinput('winvideo',1);
    vidRes=get(vid,'VideoResolution');
    nBands=get(vid,'NumberOfBands');
    hImage=image(zeros(vidRes(2),vidRes(1),nBands),'Parent',handles.uiImg1);
    preview(vid,hImage);
    set(handles.pbtnLiveCam,'String','Capture');
    set(handles.pbtnLiveCam,'Enable','on');
    
end


% --- Executes on button press in pbPrevious.
function pbPrevious_Callback(hObject, eventdata, handles)
% hObject    handle to pbPrevious (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global currentFace;
    updateGUI(hObject,handles,currentFace-1);



% --- Executes on button press in pbNext.
function pbNext_Callback(hObject, eventdata, handles)
% hObject    handle to pbNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global currentFace;
    updateGUI(hObject,handles,currentFace+1);
    


% --- Executes on slider movement.
function sliderBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

 if isfield(handles,'lastbval')==0
     handles.lastbval=0;
 end
 
bval=get(hObject,'Value');
global faces;
global currentFace;



if (bval-handles.lastbval)>0
    diff=bval-handles.lastbval;
    diff=diff*10;
    faces{currentFace}=faces{currentFace}+diff;
else
    diff=handles.lastbval-bval;
    diff=diff*10;
    faces{currentFace}=faces{currentFace}-diff;
end
diff
imshow(faces{currentFace},'Parent',handles.axFaceImg);
handles.lastbval=bval;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function sliderBrightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderContrast_Callback(hObject, eventdata, handles)
% hObject    handle to sliderContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
 if isfield(handles,'lastcval')==0
     handles.lastcval=0;
 end
 
cval=get(hObject,'Value');
global faces;
global currentFace;

if (cval-handles.lastcval)>0
    diff=cval-handles.lastcval;
    diff=diff*2;
    faces{currentFace}=faces{currentFace}*diff;
else
    diff=handles.lastcval-cval;
    diff=diff*2;
    faces{currentFace}=uint8(faces{currentFace}/diff);
end
diff
imshow(faces{currentFace},'Parent',handles.axFaceImg);
handles.lastcval=cval;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function sliderContrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pbtnSaveToDB.
function pbtnSaveToDB_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnSaveToDB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global faces;
    global currentFace;
    
    global sendImg;
    sendImg=imresize(rgb2gray(faces{currentFace}),[200 200]);
    
    xHandle=updateinfo;
    %updateinfo('setTarget',xHandle);
    xhwnd=guidata(xHandle);
    imshow(sendImg,'Parent',xhwnd.faceImg);
    
    %getFileName=inputdlg('Enter the name of file');
    
    %if ~isequal(exist('facedb','dir'),7)
        %mkdir facedb;
    %end
    
    %getFileName=strcat(getFileName,'.jpg');
    %getFileName=strcat('facedb\',getFileName);

    %imwrite(imresize(rgb2gray(faces{currentFace}),[200 200]),char(getFileName));
    

function updateGUI(hObject,handles,faceIndex)
    
    global faces;
    global currentFace;
    global maxFaces;
    
    imshow(faces{faceIndex},'Parent',handles.axFaceImg);
    currentFace=faceIndex;
    
    if faceIndex<maxFaces(1)
        set(handles.pbNext,'Enable','on');
    else
        set(handles.pbNext,'Enable','off');
    end
    
    if faceIndex>1
        set(handles.pbPrevious,'Enable','on')
    else
        set(handles.pbPrevious,'Enable','off')
    end
    
    set(handles.sliderBrightness,'Value',0);
    set(handles.sliderContrast,'Value',0);
    handles.lastbval=0;
    handles.lastcval=0;
    guidata(hObject,handles);


% --- Executes on button press in pbRecognize.
function pbRecognize_Callback(hObject, eventdata, handles)
% hObject    handle to pbRecognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global faces;
global maxFaces;

load('facedb\facemean');
load('facedb\ProjectedFaces');
load('facedb\Eigenfaces');


faceindex=[];

for i=1:maxFaces
    faceindex=[faceindex RecognizeFace(faces{i},facemean,ProjectedFaces,Eigenfaces)];
end

% clear facemean;
% clear ProjectedFaces;
% clear EigenFaces;

load('userdb');
showFaceInfo(userdb,faceindex);

%faceindex=RecognizeFace(faces{currentFace},facemean,ProjectedFaces,Eigenfaces);


 clear userdb;
% filename=strcat(num2str(faceindex),'.jpg');
% recordFound=0;
% 
% for i=1:size(userdb,2)
%     facefiles=userdb(i).facefiles;
%     for j=1:size(facefiles,2);
%         if strcmp(filename,facefiles{j})
%             recordid=i;
%             recordFound=1;
%             break;
%         end
%         
%         if recordFound
%             break;
%         end
%     end
% end
% 
% faceindex
% userdb(recordid)

function showFaceInfo(userdb,faceIndex)

global faces;
totalFaces=size(faceIndex,2);

recordsize=size(userdb,2);

xlsdata(1,1)={'Roll No'};
xlsdata(1,2)={'Name'};
xlsdata(1,3)={'Attendance'};

for i=1:recordsize
   facefiles=userdb(i).facefiles;
   faceRecognized=0;
   
   for j=1:size(facefiles,2)
       
       for k=1:totalFaces
           filename=strcat(num2str(faceIndex(k)),'.jpg');
           if strcmp(filename,facefiles{j})
               % ith is the record
               %userdb(i) %sample debug
               handle=guifacedetails;
               handle=guidata(handle);
               imshow(faces{k},'Parent',handle.userFace);
               imshow(imread(strcat('facedb\',filename)),'Parent',handle.matchedFace);
               set(handle.txtRoll,'String',userdb(i).rollno);
               set(handle.txtClass,'String',userdb(i).class);
               set(handle.txtBranch,'String',userdb(i).branch);
               set(handle.txtSection,'String',userdb(i).section);
               set(handle.txtName,'String',userdb(i).name);
               faceRecognized=1;
           end
       end
   end
   
    xlsdata(i+1,1)={userdb(i).rollno};
    xlsdata(i+1,2)={userdb(i).name};
    
    if faceRecognized
        xlsdata(i+1,3)={'P'};
    else
        xlsdata(i+1,3)={'A'};
    end
   
end

xlswrite(strcat(strrep(datestr(clock),':','-'),'.xlsx'),xlsdata);
