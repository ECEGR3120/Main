function x = play_gif(gif)
dimensions = imread(gif,'frames','all');
size_gif=size(dimensions);
frames=size_gif(end);
select='play';
while (strcmpi('yes',select)==0) & (strcmpi('no',select)==0)
    %while strcmpi('play',select)==1
    for g=1:2
        if g==1
            frames=frames;
        elseif g==2
                frames=(6/frames)*frames
        end
        for i=1:frames
            [I,map] = imread(gif,i);
            image(I)
            colormap(map)
            axis off
            pause(.0005)
            %  end
        end
    end
    select=input('is this the character you want:','s');
end
if strcmpi('yes',select)==1
    x='yes';
else 
    x = 'no';
end
end