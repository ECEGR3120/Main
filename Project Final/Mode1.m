function Mode1
%%Constant Definitions:
BOARDGAME.RESOLUTION = [];       % Game Resolution, default at [256 144]
BOARDGAME.WINDOW_SCALE = 2;     % The actual size of the window divided by resolution
BOARDGAME.COMMAND_TEXT_FILE = [];   % Initializing the Command text file
BOARDGAME.DICEROLL_TEXT_FILE = [];  % Initializing the Roll text file
RECT.COMMAND = [];
BOARDGAME.DICEROLL = [];    % DICEROLL(a b) where a is roll number, and b is the player number
RECT.COMMAND_DRAW = [];        % x-coordinate of the rectangle

loadfiles();
if isequal(filename,0)||isequal(filename_2,0)
    msgbox('Exiting Game','','warn')
    clear all;
    return;
end
draw();
numberofplayers();
pause(1.5);
exit = sprintf('The Game is now going to close.');
set(ScoreInfoHd1,'Visible','on','String',exit);
pause(1); 
delete(MainFigureHdl);
for g = 1:numel(playerscore)
    fprintf('Player %d placed %d\n',g,playerscore(g));
end
clear all;
return;


%% File Loading
function loadfiles()
      h = msgbox('Please pick the Rectangular Command Text File','','warn');
      delete(findobj(h,'string','OK'));
      delete(findobj(h,'style','frame'));
      pause(1);
      delete(h);
[filename, pathname] = uigetfile({'*.txt'},'Commands');
       g = msgbox('Please pick the Dice Rolls Text File','','warn');
       delete(findobj(g,'string','OK'));
       delete(findobj(g,'style','frame'));
       pause(1);
       delete(g);
[filename_2, pathname_2] = uigetfile({'*.txt'},'Dice Rolls');
if isequal(filename,0)||isequal(filename_2,0)
    return;
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

%% Drawing Main Board and initializing actions
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
MainFigureHdl = figure('Name','Mode 1 Test','Position',[MainFigureInitPos, MainFigureSize]);
axis off;
hold on;
for f = 1:c %% RECT.COMMAND_DRAW references the rectangular board game commands from the text file stored in structure
rectangle('Position',[RECT.COMMAND_DRAW(1,f) RECT.COMMAND_DRAW(2,f) RECT.COMMAND_DRAW(3,f) RECT.COMMAND_DRAW(4,f)],'FaceColor',rand(1,3),'EdgeColor',rand(1,3)); %initial drawing of sprite components
RECT.gotostart(f) = -1; %initializing variables to be used later
RECT.loseturn(f) = -1;
RECT.Rollagain(f) = -1;
%% Actions are read from the struct file on line 5 and based on their equivalent movement, the addition or subtraction is set to the function, however, losing a turn, rolling again, and going to start, are defined to be 1 whenever called

if RECT.COMMAND_DRAW(5,f) == 1
    RECT.COMMAND_DRAW(5,f) = 2;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump ahead by','2 spaces'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == -1
    RECT.COMMAND_DRAW(5,f) = 0;
