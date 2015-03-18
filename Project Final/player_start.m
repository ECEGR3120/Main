function current_image = player_start(player,player_character)
%player_start sets the inital character at the start line.
[x_min x_max y_min y_max]=displacement(player);%sets the displacement based on which player is moving.
hold on%holds onto the image.
current_image = image([(192+x_min) (192+x_max)],[(400+y_max) (400+y_min)],player_character);%sets the current image of the player at the starting line.
end