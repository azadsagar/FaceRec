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

% Last Modified by GUIDE v2.5 11-Feb-2015 10:39:04

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
[fileName pathName] = uigetfile('*.jpg;*.png;*.bmp','Select File to Open');


% --- Executes on button press in pbtnCapture.
function pbtnCapture_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnCapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
