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

% Last Modified by GUIDE v2.5 06-Mar-2015 03:32:29

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
    updateGUI(handles,1);
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
    
    updateGUI(handles,1);
    
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
    updateGUI(handles,currentFace-1);



% --- Executes on button press in pbNext.
function pbNext_Callback(hObject, eventdata, handles)
% hObject    handle to pbNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global currentFace;
    updateGUI(handles,currentFace+1);
    


% --- Executes on slider movement.
function sliderBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


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


function updateGUI(handles,faceIndex)
    
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
