function varargout = CSM(varargin)
% CSM M-file for CSM.fig
%      CSM, by itself, creates a new CSM or raises the existing
%      singleton*.
%
%      H = CSM returns the handle to a new CSM or the handle to
%      the existing singleton*.
%
%      CSM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CSM.M with the given input arguments.
%
%      CSM('Property','Value',...) creates a new CSM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CSM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CSM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CSM

% Last Modified by GUIDE v2.5 01-Jun-2011 11:28:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @CSM_OpeningFcn, ...
    'gui_OutputFcn',  @CSM_OutputFcn, ...
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


% --- Executes just before CSM is made visible.
function CSM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CSM (see VARARGIN)
% Choose default command line output for CSM
handles.output = hObject;
h = handles.edit10;

numsymbols= str2num(get(h, 'String'));
symbols = 0:numsymbols-1;
symbolstrings = num2cell(symbols);

h = handles.popupmenu1;
% Update handles structure
set(h, 'String', symbolstrings);

h = handles.popupmenu3;
% Update handles structure
set(h, 'String', symbolstrings);

% UIWAIT makes CSM wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handles.Means = [0.3 0.7];
handles.Vars = [0.01 0.01];
handles.Means2 = [0.3 0.7];
handles.Vars2 = [0.01 0.01];
handles.MMfitted = 0;
handles.Discretised =0;
handles.DataPresent = 0;
handles.MachineInferred = 0;
handles.continuousdata = -1;
guidata(hObject,handles);


% --- Outputs from this function are returned to the command line.
function varargout = CSM_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, data, handles) %import data
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = handles.edit1;
FileName = get(h,'String');

data = importdata(FileName);
maxdata = max(data);
size(maxdata);

if max(size(maxdata)) > 1
    maxdata = max(maxdata);
end

h = handles.edit10;
set(h,'String', num2str(maxdata+1));

%Check the dimensions of the data
if size(data,1) == 1 || size(data,2) ==1
    if size(data,2) == 1
        handles.data = data';
    else
        handles.data = data;
    end
else
    handles.data = data;
end

discrete = 1;

for i = 1:10
    if round(data(i)) ~= data(i)
        discrete = 0;
        handles.continuousdata = data;
    end
end
        
if discrete == 0
    h = handles.edit10;
    set(h,'String', '-');
end
    
handles.DataPresent = 1;
handles.Discretised =discrete;

guidata(hObject,handles);
h = msgbox('Done');

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%generate data
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = handles.radiobutton13;
set(h,'Value', 1);

%Get all the options and make sure they make sense (otherwise return an
%error)
Value = 0;
if Value == 0
    h = handles.radiobutton1;
    Value = get(h,'Value');
    if Value == 1
        %Option = 'Golden Mean'
        OptionNumber = 2;
    end
end
if Value == 0
    h = handles.radiobutton3;
    Value = get(h,'Value');
    if Value == 1
        %Option = 'Even Process'
        OptionNumber = 3;
    end
end

if Value == 0
    h = handles.radiobutton5;
    Value = get(h,'Value');
    if Value == 1
        %Option = 'Custom Dot File'
        OptionNumber = 0;
        h = handles.edit2;
        DFName = get(h,'String');
    end
end
if Value == 0
    errordlg('Please select a model option','Data not generated')
end

%discrete or continuous
h = handles.radiobutton11;
Value = get(h,'Value');

%construct options vector to pass to machine runner to specify graphs to
%plot
h = handles.checkbox2;
options(1) = get(h,'Value');
h = handles.checkbox3;
options(2) = get(h,'Value');
h = handles.checkbox4;
options(3) = get(h,'Value');
h = handles.checkbox5;
options(4) = get(h,'Value');
h = handles.checkbox6;
options(5) = get(h,'Value');
h = handles.checkbox7;
options(6) = get(h,'Value');
h = handles.checkbox8;
options(7) = get(h,'Value');
h = handles.checkbox9;
options(8) = get(h,'Value');
h = handles.checkbox11;
options(9) = get(h,'Value');



if Value == 1
    Discrete = 1;
else
    Discrete = 0;
end

h = handles.edit3;
N = str2double(get(h,'String'));

if OptionNumber ~= 0
    [a, s, stateseq, logprob, T] = MachineRunner...
        (handles.Means, handles.Vars, N, options, OptionNumber);
    handles.T = T;
