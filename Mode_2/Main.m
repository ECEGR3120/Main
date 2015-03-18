
boardgame
board_tiles
%lakitu = image([400 572],[0 172],imread('lakitu.png'));
%box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
number_players=menu('How many players?','1','2','3','4');
current_turn=1;
finish_line=[];
for i=1:4
    player(i)= struct('position',17,'num',i,'character',0,'current_image',0,'turns',0,'skip',0);
end
for i=1:number_players
    player(i).character=Character_Selection;
    player(i).position=1;
    player(i).current_image = player_start(player(i).num,player(i).character);
end
while (player(1).position<17)|(player(2).position<17)|(player(3).position<17)|(player(4).position<17)
    for i=1:number_players
        if player(i).skip==1
            player(i).skip=0
        else
            if player(i).position < 17
                player(i).position = diceroll(player(i).position,i);
                player(i).current_image = move_player(player(i).position,player(i).num,player(i).character,player(i).current_image);
                player(i).turns = player(i).turns+1;
                [player(i).position player(i).skip player(i).current_image] = player_action(player(i).position,player(i).num,player(i).character,player(i).current_image);
                pause(0.25);
                player(i).current_image = move_player(player(i).position,player(i).num,player(i).character,player(i).current_image);
                if player(i).position >= 17
                    finish_line=[finish_line player(i).num];
                end
                else
                 if current_turn==player(i).turns
                 finish_line=[finish_line player(i).num];
                 end
            end
        end
    end
    current_turn=current_turn+1;
    end
for g=1:number_players
    fprintf('%.0f place: Player %.0f\n',g,finish_line(g));
end