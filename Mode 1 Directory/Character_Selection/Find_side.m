i=19;
gif=input('gif:','s');
[I,map] = imread(gif,i);
            image(I)
            colormap(map)