else
    [a, s, stateseq, logprob, T] = MachineRunner...
        (handles.Means, handles.Vars, N, options, OptionNumber, DFName);
    handles.T = T;
end

if Discrete == 1
    handles.data = s-1;
    handles.Discretised = 1;
    handles.DataPresent = 1;
else
    handles.data = a;
    handles.Discretised = 0;
    handles.DataPresent = 1;
end

fid = fopen('GeneratedData.txt','w');
if Discrete == 1
    data = handles.data;
    for i = 1:length(data)
        fprintf(fid, '%i\n', data(i));        
    end
else
    data = handles.data;
    for i = 1:length(data)
        fprintf(fid, '%6f\n', data(i));
    end
end
fclose(fid);

guidata(hObject,handles);

if length(a) == N
    h = msgbox('Done');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.DataPresent == 1
    if min(size(handles.data))>1
        DisplayDataFH = figure;
        plot(handles.data(1,:))
        DisplayData(size(handles.data,1),DisplayDataFH, handles.data)        
    else
        figure
        plot(handles.data)
    end
else
    errordlg('No data provided')
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.DataPresent == 1
    h = handles.edit4;
    NumBins = str2double(get(h,'String'));
    if NumBins >0
        figure       
        dataforhist = handles.data;
        
        if min(size(dataforhist)) > 1
            dataforhist =reshape(dataforhist',1,[]);
        end
        
        hist(dataforhist,NumBins)
    else
        errordlg('Number of bins must be greater than 0')
    end
else
    errordlg('No data provided')
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%fit mixture model
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.DataPresent == 1
    if handles.Discretised == 0

        %get the option selected (fixed number of components or a range)
        h = handles.radiobutton7;
        option = get(h, 'Value');
        a = handles.data;
        
        %reshape the data if it is multiline
        if size(a,1) >1
            newa = zeros(size(a,1)*size(a,2),1);
            newa = reshape(a',1,[]);
            a = newa;
        end
        
        %get the maximum/specified number of components
        h = handles.edit5;
        n = str2double(get(h, 'String'));


        %option = 0 - find best number of components using Akaike Information Criterion
        %(upto n)
        %option = 1 - constrain to n componenets
        [MEAN, VAR, bestN, MPs] = MixtureModelFitter(a, n, option);
        handles.FittedMeans = MEAN;
        handles.FittedVars = VAR;
        handles.BestN = bestN;
        handles.MPs = MPs;
        handles.MMfitted = 1;
        guidata(hObject,handles);

        %Plot histogram of data and fitted model
        figure
        [n, xout] = hist(a,50);
        xdiff = xout(2)- xout(1);

        n= n/sum(n*xdiff);
        bar(xout, n,'FaceColor',[0.8 0.8 0.8],...
            'EdgeColor',[0.502 0.502 0.502],...
            'BarWidth',0.6);
        hold on

        SUMYs = 0;
        [maximum, maxloc] = max(MEAN);
        [minimum, minloc] = min(MEAN);

        x = MEAN(minloc)-3*VAR(1)^0.5:VAR(1)^0.5/40:MEAN(maxloc)+3*VAR(1)^0.5;
        xdiff = x(2) - x(1);

        for i = 1:bestN

            y  = (1/(2*pi*VAR(i))^0.5)*exp((-(x-MEAN(i)).^2)/(2*VAR(i)));
            y=MPs(i)*y/sum(y*xdiff);

            plot(x,y,'k','LineWidth',1)
            SUMYs = SUMYs+y;
        end
        plot(x,SUMYs,'k','LineWidth',1)


    else
        errordlg('Data is discrete, the shown model was used to discretise')

        a = handles.continuousdata;
        MEAN = handles.FittedMeans;
        VAR = handles.FittedVars;
        bestN = handles.BestN;
        MPs = handles.MPs;

        %Plot histogram of data and fitted model
        figure
        [n, xout] = hist(a,50);
        xdiff = xout(2)- xout(1);

        n= n/sum(n*xdiff);
        bar(xout, n,'FaceColor',[0.8 0.8 0.8],...
            'EdgeColor',[0.502 0.502 0.502],...
            'BarWidth',0.6);
        hold on

        SUMYs = 0;
        [maximum, maxloc] = max(MEAN);
        [minimum, minloc] = min(MEAN);

        x = MEAN(minloc)-3*VAR(1)^0.5:VAR(1)^0.5/40:MEAN(maxloc)+3*VAR(1)^0.5;
        xdiff = x(2) - x(1);

        for i = 1:bestN

            y  = (1/(2*pi*VAR(i))^0.5)*exp((-(x-MEAN(i)).^2)/(2*VAR(i)));
            y=MPs(i)*y/sum(y*xdiff);

            plot(x,y,'k','LineWidth',1)
            SUMYs = SUMYs+y;
        end
        plot(x,SUMYs,'k','LineWidth',1)

    end

else
    errordlg('No data provided')
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)%noncommittal discretisation
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.MMfitted == 1
    if handles.Discretised == 0
        h = handles.checkbox1;
        set(h,'Value',1);

        MEAN = handles.FittedMeans;
        VAR = handles.FittedVars;
        bestN = handles.BestN;
        MPs = handles.MPs;
        a = handles.data;

        DiscretisedData = NoncommittalDiscretisation(a, MEAN, VAR, bestN, MPs, 1);
        handles.continuousdata = a;
        handles.data = DiscretisedData;
        handles.Discretised = 1;
        guidata(hObject, handles);
    else
        h = handles.checkbox1;
        set(h,'Value',1);

        MEAN = handles.FittedMeans;
        VAR = handles.FittedVars;
        bestN = handles.BestN;
        MPs = handles.MPs;
        a = handles.continuousdata;

        DiscretisedData = NoncommittalDiscretisation(a, MEAN, VAR, bestN, MPs, 1);
        handles.continuousdata = a;
        handles.data = DiscretisedData;
        handles.Discretised = 1;
        guidata(hObject, handles);

        errordlg('The data had already been discretised. Repeated or redone if the mixture model had changed')

    end
else
    errordlg('Mixture model must be fitted before data can be discretised')
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3

h = handles.checkbox3;
ticked = get(h,'Value');
if ticked == 0
    h = handles.checkbox11;
    set(h,'Value', 0);
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles) %run CSSR
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.DataPresent == 1 && handles.Discretised == 1
    
