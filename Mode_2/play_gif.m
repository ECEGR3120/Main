function x = play_gif(gif)
dimensions = imread(gif,'frames','all');
size_gif=size(dimensions);
frames=size_gif(end);
select='play';
while (select ~=1)&(select~=0)&(select~=2)
    %while strcmpi('play',select)==1
    for g=1:2
        if g==1
            frames=frames;
        elseif g==2
                frames=(6/frames)*frames;
        end
        for i=1:frames
            hold on
            [I,map] = imread(gif,i);
            character = image([400 572],[0 250],I);
            colormap(map)
            axis off
            pause(.0005)
            set(character,'Visible','off')
        end
    end
     character = image([400 572],[0 250],I);
            colormap(map)
    select=menu('Is this the character you want?','Yes','No');
    set(character,'Visible','off');
end
if select==1
    x=1;
else 
    x=0
end
end