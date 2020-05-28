function varargout = GUIListrik(varargin)
% GUILISTRIK MATLAB code for GUIListrik.fig
%      GUILISTRIK, by itself, creates a new GUILISTRIK or raises the existing
%      singleton*.
%
%      H = GUILISTRIK returns the handle to a new GUILISTRIK or the handle to
%      the existing singleton*.
%
%      GUILISTRIK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUILISTRIK.M with the given input arguments.
%
%      GUILISTRIK('Property','Value',...) creates a new GUILISTRIK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIListrik_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIListrik_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIListrik

% Last Modified by GUIDE v2.5 28-May-2020 12:55:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIListrik_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIListrik_OutputFcn, ...
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


% --- Executes just before GUIListrik is made visible.
function GUIListrik_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIListrik (see VARARGIN)

% Choose default command line output for GUIListrik
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIListrik wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIListrik_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%DATA TABEL
filename = 'bebanlistrik.xlsx';
sheet = 1;
xlRange5 = 'C6:BV13'; 
data_tabel = xlsread(filename, sheet, xlRange5);

% load jaringan yang sudah dibuat pada proses pelatihan
load net.mat

% Proses membaca data uji dari excel
filename = 'bebanlistrik.xlsx';
sheet = 1;
xlRange3 = 'AY31:BV38'; %data input uji
data_uji = xlsread(filename, sheet, xlRange3);

[m,n] = size(data_uji);

%Hasil Prediksi
hasil_uji = sim(net_keluaran,data_uji);
max_data = 103;
min_data = 23;

%Mengubah data agar tidak dalam bentuk normalisasi lagi
hasil_uji = (hasil_uji*(max_data-min_data))+min_data;

hasil_uji

a=hasil_uji(1,1);
b=hasil_uji(1,2);
c=hasil_uji(1,3);
d=hasil_uji(1,4);
e=hasil_uji(1,5);
f=hasil_uji(1,6);
g=hasil_uji(1,7);
h=hasil_uji(1,8);
i=hasil_uji(1,9);
j=hasil_uji(1,10);
k=hasil_uji(1,11);
l=hasil_uji(1,12);
m=hasil_uji(1,13);
n=hasil_uji(1,14);
o=hasil_uji(1,15);
p=hasil_uji(1,16);
q=hasil_uji(1,17);
r=hasil_uji(1,18);
s=hasil_uji(1,19);
t=hasil_uji(1,20);
u=hasil_uji(1,21);
v=hasil_uji(1,22);
w=hasil_uji(1,23);
x=hasil_uji(1,24);


set(handles.jam0,'string',(a));
set(handles.jam1,'string',(b));
set(handles.jam2,'string',(c));
set(handles.jam3,'string',(d));
set(handles.jam4,'string',(e));
set(handles.jam5,'string',(f));
set(handles.jam6,'string',(g));
set(handles.jam7,'string',(h));
set(handles.jam8,'string',(i));
set(handles.jam9,'string',(j));
set(handles.jam10,'string',(k));
set(handles.jam11,'string',(l));
set(handles.jam12,'string',(m));
set(handles.jam13,'string',(n));
set(handles.jam14,'string',(o));
set(handles.jam15,'string',(p));
set(handles.jam16,'string',(q));
set(handles.jam17,'string',(r));
set(handles.jam18,'string',(s));
set(handles.jam19,'string',(t));
set(handles.jam20,'string',(u));
set(handles.jam21,'string',(v));
set(handles.jam22,'string',(w));
set(handles.jam23,'string',(x));

hasil_uji


function jam0_Callback(hObject, eventdata, handles)
% hObject    handle to jam0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam0 as text
%        str2double(get(hObject,'String')) returns contents of jam0 as a double


% --- Executes during object creation, after setting all properties.
function jam0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam1_Callback(hObject, eventdata, handles)
% hObject    handle to jam1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam1 as text
%        str2double(get(hObject,'String')) returns contents of jam1 as a double


% --- Executes during object creation, after setting all properties.
function jam1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam14_Callback(hObject, eventdata, handles)
% hObject    handle to jam14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam14 as text
%        str2double(get(hObject,'String')) returns contents of jam14 as a double


% --- Executes during object creation, after setting all properties.
function jam14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam13_Callback(hObject, eventdata, handles)
% hObject    handle to jam13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam13 as text
%        str2double(get(hObject,'String')) returns contents of jam13 as a double


% --- Executes during object creation, after setting all properties.
function jam13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam12_Callback(hObject, eventdata, handles)
% hObject    handle to jam12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam12 as text
%        str2double(get(hObject,'String')) returns contents of jam12 as a double


