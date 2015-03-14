function Mode1
%%Constant Definitions:
BOARDGAME.RESOLUTION = [];       % Game Resolution, default at [256 144]
BOARDGAME.WINDOW_SCALE = 2;     % The actual size of the window divided by resolution
BOARDGAME.FLOOR_TOP_Y = [];      % The y position of upper crust of the floor.
BOARDGAME.N_UPDATES_PER_SEC = [];
BOARDGAME.FRAME_DURATION = [];
BOARDGAME.COMMAND_TEXT_FILE = [];   % Initializing the Command text file
BOARDGAME.DICEROLL_TEXT_FILE = [];  % Initializing the Roll text file
RECT.COMMAND = [];
BOARDGAME.DICEROLL = [];    % DICEROLL(a b) where a is roll number, and b is the player number
RECT.COMMAND_DRAW = [];        % x-coordinate of the rectangle



%% Handles

%%Game Logic
loadfiles();
draw();
disp(BOARDGAME.DICEROLL);
disp(RECT.COMMAND_DRAW);



%% File Loading
function loadfiles()
[filename, pathname] = uigetfile({'*.txt'},'Commands');
[filename_2, pathname_2] = uigetfile({'*.txt'},'Dice Rolls');
if isequal(filename,0)||isequal(filename_2,0)
    msgbox('Exiting Game','','warn')
else
    msgbox('Command and dice rolls imported successfully','Success','Help')
    BOARDGAME.COMMAND_TEXT_FILE = fopen(strcat(pathname,filename));
    BOARDGAME.DICEROLL_TEXT_FILE = fopen(strcat(pathname_2,filename_2));
end

tline = fgetl(BOARDGAME.COMMAND_TEXT_FILE);
i = 1;

RECT.COMMAND_DRAW = [];
while ischar(tline)
    if ~strcmp(tline,'')
    temp = sscanf(tline,'%d');
    for t = 1:5
    RECT.COMMAND_DRAW([t,],i) = temp([t,]);
    end
      i = i + 1;
    end
    tline = fgetl(BOARDGAME.COMMAND_TEXT_FILE);
end

tline = fgetl(BOARDGAME.DICEROLL_TEXT_FILE);
i = 1;
t = 0;
BOARDGAME.DICEROLL = [];

while ischar(tline)
    if ~strcmp(tline,'')
    temp = sscanf(tline,'%d');
    t = t + 1;
    while temp([i,]) ~= 0
        BOARDGAME.DICEROLL([i,],t) = temp([i,]);
        i = i + 1;
    end
    end
    i = 1;
    tline = fgetl(BOARDGAME.DICEROLL_TEXT_FILE);
end
end

%% Drawing Main Board
function draw()
[r c] = size(RECT.COMMAND_DRAW);
hold on;
axis([0 100 0 100])
for f = 1:c
rectangle('Position',[RECT.COMMAND_DRAW(1,f) RECT.COMMAND_DRAW(2,f) RECT.COMMAND_DRAW(3,f) RECT.COMMAND_DRAW(4,f)],'FaceColor',rand(1,3),'EdgeColor',rand(1,3));
if RECT.COMMAND_DRAW(5,f) == 1
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','1 space'),'FontName','Verdana');
end

end
end


end