h = handles.checkbox1;
noncom = get(h,'Value');
data = handles.data;


options = zeros(8,1);
%construct options vector to pass to CSSR to specify metrics.
h = handles.checkbox2;
options(1) = get(h,'Value');
h = handles.checkbox3;
options(2) = get(h,'Value');
h = handles.checkbox4;
options(3) = get(h,'Value');
h = handles.checkbox5;
options(4) = get(h,'Value');
h = handles.checkbox6;
options(5) = get(h,'Value');
h = handles.checkbox7;
options(6) = get(h,'Value');
h = handles.checkbox8;
options(7) = get(h,'Value');
h = handles.checkbox9;
options(8) = get(h,'Value');
h = handles.checkbox11;
options(9) = get(h,'Value');


h = handles.edit16;
filename = get(h, 'String');

h = handles.edit6;
L_Max = str2num(get(h, 'String'));
h = handles.edit9;
alpha = str2num(get(h, 'String'));

if noncom == 0
    if handles.continuousdata ~= -1
        errordlg('Noncommittal discretisation must be used with discretised continuous data')
        return
    end
end

if noncom == 0
    h = handles.edit10;
    AlphabetSize = str2double(get(h,'String'));
    Alphabet = 0:AlphabetSize-1;
    [stateseq, symseq, prob, numstates] = CSSR...
        (data, Alphabet, L_Max, alpha, filename, options);
    handles.numstates = numstates;
    handles.stateseq = stateseq;
else
    bestN = handles.BestN;
    MEAN = handles.FittedMeans;
    VAR = handles.FittedVars;
    MPs = handles.MPs;
    continuousdata = handles.continuousdata;
    AlphabetSize = 2*bestN-1;
    Alphabet = 0:AlphabetSize-1;
    [stateseq, symseq, prob, numstates] = CSSR...
        (data, Alphabet, L_Max, alpha, filename,...
        options, 'noncom', MEAN, VAR, MPs, bestN,...
        continuousdata);
    handles.numstates = numstates;
    handles.stateseq = stateseq;
end

%Get directory specified to save output files to
%if it hasn't been specified, i.e. is still 'folder' save to the current
%directory
h = handles.edit17;
FolderName = get(h,'String');
if strcmp(FolderName,'folder') == 1
    FolderName = cd;
    move = 0;
