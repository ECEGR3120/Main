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
ScoreInfoHdl = [];



%% Handles

%%Game Logic
loadfiles();
draw();
numberofplayers();



%% File Loading
function loadfiles()
[filename, pathname] = uigetfile({'*.txt'},'Commands');
[filename_2, pathname_2] = uigetfile({'*.txt'},'Dice Rolls');
if isequal(filename,0)||isequal(filename_2,0)
    msgbox('Exiting Game','','warn')
else
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
    %% Parameters
    BOARDGAME.RESOLUTION = [400 800];
    BOARDGAME.WINDOW_RES = [400 800];
        MainFigureInitPos = [100 100];
        MainFigureSize = BOARDGAME.WINDOW_RES([2 1]).*2;
        MainAxesInitPos = [0 0]; %[0.1 0.1]; % The initial position of the axes IN the figure
        MainAxesSize = [700 700]; % GAME.WINDOW_RES([2 1]);
        %% Canvases:
        MainCanvas = uint8(zeros([BOARDGAME.RESOLUTION 3]));
[r c] = size(RECT.COMMAND_DRAW);
MainFigure = figure('Name','Mode 1 Test','Position',[MainFigureInitPos, MainFigureSize]);
axis off;
hold on;
for f = 1:c
rectangle('Position',[RECT.COMMAND_DRAW(1,f) RECT.COMMAND_DRAW(2,f) RECT.COMMAND_DRAW(3,f) RECT.COMMAND_DRAW(4,f)],'FaceColor',rand(1,3),'EdgeColor',rand(1,3));
if RECT.COMMAND_DRAW(5,f) == 1
    RECT.COMMAND_DRAW(5,f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','1 space'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == -1
    RECT.COMMAND_DRAW(5,f) = 0;
elseif RECT.COMMAND_DRAW(5,f) == 2
    RECT.COMMAND_DRAW(5,f) = 2;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','2 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 3
    RECT.COMMAND_DRAW(5,f) = 3;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','3 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 4
    RECT.COMMAND_DRAW(5,f) = 4;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','4 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 5
    RECT.COMMAND_DRAW(5,f) = 5;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','5 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 6
    RECT.COMMAND_DRAW(5,f) = 6;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','6 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 7
    RECT.COMMAND_DRAW(5,f) = 7;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','7 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 8
    RECT.COMMAND_DRAW(5,f) = 8;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','8 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 9
    RECT.COMMAND_DRAW(5,f) = 9;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','9 spaces'),'FontName','Verdana');
elseif RECT.COMMAND_DRAW(5,f) == 10
    RECT.COMMAND_DRAW(5,f) = 10;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/4,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','10 spaces'),'FontName','Verdana');
end
end
end



function numberofplayers()
[ro co] = size(BOARDGAME.DICEROLL);
[ro_1 co_1] = size(RECT.COMMAND_DRAW);
ScoreInfoHd1 = text(50,50, 'Current Player:','FontName','Arial','FontSize',20,'HorizontalAlignment','center','Color',[1 1 1],'Visible','off');
im = imread('sprite.png');
t = 0;
for n = 1:co
Player(n) = image(im,'x',[RECT.COMMAND_DRAW(1,1)+4 RECT.COMMAND_DRAW(1,1)+1],'y',[RECT.COMMAND_DRAW(2,1)+4 RECT.COMMAND_DRAW(2,1)+1],'Visible','on');
t = t +1 ;
person.Current(n).pos = [RECT.COMMAND_DRAW(1,1) RECT.COMMAND_DRAW(2,1)] ;
end

i = 1;
iterator = 0;
var_1 = 1;
n = 1;
while iterator ~= 1
    %% player moves cards
    diceroll = BOARDGAME.DICEROLL(var_1,n);
    person.Current(n).pos(1) = person.Current(n).pos(1)+diceroll;
    person.Current(n).pos(2) = person.Current(n).pos(2)+diceroll;

    
    logo_dice = sprintf('Current Player: %d, Current Roll: %d',n,BOARDGAME.DICEROLL(var_1,n));
        set(ScoreInfoHd1,'Visible','on','String',logo_dice);
        pause(1);
        if person.Current(n).pos(1) >= co_1 || person.Current(n).pos(2) >= co_1
        Winner = sprintf('Current Player %d wins!',n);
        set(ScoreInfoHd1,'Visible','on','String',Winner);
        pause(1);
        set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+4 RECT.COMMAND_DRAW(1,end)+1]...
        ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','on');
        break;
        end
    set(Player(n),'x',[RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+4+2*n RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+1+2*n]...
        ,'y',[RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+4 RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+1],'Visible','on');
    pause(1)
    if RECT.COMMAND_DRAW(5,person.Current(n).pos(1)) ~= 0
            pause(1)
            luck = sprintf('Current Player: %d, Gets to move %d spaces',n,RECT.COMMAND_DRAW(5,person.Current(n).pos(1)));
            set(ScoreInfoHd1,'Visible','on','String',luck);
            pause(1);
            person.Current(n).pos(1) = person.Current(n).pos(1)+RECT.COMMAND_DRAW(5,person.Current(n).pos(1));
            person.Current(n).pos(2) = person.Current(n).pos(2)+RECT.COMMAND_DRAW(5,person.Current(n).pos(2));
            if person.Current(n).pos(1) >= co_1 || person.Current(n).pos(2) >= co_1
            Winner = sprintf('Current Player %d wins!',n);
            set(ScoreInfoHd1,'Visible','on','String',Winner);
            pause(1);
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+4 RECT.COMMAND_DRAW(1,end)+1]...
            ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','on');
            break;
            end
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+4+2*n RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+1+2*n]...
            ,'y',[RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+4 RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+1],'Visible','on');
            
    end
    n = n + 1;
    if n >= t+1;
        n = 1;
        var_1 = var_1 +1;
    end
end
    
end
end
