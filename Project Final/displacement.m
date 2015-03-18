function [x_min x_max y_min y_max] = displacement(player)
%function displacement determines what the displacement from the current
%tile should be based on which player it is.
if player==1 %sets displacement for character 1.
    x_min=(-15);
    x_max=(15);
    y_min=(-10);
    y_max=(-40);
elseif player==2%sets displacement for character 1.
    x_min=(-15);
    x_max=(15);
    y_min=(0);
    y_max=(-30);
elseif player==3%sets displacement for character 1.
    x_min=(-15);
    x_max=(15);
    y_min=(10);
    y_max=(-20);
elseif player==4%sets displacement for character 1.
    x_min=(-15);
    x_max=(15);
    y_min=(20);
    y_max=(-10);
end
end