else
    move = 1;
end

handles.saveto = FolderName;

%if the directory is not the current directory then move the output files
if move == 1
    %get file name
    files = strcat(filename, 'L', num2str(L_Max), '*');
    movefile(files,handles.saveto);
end

%if the data was continuous then plot the state trajectory
if length(handles.continuousdata)> 1;
    
    symseq;
    size(symseq);
    %enough symbols to represent 32 different states.
    linestyle = {'ro' 'rx' 'rs' 'rd' 'r^' 'r+' 'rv' 'r*',...
        'bo' 'bx' 'bs' 'bd' 'b^' 'b+' 'bv' 'b*',...
        'mo' 'mx' 'ms' 'md' 'm^' 'm+' 'mv' 'm*',...
        'go' 'gx' 'gs' 'gd' 'g^' 'g+' 'gv' 'g*'};
    symseq = symseq-1;
    figure
    plot(continuousdata(1,:),'Color',[0.6 0.6 0.6], 'LineWidth', 2)
    hold on
    MEAN = sort(MEAN);
    for i = 1:length(symseq(1,:))
        symseq(1,i) = MEAN((symseq(1,i)/2)+1);
    end
    plot(symseq(1,:), 'k')
    hold on
    %plot symbols at each timepoint along the idealised trajectory
    %corresponding to the state the machine is in.
    for i = 1:numstates+1
        %need a vector of timesteps for each state
        count = 1;
        timesinstatei = -1;
        for j = 2:size(stateseq,2)
            if stateseq(1,j) == i
                timesinstatei(count) = j-1;
                count = count + 1;
            end
        end
        if timesinstatei ~= -1;
            plot(timesinstatei, symseq(1,timesinstatei),linestyle{i})
        end
    end

end

handles.MachineInferred = 1;
handles.ProbDataGivenInfModel = prob;
guidata(hObject,handles);

%update popupmenu2 with number of states
states = unique(stateseq);
index = find(states==-1,1);
if isempty(index) == 0
    states(index) = [];
end

index = find(states==0);
if isempty(index) ~= 1
    states(index) = [];
end

if(isempty(states)==1)
    statestrings = cellstr('error');
else
    statestrings = num2cell(states-1);
end

h = handles.popupmenu2;
set(h, 'Value', 1)

%set new symbol set
set(h, 'String', statestrings);

h = msgbox('Done');

else
    if handles.Discretised == 0
        errordlg('Data is not discrete')
    else
        errordlg('No data')
    end
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double

h = handles.edit10;
numsymbols= str2num(get(h, 'String'));
symbols = 0:numsymbols-1;
symbolstrings = num2cell(symbols);

h = handles.popupmenu1;
set(h, 'Value', 1);

%get old maximumsymbol
symbols = get(h, 'String');
maxsymbol = str2num(cell2mat(symbols(length(symbols))));

%set new symbol set
set(h, 'String', symbolstrings);

%update the means and variances associated with the new symbols that
%weren't there before or delete excess ones if we have decreased the
%alphabet size.
if maxsymbol+1 < numsymbols
    handles.Means(maxsymbol+2:numsymbols) = 0.5;
    handles.Vars(maxsymbol+2:numsymbols) = 0.01;
    guidata(hObject,handles);
elseif maxsymbol+1 > numsymbols
    handles.Means(numsymbols+1:length(handles.Means)) = [];
    handles.Vars(numsymbols+1:length(handles.Vars)) = [];
    guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

h = handles.popupmenu1;
symbol = get(h, 'Value');
h = handles.edit11;
mean = handles.Means(symbol);
meanstring = num2str(mean);
set(h, 'String', meanstring);
h = handles.edit12;
var = handles.Vars(symbol);
varstring = num2str(var);
set(h, 'String', varstring);



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

h = handles.popupmenu1;
symbol = get(h, 'Value');
h = handles.edit11;
mean = str2double(get(h,'String'));
handles.Means(symbol) = mean;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double

h = handles.popupmenu1;
symbol = get(h, 'Value');
h = handles.edit12;
var = str2double(get(h,'String'));
handles.Vars(symbol) = var;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%open('Help file.htm')
open('Help.pdf')

% --- Executes during object creation, after setting all properties.
function radiobutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles) %run batch
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = handles.edit18;
FolderName = get(h,'String');
%get list of files in specified folder
datafilelist = fuf (FolderName,0,'normal');

