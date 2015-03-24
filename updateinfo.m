function varargout = updateinfo(varargin)
% UPDATEINFO MATLAB code for updateinfo.fig
%      UPDATEINFO, by itself, creates a new UPDATEINFO or raises the existing
%      singleton*.
%
%      H = UPDATEINFO returns the handle to a new UPDATEINFO or the handle to
%      the existing singleton*.
%
%      UPDATEINFO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPDATEINFO.M with the given input arguments.
%
%      UPDATEINFO('Property','Value',...) creates a new UPDATEINFO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before updateinfo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to updateinfo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help updateinfo

% Last Modified by GUIDE v2.5 25-Mar-2015 01:56:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @updateinfo_OpeningFcn, ...
                   'gui_OutputFcn',  @updateinfo_OutputFcn, ...
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


% --- Executes just before updateinfo is made visible.
function updateinfo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to updateinfo (see VARARGIN)

% Choose default command line output for updateinfo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes updateinfo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = updateinfo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pbPrev.
function pbPrev_Callback(hObject, eventdata, handles)
% hObject    handle to pbPrev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateFaceImg(handles,handles.currentFace-1,hObject);

% --- Executes on button press in pbNext.
function pbNext_Callback(hObject, eventdata, handles)
% hObject    handle to pbNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateFaceImg(handles,handles.currentFace+1,hObject);



function txtClass_Callback(hObject, eventdata, handles)
% hObject    handle to txtClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtClass as text
%        str2double(get(hObject,'String')) returns contents of txtClass as a double


% --- Executes during object creation, after setting all properties.
function txtClass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtRoll_Callback(hObject, eventdata, handles)
% hObject    handle to txtRoll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRoll as text
%        str2double(get(hObject,'String')) returns contents of txtRoll as a double


% --- Executes during object creation, after setting all properties.
function txtRoll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRoll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSection_Callback(hObject, eventdata, handles)
% hObject    handle to txtSection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSection as text
%        str2double(get(hObject,'String')) returns contents of txtSection as a double


% --- Executes during object creation, after setting all properties.
function txtSection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtFullName_Callback(hObject, eventdata, handles)
% hObject    handle to txtFullName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFullName as text
%        str2double(get(hObject,'String')) returns contents of txtFullName as a double


% --- Executes during object creation, after setting all properties.
function txtFullName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFullName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pbUpdateData.
function pbUpdateData_Callback(hObject, eventdata, handles)
% hObject    handle to pbUpdateData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%validate fields
rollno=str2num(get(handles.txtRoll,'String'));
xclass=str2num(get(handles.txtClass,'String'));
section=strtrim(upper(get(handles.txtSection,'String')));
branch=getCurrentPopupString(handles.lstBranch);
name=strtrim(upper(get(handles.txtFullName,'String')));


if rollno==0
    msgbox('Please correct Roll No','Error');
    return;
end

if xclass==0
    msgbox('Invalid entry for Class','Error');
    return;
end

if mod(rollno,1)~=0 || mod(xclass,1)~=0
    msgbox('Expecting integer value for roll number and class','Error');
    return;
end

if size(section)==0
    msgbox('Invalid entry for Section','Error');
    return;
end

if size(name)==0
    msgbox('Invalid entry for Name','Error');
    return;
end

