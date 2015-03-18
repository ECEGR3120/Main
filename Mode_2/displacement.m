function [x_min x_max y_min y_max] = displacement(player)
if player==1
    x_min=(-15);
    x_max=(15);
    y_min=(-10);
    y_max=(-40);
elseif player==2
    x_min=(-15);
    x_max=(15);
    y_min=(0);
    y_max=(-30);
elseif player==3
    x_min=(-15);
    x_max=(15);
    y_min=(10);
    y_max=(-20);
elseif player==4
    x_min=(-15);
    x_max=(15);
    y_min=(20);
    y_max=(-10);
end
end