%look for output file suffixs
Files = strcat(FolderName,'\*Final.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(1:length(outputfilelist)) = outputfilelist;
Files = strcat(FolderName,'\*State*.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Symbol*.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Final.fig');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Full.fig');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Final*.png');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Full.png');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Final*.pdf');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Full.pdf');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Log.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Full.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*Metrics.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
Files = strcat(FolderName,'\*dot.txt');
outputfilelist = fuf (Files,'normal');
alloutputfiles(length(alloutputfiles)+1:length(alloutputfiles)+length(outputfilelist))=outputfilelist;
alloutputfiles = alloutputfiles';


count = 1;
isanoutputfile = 0;
for i = 1:length(datafilelist)
    for j = 1:length(alloutputfiles)
        TF = strcmp(datafilelist(i), alloutputfiles(j));
        if TF == 1
            isanoutputfile(count) = i;
            count =count +1;
            alloutputfiles(j) = [];
            break
        end
    end
end

if isanoutputfile ~= 0
    datafilelist(isanoutputfile) = [];
end

%Get options
options = zeros(8,1);
%construct options vector to pass to CSSR to specify metrics.
h = handles.checkbox2;
options(1) = get(h,'Value');
h = handles.checkbox3;
options(2) = get(h,'Value');
h = handles.checkbox4;
options(3) = get(h,'Value');
h = handles.checkbox5;
options(4) = get(h,'Value');
h = handles.checkbox6;
options(5) = get(h,'Value');
h = handles.checkbox7;
options(6) = get(h,'Value');
h = handles.checkbox8;
options(7) = get(h,'Value');
h = handles.checkbox9;
options(8) = get(h,'Value');
h = handles.checkbox11;
options(9) = get(h,'Value');

h = handles.edit6;
L_Max = str2double(get(h, 'String'));
h = handles.edit9;
alpha = str2double(get(h, 'String'));

h = handles.edit10;
AlphabetSize = str2double(get(h,'String'));
Alphabet = 0:AlphabetSize-1;


stringa = 'file 1 of ';
stringb = num2str(length(datafilelist));
message = [stringa stringb];
waitbarhandle = waitbar(0,message);

%Get directory specified to save output files to
%if it hasn't been specified, i.e. is still 'folder', save to the current
%directory
h = handles.edit17;
SaveFolderName = get(h,'String');
if strcmp(SaveFolderName,'folder') == 1
    SaveFolderName = cd;
    move = 0;
else
    move = 1;
end

handles.saveto = SaveFolderName;
saveto = SaveFolderName;

for i = 1:length(datafilelist)

    frac = i/length(datafilelist);
    stringa = 'file ';
    stringb = num2str(i);
    stringc = ' of ';
    stringd = num2str(length(datafilelist));
    message = [stringa stringb stringc stringd];
    waitbar(frac,waitbarhandle,message)

    filename = datafilelist(i)
    filename = cell2mat(filename);

    filenameandpath = strcat(FolderName,'\',filename);
    data = importdata(filenameandpath);
    if size(data,1)>size(data,2) && size(data,2)==1
        data = data';
    end

    if max(size(data))~=0
        CSSR(data, Alphabet, L_Max, alpha, filename, options);



        cab(handles.figure1,waitbarhandle)

        %if the directory is not the current directory then move the output files
        if move == 1
            %get file name
            files = strcat(filename, 'L', num2str(L_Max), '*')
            saveto
            movefile(files,saveto);
        end
    else
        'data file is empty'

    end

end

close(waitbarhandle)

h = msgbox('Done');




% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double
h = handles.edit17;
FolderName = get(h,'String');
if strcmp(FolderName,'folder') == 1
    FolderName = cd;
end

handles.saveto = FolderName;



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)%Calculate rabiner model distance
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Collect all the inputs we need for running the viterbi algorithm on the
%data for the supplied model

%Get the radio button option selected
Ready = handles.MachineInferred;

