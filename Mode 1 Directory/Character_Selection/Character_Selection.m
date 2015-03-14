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
    switch player{i}
        case 1
            player{i}.character = play_gif('mario.gif');
        case 2
            player{i}.character = play_gif('luigi.gif');
        case 3
            player{i}.character = play_gif('peach.gif');
        case 4
            player{i}.character = play_gif('koopa.gif');
        case 5
            player{i}.character = play_gif('toad.gif');
        case 6
            player{i}.character = play_gif('yoshi.gif');
        case 7
            player{i}.character = play_gif('bowser.gif');
    end
    end
end
%use 19th frame of each character for side view.

%screen shot each character at their 19th frame and edit to an image that
%we can use.

%flip axis on character picture whenever going different direction.