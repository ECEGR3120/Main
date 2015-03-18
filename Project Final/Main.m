repeat_program=1;%sets repeat program to 1.
while repeat_program==1%repeats entire program until repeat_program ~= 1.
Gamemode=menu('Which game mode would you like to play?','1 - Automatic','2 - Player Run');%asks the user which gamemode they wish to run.
switch Gamemode %switches gamemode.
    case 1 %if case 1 it runs mode 1.
        clear all;
        Mode1;
    case 2     %If case 2 then run rest of main.
        clear all;
boardgame %plays the function boardgame.
board_tiles %plays the function board_tiles.
number_players=menu('How many players?','1','2','3','4'); %sets # of players.
finish_line=[];%sets finish_line to an empty vector.
for i=1:4 %loops from 1 to 4 (max number of players possible).
    player(i)= struct('position',17,'num',i,'character_side',0,'character_back',0,'current_image',0,'turns',0,'skip',0,'name','something'); %creates a structure "player" for players 1 to 4.
end
for i=1:number_players %loops from 1 to number of players playing the game.
    [player(i).character_side player(i).character_back player(i).name]=Character_Selection;%uses function character selection to set character images and names.
    player(i).position=1;%sets the characters playing positions to 1.
    player(i).current_image = player_start(player(i).num,player(i).character_side);%sets the current image using the function plyaer_start.
end
while (player(1).position<17)|(player(2).position<17)|(player(3).position<17)|(player(4).position<17)%loops while at least one player position is not at 17.
    for i=1:number_players%loops from 1 to number of players.
        if player(i).skip==1%skips the player if player.skip is set to 1.
            player(i).skip=0;%resets player.skip to 0.
        else
            if player(i).position < 17 %runs if player position is less than 17.
                player(i).position = diceroll(player(i).position,i,player(i).name);%sets the new player position using the function diceroll.
                player(i).current_image = move_player(player(i).position,player(i).num,player(i).character_side,player(i).character_back,player(i).current_image);%sets the current image and moves the player using the function move_player.
                player(i).turns = player(i).turns+1;%counts player turn up by 1.
                [player(i).position player(i).skip player(i).current_image] = player_action(player(i).position,player(i).num,player(i).character_side,player(i).character_back,player(i).current_image,player(i).name);%sets a new player image, position, and skip using the player_action function.
                pause(0.25);%pauses for 0.25 seconds.
                player(i).current_image = move_player(player(i).position,player(i).num,player(i).character_side,player(i).character_back,player(i).current_image);%sets the new current player image and moves the player using the function move_player.
                if player(i).position >= 17 %runs if player position is 17 or greater.
                    finish_line=[finish_line player(i).num];%indexes player name when they finish.
                    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);%creates a rectangle.
                    MYtext = text(466.5,122,sprintf('%s\n finished!',player(i).name),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');%Shows text on the board saying that the player has finsihed.
                    set(player(i).current_image,'visible','off');%removes the finished players token from the board.
                    pause(1);%pauses for 1 second.
                end
            end
        end
    end
end
box=rectangle('position',[150 100 200 300],'FaceColor', 'b','EdgeColor', [0 0 0], 'LineWidth', 4);%creats a box on the board.
y=65;%sets y to 65.
y_im=65;%sets y_im to 65.
for g=1:number_players %loops for 1 to total number of players playing.
    y=y-65;%counts down by 65 for each loop.
    y_im=y_im-65;%counts down by 65 for each loop.
    text(250,(140-y),sprintf('%.0f place: %s\n',g,player(finish_line(g)).name),'FontName','Cooper Black','FontSize',18,'HorizontalAlignment','center','VerticalAlignment','middle');%creates a text saying what place the player finished in.
    image([230 270],[(140-y_im) (180-y_im)],player(finish_line(g)).character_side);%displays an image of the character under the text. 
end
    otherwise %displays error if neither mode is selected.
       msgbox('No option picked, quitting game','','warn')   
       return;
end
repeat_program=menu('Run program again?','Yes','No');%asks the user if they want to run the program again.
end