function current_position = diceroll(player_position,i,name)
%function diceroll adds a random dice roll to the players current position.
x=0;%sets x to 0.
while x~=1%creates a menu asking the using to roll the dice.
    x=menu('Dice Roll','Roll');
end
roll=randi([1 6]);%creates a random dice roll from 1 to 6.
lakitu = image([400 572],[0 172],imread('lakitu.png'));%displays image in top right hand corner.
box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);%creates a box for the text.
MYtext = text(466.5,122,sprintf('%s rolled \n %.0f',name,roll),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');%displays who rolled the random dice roll.
pause(2);%pauses for 2 seconds.
set(MYtext,'visible','off');%hides the text above.
current_position=player_position+roll;%sets the current position to be the inputed one plus the random dice roll.
end