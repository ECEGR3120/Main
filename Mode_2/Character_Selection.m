function character = character_selection
%number_players=input('How many people will be playing:');
%while (number_players <= 0) | (number_players > 4)
%    fprintf('Number of players must be from 1 to 4.\n');
%    number_payers=input('How many people will be playing:');
%end
%number_players=menu('How many players?','1','2','3','4')
player={};
%for i=1:number_players
    %player{i}.character='no';
    player_character='no';
    while player_character~=1
    player=menu('Player Selection','Mario','Luigi','Peach','Koopa','Toad','Yoshi','Bowser');
    %for g=1:i
     %   if player{i}==player{g}
      %      fprintf('Player already selected. Pick Another.\n');
       % else
    switch player
        case 1
            player_character = play_gif('mario.gif');
            if player_character==1
                character=imread('mario.PNG');
            end
        case 2
            player_character = play_gif('luigi.gif');
            if player_character==1
                character=imread('luigi.PNG');
            end
        case 3
            player_character = play_gif('peach.gif');
            if player_character==1
                character=imread('peach.PNG');
            end
        case 4
            player_character = play_gif('koopa.gif');
            if player_character==1
                character=imread('koopa.PNG');
            end
        case 5
            player_character = play_gif('toad.gif');
            if player_character==1
                character=imread('toad.PNG');
            end
        case 6
            player_character = play_gif('yoshi.gif');
            if player_character==1
                character=imread('yoshi.PNG');
            end
        case 7
            player_character = play_gif('bowser.gif');
            if player_character==1
                character=imread('bowser.PNG');
            end
    end
    end
end
%set up error for if character is already selected.

%flip axis on character picture whenever going different direction.