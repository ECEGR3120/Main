number_players=input('How many people will be playing:');
while (number_players <= 0) | (number_players > 4)
    fprintf('Number of players must be from 1 to 4.\n');
    number_payers=input('How many people will be playing:');
end
player={};
for i=1:number_players
    player{i}.character='no';
    while strcmpi('no',player{i}.character)==1
    player{i}=menu('Player Selection','Mario','Luigi','Peach','Koopa','Toad','Yoshi','Bowser');
    %for g=1:i
     %   if player{i}==player{g}
      %      fprintf('Player already selected. Pick Another.\n');
       % else
    switch player{i}
        case 1
            player{i}.character = play_gif('mario.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('mario.PNG');
            end
        case 2
            player{i}.character = play_gif('luigi.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('luigi.PNG');
            end
        case 3
            player{i}.character = play_gif('peach.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('peach.PNG');
            end
        case 4
            player{i}.character = play_gif('koopa.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('koopa.PNG');
            end
        case 5
            player{i}.character = play_gif('toad.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('toad.PNG');
            end
        case 6
            player{i}.character = play_gif('yoshi.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('yoshi.PNG');
            end
        case 7
            player{i}.character = play_gif('bowser.gif');
            if strcmpi('yes',player{i}.character)==1
                player{i}.character=imread('bowser.PNG');
            end
    end
        end
   % end
   % end
end
%use 19th frame of each character for side view.

%screen shot each character at their 19th frame and edit to an image that
%we can use.

%set up error for if character is already selected.

%flip axis on character picture whenever going different direction.