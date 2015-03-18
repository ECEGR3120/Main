function [character_1 character_2 name] = character_selection
%Character_selection lets the current player select the character they want
%to be.
player={};%sets player to an empty cell.
player_character='no';%sets player character to 'no'.
while player_character~=1 %loops while player character does not equal 1.
    player=menu('Player Selection','Mario','Luigi','Peach','Koopa','Toad','Yoshi','Bowser');%creates a menu for the user to pick a character.
    switch player
        case 1 %displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('mario.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('mario.PNG');
                character_2=imread('mario_back.PNG');
                name='Mario';
            end
        case 2 %displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('luigi.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1 %if player says yes then then sets images and name to that player.
                character_1=imread('luigi.PNG');
                character_2=imread('luigi_back.PNG');
                name='Luigi';
            end
        case 3%displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('peach.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('peach.PNG');
                character_2=imread('peach_back.PNG');
                name='Peach';
            end
        case 4%displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('koopa.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('koopa.PNG');
                character_2=imread('koopa_back.PNG');
                name='Koopa';
            end
        case 5%displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('toad.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('toad.PNG');
                character_2=imread('toad_back.PNG');
                name='Toad';
            end
        case 6%displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('yoshi.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('yoshi.PNG');
                character_2=imread('yoshi_back.PNG');
                name='Yoshi';
            end
        case 7%displays the character mario and asks if the user wishs to be them.
            player_character = play_gif('bowser.gif');%uses function play_gif to play a gif of rotating character.
            if player_character==1%if player says yes then then sets images and name to that player.
                character_1=imread('bowser.PNG');
                character_2=imread('bowser_back.PNG');
                name='Bowser';
            end
    end
end
end