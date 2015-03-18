function [new_position skip new_image] = player_action(position,player,player_character_side,player_character_back,old_image,name)
%function player_action determines which action is performed based on their
%current position.
skip=0;%sets skip to 0.
new_position=position;%sets new position to position inputed.
new_image = old_image;%sets the new image to the inputed one.
if position == 2 %performs action of position 2 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Red Mushroom! \n Move up two.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = position + 2;
elseif position == 4%performs action of position 4 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Slipped on a\n banana. Lose\n one turn.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    skip = 1;
elseif position == 6%performs action of position 6 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Bullet Bill!\n Move Ahead\n three and\n roll again.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    first_position = position + 3;
    new_image = move_player(position,player,player_character_side,player_character_back,old_image);
    pause(0.25);
    new_position = diceroll(first_position,player,name);
elseif position == 7%performs action of position 7 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Green Shell!\n Go back two.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = position - 2;
elseif position == 8%performs action of position 8 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Golden\n Mushroom! Go \n forward two.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = position + 4;
elseif position == 9%performs action of position 9 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Random Box!\n Roll Again.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = diceroll(position,player,name);
elseif position == 11%performs action of position 11 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Blue Shell!\n Go back to\n start.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = 1;
elseif position == 12%performs action of position 12 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Red shell!\n Go back\n four spaces.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = position - 4;
elseif position == 14%performs action of position 14 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Super star!\n Jump to\n finish.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = 17;
elseif position == 15%performs action of position 15 and tells the players what that action is.
    box=rectangle('position',[405 75 120 100],'FaceColor', [1 1 1],'EdgeColor', [0 0 0], 'LineWidth', 4);
    MYtext = text(466.5,122,sprintf('Thunderbolt!\n Go back three\n spaces and\n lose turn.'),'FontName','Cooper Black','FontSize',16,'HorizontalAlignment','center','VerticalAlignment','middle');
    new_position = position - 3;
    skip = 1;
end