% --- Executes during object creation, after setting all properties.
function jam12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam11_Callback(hObject, eventdata, handles)
% hObject    handle to jam11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam11 as text
%        str2double(get(hObject,'String')) returns contents of jam11 as a double


% --- Executes during object creation, after setting all properties.
function jam11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam10_Callback(hObject, eventdata, handles)
% hObject    handle to jam10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam10 as text
%        str2double(get(hObject,'String')) returns contents of jam10 as a double


% --- Executes during object creation, after setting all properties.
function jam10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam9_Callback(hObject, eventdata, handles)
% hObject    handle to jam9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam9 as text
%        str2double(get(hObject,'String')) returns contents of jam9 as a double


% --- Executes during object creation, after setting all properties.
function jam9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam8_Callback(hObject, eventdata, handles)
% hObject    handle to jam8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam8 as text
%        str2double(get(hObject,'String')) returns contents of jam8 as a double


% --- Executes during object creation, after setting all properties.
function jam8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam7_Callback(hObject, eventdata, handles)
% hObject    handle to jam7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam7 as text
%        str2double(get(hObject,'String')) returns contents of jam7 as a double


% --- Executes during object creation, after setting all properties.
function jam7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam6_Callback(hObject, eventdata, handles)
% hObject    handle to jam6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam6 as text
%        str2double(get(hObject,'String')) returns contents of jam6 as a double


% --- Executes during object creation, after setting all properties.
function jam6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam5_Callback(hObject, eventdata, handles)
% hObject    handle to jam5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam5 as text
%        str2double(get(hObject,'String')) returns contents of jam5 as a double


% --- Executes during object creation, after setting all properties.
function jam5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam2_Callback(hObject, eventdata, handles)
% hObject    handle to jam2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam2 as text
%        str2double(get(hObject,'String')) returns contents of jam2 as a double


% --- Executes during object creation, after setting all properties.
function jam2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam3_Callback(hObject, eventdata, handles)
% hObject    handle to jam3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam3 as text
%        str2double(get(hObject,'String')) returns contents of jam3 as a double


% --- Executes during object creation, after setting all properties.
function jam3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam4_Callback(hObject, eventdata, handles)
% hObject    handle to jam4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam4 as text
%        str2double(get(hObject,'String')) returns contents of jam4 as a double


% --- Executes during object creation, after setting all properties.
function jam4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam23_Callback(hObject, eventdata, handles)
% hObject    handle to jam23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam23 as text
%        str2double(get(hObject,'String')) returns contents of jam23 as a double


% --- Executes during object creation, after setting all properties.
function jam23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam22_Callback(hObject, eventdata, handles)
% hObject    handle to jam22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam22 as text
%        str2double(get(hObject,'String')) returns contents of jam22 as a double


% --- Executes during object creation, after setting all properties.
function jam22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam21_Callback(hObject, eventdata, handles)
% hObject    handle to jam21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam21 as text
%        str2double(get(hObject,'String')) returns contents of jam21 as a double


% --- Executes during object creation, after setting all properties.
function jam21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam20_Callback(hObject, eventdata, handles)
% hObject    handle to jam20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam20 as text
%        str2double(get(hObject,'String')) returns contents of jam20 as a double


% --- Executes during object creation, after setting all properties.
function jam20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam19_Callback(hObject, eventdata, handles)
% hObject    handle to jam19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam19 as text
%        str2double(get(hObject,'String')) returns contents of jam19 as a double


% --- Executes during object creation, after setting all properties.
function jam19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam18_Callback(hObject, eventdata, handles)
% hObject    handle to jam18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam18 as text
%        str2double(get(hObject,'String')) returns contents of jam18 as a double


% --- Executes during object creation, after setting all properties.
function jam18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam17_Callback(hObject, eventdata, handles)
% hObject    handle to jam17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam17 as text
%        str2double(get(hObject,'String')) returns contents of jam17 as a double


% --- Executes during object creation, after setting all properties.
function jam17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam16_Callback(hObject, eventdata, handles)
% hObject    handle to jam16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam16 as text
%        str2double(get(hObject,'String')) returns contents of jam16 as a double


% --- Executes during object creation, after setting all properties.
function jam16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jam15_Callback(hObject, eventdata, handles)
% hObject    handle to jam15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jam15 as text
%        str2double(get(hObject,'String')) returns contents of jam15 as a double


% --- Executes during object creation, after setting all properties.
function jam15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jam15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 



function mse_Callback(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse as text
%        str2double(get(hObject,'String')) returns contents of mse as a double


% --- Executes during object creation, after setting all properties.
function mse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