if Ready == 1

    Value = 0;
    if Value == 0
        h = handles.radiobutton13;
        Value = get(h,'Value');
        if Value == 1
            %Option = 'Generating Model'
            OptionNumber = 1;
            T = handles.T;
            MEAN = handles.Means;
            VAR = handles.Vars;
        end
    end
    
    if Value == 0
        h = handles.radiobutton15;
        Value = get(h,'Value');
        if Value == 1
            %Option = 'Custom Dot File'
            OptionNumber = 3;
            h = handles.edit19;
            DFName = get(h,'String');
            T = TMatrixextractor(DFName);
            MEAN = handles.Means2;
            VAR = handles.Vars2;
        end
    end
    if Value == 0
        errordlg('Please select a model option','Data not generated')
    end

    %discrete or continuous
    if handles.continuousdata == -1
        Discretised = 0;
    else
        Discretised = 1;
    end

    if Discretised == 0
        data = handles.data;
        DFName = 'SuppliedModel';

        [stateseq, ProbDataGivenSuppModel] = StateSeriesExtractor(T, data, DFName);

        ProbDataGivenInfModel = handles.ProbDataGivenInfModel;

        N = length(data);

        ModelDistance = (1/N)*(ProbDataGivenInfModel - ProbDataGivenSuppModel);

        str1 = 'The model distance is ';
        str2 = num2str(ModelDistance);
        outstring = [str1 str2];
        h = helpdlg(outstring);

    elseif Discretised == 1

        a = handles.continuousdata;
        continuousdata = handles.continuousdata;
        DFName = 'SuppliedModel';
        %Run the viterbi algorithm on the data using the supplied model as inputs.

        [stateseq, symseq, ProbDataGivenSuppModel] = Viterbi(a, T, handles.Means2, handles.Vars2, 1, DFName);

        %Get probability of observing the data given the inferred model (already
        %calculated)
        ProbDataGivenInfModel = handles.ProbDataGivenInfModel;

        %Get N - length of data
        N = length(a);

        %Calculate measure
        ModelDistance = (1/N)*(ProbDataGivenInfModel - ProbDataGivenSuppModel);

        %Output answer
        str1 = 'The model distance is ';
        str2 = num2str(ModelDistance);
        outstring = [str1 str2];
        h = helpdlg(outstring);


        %if the data was continuous then plot the state trajectory

        %enough symbols to represent 32 different states.
        linestyle = {'ro' 'rx' 'rs' 'rd' 'r^' 'r+' 'rv' 'r*',...
            'bo' 'bx' 'bs' 'bd' 'b^' 'b+' 'bv' 'b*',...
            'mo' 'mx' 'ms' 'md' 'm^' 'm+' 'mv' 'm*',...
            'go' 'gx' 'gs' 'gd' 'g^' 'g+' 'gv' 'g*'};

        symseq = symseq-1;
        figure
        plot(continuousdata(1,:),'Color',[0.6 0.6 0.6], 'LineWidth', 2)
        hold on
        for i = 1:size(symseq,2)            
            symseq(1,i) = MEAN((symseq(1,i))+1);
        end
        plot(symseq(1,:), 'k')
        hold on
        %plot symbols at each timepoint along the idealised trajectory
        %corresponding to the state the machine is in.
        numstates = size(T,2);
        for i = 1:numstates+1
            %need a vector of timesteps for each state
            count = 1;
            timesinstatei = -1;
            for j = 2:size(stateseq,2)
                if stateseq(1,j) == i
                    timesinstatei(count) = j-1;
                    count = count + 1;
                end
            end
            if timesinstatei ~= -1;
                plot(timesinstatei, symseq(1,timesinstatei),linestyle{i})
            end
        end



    end

else
    errordlg('A model has not been inferred. Run CSSR first')
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get options
h = handles.checkbox10;
Fit = get(h, 'Value');

h = handles.edit25;
Time = str2double(get(h, 'String'));
if Time <= 0
    errordlg('Time per point must be positive')
    return
end
if isnan(Time) == 1
    Time = 1;
    au = 1;
else
    au = 0;
end

%get state to plot dwell times for.
h = handles.popupmenu2;
States = str2double(get(h, 'String'));
StateIndex = get(h, 'Value');
State= States(StateIndex)+1;

%This is the sequence of state index so +1 relative to labels of states in
%pictures
stateseq = handles.stateseq;
if min(size(stateseq))==1 && size(stateseq,1)>size(stateseq,2)
    stateseq = stateseq';