dirfiles=dir('facedb\*.jpg');
[maxFiles dummy]=size(dirfiles);
filename=strcat('facedb\',num2str(maxFiles+1));
filename=strcat(filename,'.jpg');

imgfile=strcat(num2str(maxFiles+1),'.jpg');
set(handles.pbUpdateData,'Enable','off');

user.rollno=rollno;
user.class=xclass;
user.section=section;
user.branch=branch;
user.name=name;    

load userdb;

if get(handles.chkNewEntry,'Value')==0
    [dummy maxFiles]=size(handles.user.facefiles);
    facefiles=handles.user.facefiles;
    facefiles{maxFiles+1}=imgfile;
    user.facefiles=facefiles;
    userdb(handles.recordid)=user;
    
else
    facefiles{1}=imgfile;
    user.facefiles=facefiles;
    userdb=[userdb user]; %database updated;
    
end

save('userdb','userdb'); %write to database
global sendImg;
imwrite(sendImg,filename);
%filename
updateMasterDB('facedb',sendImg);
load('facedb\facediff');
computeEigenFaces(facediff);
msgbox('Database successfully updated','Done !');

%user


% --- Executes on button press in pbCancel.


% --- Executes on selection change in lstBranch.
function lstBranch_Callback(hObject, eventdata, handles)
% hObject    handle to lstBranch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lstBranch contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lstBranch


% --- Executes during object creation, after setting all properties.
function lstBranch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lstBranch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pbGetDetails.
function pbGetDetails_Callback(hObject, eventdata, handles)
% hObject    handle to pbGetDetails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rollno=str2num(get(handles.txtRoll,'String'));
xclass=str2num(get(handles.txtClass,'String'));
section=strtrim(upper(get(handles.txtSection,'String')));
branch=getCurrentPopupString(handles.lstBranch);

if rollno==0
    msgbox('Please correct Roll No','Error');
    return;
end

if xclass==0
    msgbox('Invalid entry for Class','Error');
    return;
end

if mod(rollno,1)~=0 || mod(xclass,1)~=0
    msgbox('Expecting integer value for roll number and class','Error');
    return;
end

if size(section)==0
    msgbox('Invalid entry for Section','Error');
    return;
end

found=0;
load userdb;
[dummy maxRecords]=size(userdb);
for i=1:maxRecords
    if userdb(i).rollno==rollno && userdb(i).class==xclass && userdb(i).section==section && strcmp(userdb(i).branch,branch)==1
        found=1;
        user=userdb(i);
        break;
    end
end

if found==1
    %user
    handles.recordid=i;
    handles.user=user;
    
    set(handles.txtFullName,'String',user.name);
    [dummy handles.maxFaces]=size(user.facefiles);
    handles.faces=cell(handles.maxFaces+1,1); %allocate cell space
    
    global sendImg;
    handles.faces{1}=sendImg;
    
    for i=1:handles.maxFaces
        filename=strcat('facedb\',cell2mat(user.facefiles(i)));
        handles.faces{i+1}=imread(filename);
    end
    
    handles.currentFace=1;
    set(handles.pbNext,'Enable','on');

    
%     list=get(handles.lstBranch,'String');
%     listSize=size(list);
%     
%     for i=1:listSize
%         if strcmp(list{i},user.branch)==1
%             set(handles.lstBranch,'Value',i);
%             break;
%         end
%     end
    
    guidata(hObject,handles);
else
    msgbox('Record Not found','Error');
end



function str = getCurrentPopupString(hh)
%# getCurrentPopupString returns the currently selected string in the popupmenu with handle hh

%# could test input here
if ~ishandle(hh) || strcmp(get(hh,'Type'),'popupmenu')
error('getCurrentPopupString needs a handle to a popupmenu as input')
end

%# get the string - do it the readable way
list = get(hh,'String');
val = get(hh,'Value');
if iscell(list)
   str = list{val};
else
   str = list(val,:);
end


% --- Executes on button press in chkNewEntry.
function chkNewEntry_Callback(hObject, eventdata, handles)
% hObject    handle to chkNewEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkNewEntry
if get(handles.chkNewEntry,'Value')==0
    set(handles.pbGetDetails,'Enable','on');
else
    set(handles.pbGetDetails,'Enable','off');
end

function updateFaceImg(handles,faceIndex,hObject)
    
    imshow(handles.faces{faceIndex},'Parent',handles.faceImg);
    handles.currentFace=faceIndex;
    guidata(hObject,handles);
    
    if faceIndex<handles.maxFaces+1
        set(handles.pbNext,'Enable','on');
    else
        set(handles.pbNext,'Enable','off');
    end
    
    if faceIndex>1
        set(handles.pbPrev,'Enable','on')
    else
        set(handles.pbPrev,'Enable','off')
    end
