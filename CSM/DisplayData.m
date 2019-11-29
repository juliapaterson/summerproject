function varargout = DisplayData(varargin)
% DISPLAYDATA M-file for DisplayData.fig
%      DISPLAYDATA, by itself, creates a new DISPLAYDATA or raises the existing
%      singleton*.
%
%      H = DISPLAYDATA returns the handle to a new DISPLAYDATA or the handle to
%      the existing singleton*.
%
%      DISPLAYDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISPLAYDATA.M with the given input arguments.
%
%      DISPLAYDATA('Property','Value',...) creates a new DISPLAYDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DisplayData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DisplayData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DisplayData

% Last Modified by GUIDE v2.5 11-Apr-2011 10:49:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DisplayData_OpeningFcn, ...
                   'gui_OutputFcn',  @DisplayData_OutputFcn, ...
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


% --- Executes just before DisplayData is made visible.
function DisplayData_OpeningFcn(hObject, eventdata, handles, n, DisplayDataFH, data)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DisplayData (see VARARGIN)

% Choose default command line output for DisplayData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DisplayData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
h = handles.text2;
str1 = 'of ';
str2 = num2str(n);
string = [str1 str2];
set(h,'String',string);
h = handles.edit1;
set(h,'String','1');

handles.Max = n;
handles.FigureHandle = DisplayDataFH;
handles.data = data;
guidata(hObject,handles);

% --- Outputs from this function are returned to the command line.
function varargout = DisplayData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a
%        double

data = handles.data;
figure(handles.FigureHandle);
currentline = str2double(get(handles.edit1,'String'));
if currentline < handles.Max +1 && currentline > 0
    plot(data(currentline,:))  
else
    beep
    set(handles.edit1,'String',num2str(1));
end

figure(handles.figure1);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%next
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = handles.data;
figure(handles.FigureHandle);
currentline = str2double(get(handles.edit1,'String'));
if currentline ~= handles.Max
    plot(data(currentline+1,:))
    set(handles.edit1,'String',num2str(currentline+1));
else
    beep
end

figure(handles.figure1);

% --- Executes on button press in pushbutton2.  
function pushbutton2_Callback(hObject, eventdata, handles)%previous
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = handles.data;
figure(handles.FigureHandle);
currentline = str2double(get(handles.edit1,'String'));
if currentline ~= 1
    plot(data(currentline-1,:))
    set(handles.edit1,'String',num2str(currentline-1));
else
    beep
end

figure(handles.figure1);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles, n)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