end
maxconsecutive = 1;
dwelltimes = 0;
count = 1;
for row = 1:size(stateseq,1)
    consecutive = 1;
    for i = 1:size(stateseq,2)
        state = stateseq(row,i);
        if state == State
            consecutive = consecutive +1;
            if consecutive > maxconsecutive
                maxconsecutive = consecutive;
            end
        else
            %construct vector of dwell times to pass to fitting function
            if consecutive ~= 1
                dwelltimes(count) = consecutive;
                count = count + 1;
            end
            consecutive = 1;
        end
    end
end
dwelltimes = dwelltimes-1;
%get frequencies of dwell times
bincentres = 1:maxconsecutive-1;
[n, xout] = hist(dwelltimes,bincentres);
n = n/sum(n);
xdata = xout;

if length(n) == 1
    newn(1) = 0;
    newn(2) = n;
    newn(3) = 0;
    newxout(1) = xout - 1;
    newxout (2) = xout;
    newxout(3) = xout + 1;
    n = newn;
    xout = newxout;  
end

%plot frequency data
figure
bar(xout*Time,n','FaceColor',[0.8 0.8 0.8],...
            'EdgeColor',[0.502 0.502 0.502]);
hold on

ylim([0 1.05*max(n)])

if Fit== 1
    if length(xdata)>1
        %fit distribution to frequency data
        x = lsqcurvefit(@myexpdist,0.5,xdata,n);

        %plot fit
        y = exppdf(xdata,x);
        plot(xdata*Time,y/(sum(y)*(xdata(2)-xdata(1))), '-k')

        legend({'data';'fit'})

        h = handles.edit23;
        set(h,'String', num2str(x))
    else
        errordlg('Insufficient range of dwell times to fit exponential')
    end
end
if au == 0
    xlabel('Dwell time / s')
elseif au == 1
    xlabel('Dwell time / a.u.')
end
ylabel('Probability')


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', 'State');


function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double

h = handles.edit20;
numsymbols= str2num(get(h, 'String'));
symbols = 0:numsymbols-1;
symbolstrings = num2cell(symbols);

h = handles.popupmenu3;
set(h, 'Value', 1);

%get old maximumsymbol
symbols = get(h, 'String');
maxsymbol = str2num(cell2mat(symbols(length(symbols))));

%set new symbol set
set(h, 'String', symbolstrings);

%update the means and variances associated with the new symbols that
%weren't there before or delete excess ones if we have decreased the
%alphabet size.
if maxsymbol+1 < numsymbols
    handles.Means2(maxsymbol+2:numsymbols) = 0.5;
    handles.Vars2(maxsymbol+2:numsymbols) = 0.01;
    guidata(hObject,handles);
elseif maxsymbol+1 > numsymbols
    handles.Means2(numsymbols+1:length(handles.Means)) = [];
    handles.Vars2(numsymbols+1:length(handles.Vars)) = [];
    guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

h = handles.popupmenu3;
symbol = get(h, 'Value');
h = handles.edit21;
mean = handles.Means2(symbol);
meanstring = num2str(mean);
set(h, 'String', meanstring);
h = handles.edit22;
var = handles.Vars2(symbol);
varstring = num2str(var);
set(h, 'String', varstring);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double

h = handles.popupmenu1;
symbol = get(h, 'Value');
h = handles.edit21;
mean = str2double(get(h,'String'));
handles.Means2(symbol) = mean;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double

h = handles.popupmenu1;
symbol = get(h, 'Value');
h = handles.edit22;
var = str2double(get(h,'String'));
handles.Vars2(symbol) = var;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.data = [];
handles.T = [];
handles.continuousdata = -1;
handles.BestN = [];
handles.FittedMeans = [];
handles.FittedVars = [];
handles.MPs = [];
handles.ProbDataGivenInfModel = [];

%handles.Means = [0.3 0.7];
%handles.Vars = [0.01 0.01];
handles.MMfitted = 0;
handles.Discretised =0;
handles.DataPresent = 0;
handles.MachineInferred = 0;

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = handles.edit24;
fignum = str2num(get(h,'String'));
figs = findall(0, 'type', 'figure');
there = 0;
for i = 1:length(figs)
    if figs(i) == fignum
        there = 1;
    end
end
if there == 1
    figure(fignum);
    filename = strcat('Figure',num2str(fignum));
    export_fig(filename,'-pdf');
else
    errordlg('Figure does not exist')
end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


h = handles.checkbox11;
ticked = get(h,'Value');
if ticked == 1
    h = handles.checkbox3;
    set(h,'Value', 1);
end


function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function checkbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


