function varargout = entry(varargin)
% ENTRY MATLAB code for entry.fig
%      ENTRY, by itself, creates a new ENTRY or raises the existing
%      singleton*.
%
%      H = ENTRY returns the handle to a new ENTRY or the handle to
%      the existing singleton*.
%
%      ENTRY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTRY.M with the given input arguments.
%
%      ENTRY('Property','Value',...) creates a new ENTRY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before entry_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to entry_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help entry

% Last Modified by GUIDE v2.5 28-Feb-2016 16:06:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @entry_OpeningFcn, ...
                   'gui_OutputFcn',  @entry_OutputFcn, ...
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


% --- Executes just before entry is made visible.
function entry_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to entry (see VARARGIN)

% Choose default command line output for entry
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global image;
global rowdik;
global coldik;
image = 0;
rowdik = 0;
coldik = 0;

% UIWAIT makes entry wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = entry_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global rowdik;
global coldik;
imsi = size(image);
startRow = 1;
startCol = 1;
outim = image;
nrow = rowdik;
ncol = coldik;
moder = 1;
tic;
if numel(imsi) > 2
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            rr = find(nrow(1:1,1:imsi(1)) == startRow);
            rg = find(nrow(2:2,1:imsi(1)) == startRow);
            rb = find(nrow(3:3,1:imsi(1)) == startRow);
            cr = find(ncol(1:1,1:imsi(2)) == startCol);
            cg = find(ncol(2:2,1:imsi(2)) == startCol);
            cb = find(ncol(3:3,1:imsi(2)) == startCol);
            outim(startRow,startCol,1) = image(rr,cr,1);
            outim(startRow,startCol,2) = image(rg,cg,2);
            outim(startRow,startCol,3) = image(rb,cb,3);
            startCol = startCol + 1;
        end
        if(mod(moder,10) == 0)
            imshow(outim);
            drawnow;
        end
        moder = moder + 1;
        startCol = 1;
        startRow = startRow + 1;
    end
else
    r = find(nrow == startRow);
    c = find(ncol == startCol);
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            outim(startRow,startCol) = image(r,c);
            startCol = startCol + 1;
        end
        startCol = 1;
        startRow = startRow + 1;
    end
    toc;
end
 image = outim;
     msgbox(['UnFuzzification complete. @', num2str(toc),'secs, Thank You'],'UnFuzzify Status ShoutOut','help','modal');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global rowdik;
global coldik
if isequal(image,0)
    
else 
    outim = image;
    imsi = size(image);
    ncolr = randperm(imsi(2));
    ncolg = randperm(imsi(2));
    ncolb = randperm(imsi(2));
    nrowr = randperm(imsi(1));
    nrowg = randperm(imsi(1));
    nrowb = randperm(imsi(1));
    rowdik = [nrowr; nrowg; nrowb];
    coldik = [ncolr; ncolg; ncolb];
    startRow = 1;
    startCol = 1;
    axes(handles.axes1);
    moder = 1;
    if numel(imsi) > 2
        %outim = zeros(imsi(1),imsi(2),3);
        tic;
        while startRow <= imsi(1)
            while startCol <= imsi(2)
                outim(startRow,startCol,1) = uint8(image(nrowr(startRow),ncolr(startCol),1));
                %outim(nrowr(startRow),ncolr(startCol),1) = uint8(image(startRow,startCol,1));
                %
                %outim(startRow,startCol,2) = uint8(image(nrowg(startRow),ncolg(startCol),2));
                %outim(nrowr(startRow),ncolr(startCol),2) = uint8(image(startRow,startCol,2));
                %
                %outim(startRow,startCol,3) = uint8(image(nrowb(startRow),ncolb(startCol),3));
                %outim(nrowr(startRow),ncolr(startCol),3) = uint8(image(startRow,startCol,3));
                startCol = startCol + 1;
            end
            if(mod(moder,10) == 0)
               imshow(outim);
               drawnow; 
            end
            moder = moder + 1;
            startCol = 1;
            startRow = startRow + 1;
        end
        
        moder = 1;
        %startRow = imsi(1);
        %startCol = imsi(2);
        while startRow > 1
            while startCol > 1
                %outim(startRow,startCol,1) = uint8(image(nrowr(startRow),ncolr(startCol),1));
                %outim(nrowr(startRow),ncolr(startCol),1) = uint8(image(startRow,startCol,1));
                %
                outim(startRow,startCol,2) = uint8(image(nrowg(startRow),ncolg(startCol),2));
                %outim(nrowr(startRow),ncolr(startCol),2) = uint8(image(startRow,startCol,2));
                %
                %outim(startRow,startCol,3) = uint8(image(nrowb(startRow),ncolb(startCol),3));
                %outim(nrowr(startRow),ncolr(startCol),3) = uint8(image(startRow,startCol,3));
                startCol = startCol - 1;
            end
            if(mod(moder,10) == 0)
               imshow(outim);
               drawnow;
               disp(1);
            end
            moder = moder + 1;
            startCol = imsi(2);
            startRow = startRow - 1;
        end
        
        startRow = 1;
        startCol = 1;
        moder = 1;
        while startRow <= imsi(1)
            while startCol <= imsi(2)
                %outim(startRow,startCol,1) = uint8(image(nrowr(startRow),ncolr(startCol),1));
                %outim(nrowr(startRow),ncolr(startCol),1) = uint8(image(startRow,startCol,1));
                %
                %outim(startRow,startCol,2) = uint8(image(nrowg(startRow),ncolg(startCol),2));
                %outim(nrowr(startRow),ncolr(startCol),2) = uint8(image(startRow,startCol,2));
                %
                outim(startRow,startCol,3) = uint8(image(nrowb(startRow),ncolb(startCol),3));
                %outim(nrowr(startRow),ncolr(startCol),3) = uint8(image(startRow,startCol,3));
                startCol = startCol + 1;
            end
            if(mod(moder,10) == 0)
               imshow(outim);
               drawnow;
            end
            moder = moder + 1;
            startCol = 1;
            startRow = startRow + 1;
        end
        
        
    else
        %outim = zeros(imsi(1),imsi(2));
        while startRow <= imsi(1)
            while startCol <= imsi(2)
                outim(startRow,startCol) = uint8(image(nrowr(startRow),ncolr(startCol)));
                imshow(outim);
                drawnow;
                startCol = startCol + 1;
            end
            startCol = 1;
            startRow = startRow + 1;
        end
    end
    toc;
    image = outim;
    msgbox(['Fuzzification complete. @', num2str(toc),'secs. See Fuzzify Dictionary on newImPath, Thank You'],'Fuzzify Status ShoutOut','help','modal');
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
[fn, pn] = uigetfile('*.jpg; *.png;', 'Please select an image');
imna = [pn, fn];
if isempty(imna)
    msgbox('Operation cancelled by user','YYYYnnnnnn','error','modal');
else
    axes(handles.axes1);
    image = imread(imna);
    imshow(image);
end
