function Mode1
%%Constant Definitions:
BOARDGAME.RESOLUTION = [];       % Game Resolution, default at [256 144]
BOARDGAME.WINDOW_SCALE = 2;     % The actual size of the window divided by resolution
BOARDGAME.FLOOR_TOP_Y = [];      % The y position of upper crust of the floor.
BOARDGAME.COMMAND_TEXT_FILE = [];   % Initializing the Command text file
BOARDGAME.DICEROLL_TEXT_FILE = [];  % Initializing the Roll text file
RECT.COMMAND = [];
BOARDGAME.DICEROLL = [];    % DICEROLL(a b) where a is roll number, and b is the player number
RECT.COMMAND_DRAW = [];        % x-coordinate of the rectangle
GAME.N_UPDATES_PER_SEC = [];
GAME.FRAME_DURATION = [];

%% Handles

%%Game Logic

draw();
GAME.MAX_FRAME_SKIP = 5;
GAME.N_UPDATE_PERSEC = 60;
GAME.FRAME_DURATION = 1/GAME.N_UPDATE_PERSEC;
        
CurrentFrameNo = double(0);

fade_time = cumsum([1 3 1]);

pause(0.5);
logo_stl = text(300, 100, 'ECEGR 1000', 'FontSize', 20, 'Color',[1 1 1], 'HorizontalAlignment', 'center');
logo_and = text(300, 130, 'Final Project', 'FontSize', 10, 'Color',[1 1 1], 'HorizontalAlignment', 'center');

stageStartTime = tic;
while 1
    loops = 0;
    curTime = toc(stageStartTime);
    while (curTime >= ((CurrentFrameNo) * GAME.FRAME_DURATION) && loops < GAME.MAX_FRAME_SKIP)
        if curTime < fade_time(1)
            set(logo_stl, 'Color',1 - [1 1 1].*max(min(curTime/fade_time(1), 1),0));
            set(logo_and, 'Color',1 - [1 1 1].*max(min(curTime/fade_time(1), 1),0));
        elseif curTime < fade_time(2)
            set(logo_stl, 'Color',[0 0 0]);
            set(logo_and, 'Color', [0 0 0]);
        else
            set(logo_stl, 'Color',[1 1 1].*max(min((curTime-fade_time(2))/(fade_time(3) - fade_time(2)), 1),0));
            set(logo_and, 'Color', [1 1 1].*max(min((curTime-fade_time(2))/(fade_time(3) - fade_time(2)), 1),0));
        end
        CurrentFrameNo = CurrentFrameNo + 1;
       loops = loops + 1;
       frame_updated = true;
    end
    if frame_updated
        drawnow;
    end
    if curTime > fade_time
      set(background,'Visible','on');
        break;
    end
end

delete(logo_stl);
delete(logo_and);
pause(1);
numberofplayers();


%pause(1.5);
%exit = sprintf('The Game is now going to close.');
%set(ScoreInfoHd1,'Visible','on','String',exit);
%pause(1); 
%delete(MainFigureHdl);
clear all;
return;


%% File Loading

%% Drawing Main Board
function draw()
    %% Parameters
    BOARDGAME.RESOLUTION = [572 536];
    BOARDGAME.WINDOW_RES = [572 536];
        MainFigureInitPos = [0 0];
        MainFigureSize = BOARDGAME.WINDOW_RES([2 1]).*2;
        MainAxesInitPos = [0 0]; %[0.1 0.1]; % The initial position of the axes IN the figure
        MainAxesSize = [572 536]; % GAME.WINDOW_RES([2 1]);
        %% Canvases:
        MainCanvas = uint8(zeros([BOARDGAME.RESOLUTION 3]));
[r c] = size(RECT.COMMAND_DRAW);
MainFigureHdl = figure('Name','Mode 1 Test','Position',[MainFigureInitPos, MainFigureSize]);
axis off;
im2 = imread('Boardgame.png');
background = image(im2,'x',[0 572],'y',[0 536],'Visible','off');

end



function numberofplayers()
    
end
end
