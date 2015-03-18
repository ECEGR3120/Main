function [new_position skip new_image] = player_action(position,player,player_character,old_image)
skip=0;
new_position=position;
new_image = old_image
if position == 2
    new_position = position + 2;
elseif position == 4
    skip = 1;
elseif position == 6
    first_position = position + 3;
    new_image = move_player(position,player,player_character,old_image);
    pause(0.25);
    new_position = diceroll(first_position,player);
elseif position == 7
    new_position = position - 2;
elseif position == 8
    new_position = position + 4;
elseif position == 9
    new_position = diceroll(position,player);
elseif position == 11
    new_position = 1;
elseif position == 12
    new_position = position - 4;
elseif position == 14
    new_position = 17;
elseif position == 15
    new_position = position - 3;
    skip = 1;
end