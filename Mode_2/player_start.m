function current_image = player_start(player,player_character)
[x_min x_max y_min y_max]=displacement(player);
hold on
current_image = image([(192+x_min) (192+x_max)],[(400+y_max) (400+y_min)],player_character)
end

%set(gcf,'color','none') get rid of background?