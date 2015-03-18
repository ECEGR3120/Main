function new_image = move_player(position,player,player_character_side,player_character_back,old_image)
%function move_player moves the image of the current player to their new
%location on the board based off of their current position.
[x_min x_max y_min y_max]=displacement(player); %sets the displacement for the new image using the function displacement.
set(old_image,'visible','off');%hides the old image.
if position == 1 %moves player if position is 1.
    new_image=image([(192+x_min) (192+x_max)],[(400+y_max) (400+y_min)],player_character_side);
end
if position == 2%moves player if position is 2.
    new_image=image([(232+x_min) (232+x_max)],[(400+y_max) (400+y_min)],player_character_side);
end
if position == 3%moves player if position is 3.
    new_image=image([(272+x_min) (272+x_max)],[(400+y_max) (400+y_min)],player_character_side);
end
if position == 4%moves player if position is 4.
    new_image=image([(312+x_min) (312+x_max)],[(400+y_max) (400+y_min)],player_character_side);
end
if position == 5%moves player if position is 5.
    new_image=image([(345+x_min) (345+x_max)],[(380+y_max) (380+y_min)],player_character_back);
end
if position == 6%moves player if position is 6.
    new_image=image([(345+x_min) (345+x_max)],[(340+y_max) (340+y_min)],player_character_back);
end
if position == 7%moves player if position is 7.
    new_image=image([(315+x_max) (315+x_min)],[(320+y_max) (320+y_min)],player_character_side);
end
if position == 8%moves player if position is 8.
    new_image=image([(275+x_max) (275+x_min)],[(320+y_max) (320+y_min)],player_character_side);
end
if position == 9%moves player if position is 9.
    new_image=image([(240+x_max) (240+x_min)],[(305+y_max) (305+y_min)],player_character_back);
end
if position == 10%moves player if position is 10.
    new_image=image([(235+x_max) (235+x_min)],[(265+y_max) (265+y_min)],player_character_back);
end
if position == 11%moves player if position is 11.
    new_image=image([(200+x_max) (200+x_min)],[(255+y_max) (255+y_min)],player_character_side);
end
if position == 12%moves player if position is 12.
    new_image=image([(170+x_min) (170+x_max)],[(235+y_max) (235+y_min)],player_character_back);
end
if position == 13%moves player if position is 13.
    new_image=image([(175+x_min) (175+x_max)],[(195+y_max) (195+y_min)],player_character_back);
end
if position == 14%moves player if position is 14.
    new_image=image([(210+x_min) (210+x_max)],[(185+y_max) (185+y_min)],player_character_side);
end
if position == 15%moves player if position is 15.
    new_image=image([(250+x_min) (250+x_max)],[(185+y_max) (185+y_min)],player_character_back);
end
if position == 16%moves player if position is 16.
    new_image=image([(250+x_max) (250+x_min)],[(145+y_max) (145+y_min)],player_character_side);
end
if position == 17%moves player if position is 17.
    new_image=image([(215+x_min) (215+x_max)],[(125+y_max) (125+y_min)],player_character_back);
end
if position >= 17%moves player if position is greater than 17.
    new_image=image([(215+x_min) (215+x_max)],[(125+y_max) (125+y_min)],player_character_back);
end