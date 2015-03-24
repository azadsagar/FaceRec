function varargout = guifacedetails(varargin)
% GUIFACEDETAILS MATLAB code for guifacedetails.fig
%      GUIFACEDETAILS, by itself, creates a new GUIFACEDETAILS or raises the existing
%      singleton*.
%
%      H = GUIFACEDETAILS returns the handle to a new GUIFACEDETAILS or the handle to
%      the existing singleton*.
%
%      GUIFACEDETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFACEDETAILS.M with the given input arguments.
%
%      GUIFACEDETAILS('Property','Value',...) creates a new GUIFACEDETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guifacedetails_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guifacedetails_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guifacedetails

% Last Modified by GUIDE v2.5 25-Mar-2015 01:54:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guifacedetails_OpeningFcn, ...
                   'gui_OutputFcn',  @guifacedetails_OutputFcn, ...
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


% --- Executes just before guifacedetails is made visible.
function guifacedetails_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guifacedetails (see VARARGIN)

% Choose default command line output for guifacedetails
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guifacedetails wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guifacedetails_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
