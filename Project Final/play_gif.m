function x = play_gif(gif)
%function play_gif plays the inputed gif on the board.
dimensions = imread(gif,'frames','all');%finds the dimension of the inputed gif.
size_gif=size(dimensions);%finds the size of the gif.
frames=size_gif(end);%finds the number of frames in the inputed gif.
select='play';%sets select to play
while (select ~=1)&(select~=0)&(select~=2)%loops while select does not equal 1, 2, or 0.
    for g=1:2 %loops twice.
        if g==1 %sets frames to frames if g = 1.
            frames=frames;
        elseif g==2 %sets frames to (6/total) of total frames.
            frames=(6/frames)*frames;
        end
        for i=1:frames %loops from 1 to frames.
            hold on %holds onto the current figure.
            [I,map] = imread(gif,i); %reads the current frame of the gif.
            character = image([400 572],[0 250],I); %displays the current frame of the gif.
            colormap(map)%sets the color map of the image.
            axis off %removes the axis.
            pause(.0005)%pauses for 0.0005 seconds.
            set(character,'Visible','off');%hides the current image.
        end
    end
    character = image([400 572],[0 250],I);%displays the character image.
    colormap(map)%sets the color map of the image.
    select=menu('Is this the character you want?','Yes','No');%asks the user if this is the character they want.
    set(character,'Visible','off');%hides the image.
end
if select==1
    x=1;%if the character selects yes then x is set to 1.
else
    x=0;%if character is not selected then x is set to 0.
end
end