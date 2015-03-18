function current_position = diceroll(player_position,i)
x=0;
while x~=1
x=menu('Dice Roll','Roll');
end
roll=randi([1 6]);
lakitu = image([400 572],[0 172],imread('lakitu.png'));
box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
MYtext = text(464.5,122,sprintf('Player %.0f rolled \n %.0f',i,roll),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
pause(.75);
current_position=player_position+roll;
%new_image = move_player(player_position,player);
%current_image=new_image;
end