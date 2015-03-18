function board_tiles
hold on

viscircles([192 400],15,'EdgeColor','b') %1 start
pause(0.15)

viscircles([232 400],15,'EdgeColor','b') %2 Jump Ahead 2
mushroom = image([222 242],[390 410],imread('mushroom.png'));
pause(0.15)

viscircles([272 400],15,'EdgeColor','b') %3
pause(0.15)

viscircles([312 400],15,'EdgeColor','b') %4 Lose 1 turn
banana = image([302 322],[390 410],imread('banana.png'));
pause(0.15)

viscircles([345 380],15,'EdgeColor','b') %5
pause(0.15)

viscircles([345 340],15,'EdgeColor','b') %6 Jump ahead 3 & roll again
bullet_bill = image([335 355],[330 350],imread('Bullet_Bill.png'));
pause(0.15)

viscircles([315 320],15,'EdgeColor','b') %7 Go back 2
green_shell = image([305 325],[310 330],imread('Green_Shell.png'));
pause(0.15)

viscircles([275 320],15,'EdgeColor','b') %8 Jump Ahead 4
golden_mushrooom = image([265 285],[310 330],imread('Golden_Mushroom.png'));
pause(0.15)

viscircles([240 305],15,'EdgeColor','b') %9 Roll Again
random = image([230 250],[295 315],imread('Random.png'));
pause(0.15)

viscircles([235 265],15,'EdgeColor','b') %10 
pause(0.15)

viscircles([200 255],15,'EdgeColor','b') %11 Go back to start
blue_shell = image([190 210],[245 265],imread('Blue_Shell.png'));
pause(0.15)

viscircles([170 235],15,'EdgeColor','b') %12 Go back 4 spaces
red_shell = image([160 180],[225 245],imread('Red_shell.png'));
pause(0.15)

viscircles([175 195],15,'EdgeColor','b') %13
pause(0.15)

viscircles([210 185],15,'EdgeColor','b') %14 Jump to finish
super_star = image([200 220],[175 195],imread('Super_Star.png'));
pause(0.15)

viscircles([250 185],15,'EdgeColor','b') %15 Go back three spaces and lose turn
thunderbolt = image([240 260],[175 195],imread('ThunderBolt.png'));
pause(0.15)

viscircles([250 145],15,'EdgeColor','b') %16
pause(0.15)

viscircles([215 125],15,'EdgeColor','b') %17 End
end