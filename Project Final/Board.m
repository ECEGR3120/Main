BOARDGAME.RESOLUTION = [572 536];
    BOARDGAME.WINDOW_RES = [572 536];
        MainFigureInitPos = [0 0];
        MainFigureSize = BOARDGAME.WINDOW_RES([2 1]).*2;
        MainAxesInitPos = [0 0]; %[0.1 0.1]; % The initial position of the axes IN the figure
        MainAxesSize = [572 536]; % GAME.WINDOW_RES([2 1]);
        MainCanvas = uint8(zeros([BOARDGAME.RESOLUTION 3]));
%[r c] = size(RECT.COMMAND_DRAW);
MainFigureHdl = figure('Name','Mode 1 Test','Position',[MainFigureInitPos, MainFigureSize]);
axis off;
im2 = imread('Boardgame.png');
background = image(im2,'x',[0 572],'y',[0 536],'Visible','on');
%axis off

viscircles([192 400],15,'EdgeColor','b') %1 start
pause(0.15)

viscircles([232 400],15,'EdgeColor','b') %2 Jump Ahead 2
mushroom=imread('mushroom.png');
hold on
mushroom_im=image([222 242],[390 410],mushroom)
set(gca,'color','none')
pause(0.15)

viscircles([272 400],15,'EdgeColor','b') %3
pause(0.15)

viscircles([312 400],15,'EdgeColor','b') %4 Lose 1 turn
pause(0.15)

viscircles([345 380],15,'EdgeColor','b') %5
pause(0.15)

viscircles([345 340],15,'EdgeColor','b') %6 Jump ahead 3 & roll again
pause(0.15)

viscircles([315 320],15,'EdgeColor','b') %7 Go back 2
pause(0.15)

viscircles([275 320],15,'EdgeColor','b') %8 Jump Ahead 4
pause(0.15)

viscircles([240 305],15,'EdgeColor','b') %9 Roll Again
pause(0.15)

viscircles([235 265],15,'EdgeColor','b') %10 
pause(0.15)

viscircles([200 255],15,'EdgeColor','b') %11 Go back to start
pause(0.15)

viscircles([170 235],15,'EdgeColor','b') %12 Go back 4 spaces
pause(0.15)

viscircles([175 195],15,'EdgeColor','b') %13
pause(0.15)

viscircles([210 185],15,'EdgeColor','b') %14 Jump to finish
pause(0.15)

viscircles([250 185],15,'EdgeColor','b') %15 Go back three spaces and lose turn
pause(0.15)

viscircles([250 145],15,'EdgeColor','b') %16 
pause(0.15)

viscircles([215 125],15,'EdgeColor','b') %17 End