elseif RECT.COMMAND_DRAW(5,f) == 2
    RECT.COMMAND_DRAW(5,f) = 4;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump by','4 spaces'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 3
    RECT.COMMAND_DRAW(5,f) = 100;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump to','Finish'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 4
    RECT.COMMAND_DRAW(5,f) = -2;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Go Back by','2 spaces'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 5
    RECT.COMMAND_DRAW(5,f) = -4;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Go Back by','4 spaces'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 6
    RECT.COMMAND_DRAW(5,f) = 0;
    RECT.gotostart(f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Go back to','the start'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 7
    RECT.COMMAND_DRAW(5,f) = 0;
    RECT.loseturn(f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Lose a turn'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 8
    RECT.COMMAND_DRAW(5,f) = 0;
    RECT.Rollagain(f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Roll Again'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f) == 9
    RECT.COMMAND_DRAW(5,f) = -3;
    RECT.loseturn(f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Go back 3 spaces.','Lose a turn'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
elseif RECT.COMMAND_DRAW(5,f)== 10
    RECT.COMMAND_DRAW(5,f) = 3;
    RECT.Rollagain(f) = 1;
    text(RECT.COMMAND_DRAW(1,f)+RECT.COMMAND_DRAW(3,f)/2,RECT.COMMAND_DRAW(2,f)+RECT.COMMAND_DRAW(4,f)/2,char('Jump by','3 spaces. Roll again.'),'FontName','Verdana','FontSize',7,'HorizontalAlignment', 'center');
end
end
BOARDGAME.title = text(50,80,char('ECEGR1000: Final'),'FontName','Verdana','FontSize',8,'HorizontalAlignment', 'center','Visible','off');
end


%%Actual movement of players on the board + action implementation 
function numberofplayers()
[ro co] = size(BOARDGAME.DICEROLL); 
[ro_1 co_1] = size(RECT.COMMAND_DRAW);
ScoreInfoHd1 = text(50,-10, 'Current Player:','FontName','Arial','FontSize',20,'HorizontalAlignment','center','Color',[0 0 0],'Visible','off');
set(BOARDGAME.title,'Visible','on');
%%setting up each player to have their own individual sprite, up to 10
%%players allowed here.
t = 0;
im = {};    
for n = 1:co
im{n} = imread(sprintf('sprite%d.png',n));
Player(n) = image(im{n},'x',[RECT.COMMAND_DRAW(1,1)+4 RECT.COMMAND_DRAW(1,1)+1],'y',[RECT.COMMAND_DRAW(2,1)+4+n RECT.COMMAND_DRAW(2,1)+1+n],'Visible','on');
t = t +1 ;
person.Current(n).pos = [RECT.COMMAND_DRAW(1,1) RECT.COMMAND_DRAW(2,1)] ;
person.Current(n).winner = 0;
person.Current(n).loseturn = 0;
end

%%Creating a legend of all players on the board, and their numbers
for n = 1:co
Playerlegend(n) = image(im{n},'x',[-12 -15],'y',[-12+6*n -15+6*n],'Visible','on');
legendtext = text(-5, -14+6*n, sprintf('Player %d',n), 'FontSize', 12, 'Color',[0 0 0], 'HorizontalAlignment', 'right');
end

i = 1;
iterator = 0;
var_1 = 1;
n = 1;
mem = 1;
y = 0;

while iterator ~= co
    iterator = 0;
    for counter = 1:co
        if person.Current(counter).winner == 1
            iterator = iterator + 1;
        end
    end
    %% player moves cards
   
 if ~(person.Current(n).winner == 1) 
    while person.Current(n).loseturn == 1 
     if RECT.loseturn(person.Current(n).pos(1)) == 1 && person.Current(n).loseturn == 1
      person.Current(n).loseturn = 0;
      turnskip = sprintf('Current Player: %d, will be skipped this turn',n);  
      set(ScoreInfoHd1,'Visible','on','String',turnskip);
      pause(1);
        n = n + 1;
        if n >= t+1;
        n = 1;
        var_1 = var_1 +1;
        end
     end
        
    end
     
       
    end
 if ~(person.Current(n).winner == 1) 
    diceroll = BOARDGAME.DICEROLL(var_1,n);
    person.Current(n).pos(1) = person.Current(n).pos(1)+diceroll;
    person.Current(n).pos(2) = person.Current(n).pos(2)+diceroll;
    person.Current(n).prior(1) = person.Current(n).pos(1);
    logo_dice = sprintf('Current Player: %d, Current Roll: %d',n,BOARDGAME.DICEROLL(var_1,n));  
   
    set(ScoreInfoHd1,'Visible','on','String',logo_dice);
        pause(1);
      
        if person.Current(n).pos(1) >= co_1 || person.Current(n).pos(2) >= co_1 
        pause(1);
        set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+4 RECT.COMMAND_DRAW(1,end)+1]...
        ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','on');
        pause(1);
        Winner = sprintf('Current Player %d wins!',n);
        set(ScoreInfoHd1,'Visible','on','String',Winner);
        pause(1)
         set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+4 RECT.COMMAND_DRAW(1,end)+1]...
        ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','off');
        person.Current(n).winner = 1;
        playerscore(n) = y + 1;
        y = y + 1;
        end
        
      
 end        
        
         
 if ~(person.Current(n).winner == 1);
       set(Player(n),'x',[RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+5 RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+2]...
        ,'y',[RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+4+n RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+1+n],'Visible','on');
         pause(0.5);
         
        if RECT.gotostart(person.Current(n).pos(1)) == 1
            logo_dice = sprintf('Current Player: %d, Goes back to the start',n);  
            set(ScoreInfoHd1,'Visible','on','String',logo_dice);
           person.Current(n).pos(1) =1;
           person.Current(n).pos(2) =1;
           pause(1); 
        end
        
    if RECT.COMMAND_DRAW(5,person.Current(n).pos(1)) > 0
            pause(1)
            if RECT.COMMAND_DRAW(5,person.Current(n).pos(1)) == 100
            luck = sprintf('Current Player: %d, Goes straight to the finish',n);
            else
            luck = sprintf('Current Player: %d, Gets to move %d spaces',n,RECT.COMMAND_DRAW(5,person.Current(n).pos(1)));
            end
            set(ScoreInfoHd1,'Visible','on','String',luck);
            pause(1);
            person.Current(n).pos(1) = person.Current(n).pos(1)+RECT.COMMAND_DRAW(5,person.Current(n).pos(1));
            person.Current(n).pos(2) = person.Current(n).pos(2)+RECT.COMMAND_DRAW(5,person.Current(n).pos(2));
            if person.Current(n).pos(1) >= co_1 || person.Current(n).pos(2) >= co_1
            pause(1);
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+5 RECT.COMMAND_DRAW(1,end)+2]...
            ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','on');
            pause(1);
            Winner = sprintf('Player %d wins!',n);
            set(ScoreInfoHd1,'Visible','on','String',Winner);
             set(Player(n),'Visible','off');
            person.Current(n).winner = 1;
            playerscore(n) = y + 1;
            y = y + 1;
            end
            if ~(person.Current(n).winner == 1)
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+5 RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+2]...
            ,'y',[RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+4+n RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+1+n],'Visible','on');
            end
            elseif RECT.COMMAND_DRAW(5,person.Current(n).pos(1)) < 0
            luck1 = sprintf('Current Player: %d, moves back by %d spaces',n,abs(RECT.COMMAND_DRAW(5,person.Current(n).pos(1))));
            set(ScoreInfoHd1,'Visible','on','String',luck1);
            pause(1);
            person.Current(n).pos(1) = person.Current(n).pos(1)+RECT.COMMAND_DRAW(5,person.Current(n).pos(1));
            person.Current(n).pos(2) = person.Current(n).pos(2)+RECT.COMMAND_DRAW(5,person.Current(n).pos(2));
            
    end
 end
    pause(1);
 if ~(person.Current(n).winner == 1);
    if RECT.Rollagain(person.Current(n).prior(1)) == 1 ||RECT.Rollagain(person.Current(n).pos(1)) == 1
            luck2 = sprintf('Current Player: %d, gets to roll again',n);
            set(ScoreInfoHd1,'Visible','on','String',luck2);
            pause(1);
            var_1 = var_1 + 1;
            diceroll = BOARDGAME.DICEROLL(var_1,n);
            person.Current(n).pos(1) = person.Current(n).pos(1)+diceroll;
            person.Current(n).pos(2) = person.Current(n).pos(2)+diceroll;
            logo_dice = sprintf('Current Player: %d, Rolled: %d',n,BOARDGAME.DICEROLL(var_1,n));  
            set(ScoreInfoHd1,'Visible','on','String',logo_dice);
            pause(1);
            var_1 = var_1 - 1;
            elseif RECT.loseturn(person.Current(n).pos(1)) == 1
            luck3 = sprintf('Current Player: %d, loses a turn',n);
            set(ScoreInfoHd1,'Visible','on','String',luck3);
            person.Current(n).loseturn = 1;
            pause(1);
            elseif  RECT.gotostart(person.Current(n).pos(1)) == 1
                person.Current(n).pos(1) =1;
                person.Current(n).pos(2) =1;
                luck4 = sprintf('Current Player: %d, goes back to the start',n);
                set(ScoreInfoHd1,'Visible','on','String',luck4);
                pause(1);
            end
            
            if person.Current(n).pos(1) >= co_1 || person.Current(n).pos(2) >= co_1
            pause(1);
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,end)+5 RECT.COMMAND_DRAW(1,end)+2]...
            ,'y',[RECT.COMMAND_DRAW(2,end)+4 RECT.COMMAND_DRAW(2,end)+1],'Visible','on');
            pause(1);
            Winner = sprintf('Player %d wins!',n);
            set(ScoreInfoHd1,'Visible','on','String',Winner);
            set(Player(n),'Visible','off');
            person.Current(n).winner = 1;
            playerscore(n) = y + 1;
            y = y + 1;
            end
            if ~(person.Current(n).winner == 1)
            set(Player(n),'x',[RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+5 RECT.COMMAND_DRAW(1,person.Current(n).pos(1))+2]...
            ,'y',[RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+4+n RECT.COMMAND_DRAW(2,person.Current(n).pos(2))+1+n],'Visible','on');
            end
            end

         
   
    n = n + 1;
    if n >= t+1;
        n = 1;
        var_1 = var_1 +1;
    end
end
end
end
    


