function new_image = move_player(position,player,player_character,old_image)
[x_min x_max y_min y_max]=displacement(player);
set(old_image,'visible','off');
if position == 1
    new_image=image([(192+x_min) (192+x_max)],[(400+y_max) (400+y_min)],player_character);
end

if position == 2
    new_image=image([(232+x_min) (232+x_max)],[(400+y_max) (400+y_min)],player_character);
end

if position == 3
    new_image=image([(272+x_min) (272+x_max)],[(400+y_max) (400+y_min)],player_character);
end

if position == 4
    new_image=image([(312+x_min) (312+x_max)],[(400+y_max) (400+y_min)],player_character);
end

if position == 5
    new_image=image([(345+x_min) (345+x_max)],[(380+y_max) (380+y_min)],player_character);
end

if position == 6
    new_image=image([(345+x_min) (345+x_max)],[(340+y_max) (340+y_min)],player_character);
end

if position == 7
    new_image=image([(315+x_max) (315+x_min)],[(320+y_max) (320+y_min)],player_character);
end

if position == 8
    new_image=image([(275+x_max) (275+x_min)],[(320+y_max) (320+y_min)],player_character);
end

if position == 9
    new_image=image([(240+x_max) (240+x_min)],[(305+y_max) (305+y_min)],player_character);
end

if position == 10
    new_image=image([(235+x_max) (235+x_min)],[(265+y_max) (265+y_min)],player_character);
end

if position == 11
    new_image=image([(200+x_max) (200+x_min)],[(255+y_max) (255+y_min)],player_character);
end

if position == 12
    new_image=image([(170+x_min) (170+x_max)],[(235+y_max) (235+y_min)],player_character);
end

if position == 13
    new_image=image([(175+x_min) (175+x_max)],[(195+y_max) (195+y_min)],player_character);
end

if position == 14
    new_image=image([(210+x_min) (210+x_max)],[(185+y_max) (185+y_min)],player_character);
end

if position == 15
    new_image=image([(250+x_min) (250+x_max)],[(185+y_max) (185+y_min)],player_character);
end

if position == 16
    new_image=image([(250+x_max) (250+x_min)],[(145+y_max) (145+y_min)],player_character);
end

if position == 17
    new_image=image([(215+x_min) (215+x_max)],[(125+y_max) (125+y_min)],player_character);
end
if position >= 17
    fprintf('Player %f finished the race!\n',player);
    new_image=image([(215+x_min) (215+x_max)],[(125+y_max) (125+y_min)],player_character);
end