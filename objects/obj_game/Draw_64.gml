/// @description Insert description here
// You can write your code in this editor

if room == rm_roundend{
	draw_set_color(c_yellow);
	draw_text(20, 20, "Mole score: " + string(global.playerOneScore));
	draw_set_color(c_gray);
	draw_text(20, 40, "Robot score: " + string(global.playerTwoScore));
	draw_set_color(c_orange);
	draw_text(20, 60, "Cowboy score: " + string(global.playerThreeScore));
	draw_set_color(c_purple);
	draw_text(20, 80, "Alien score: " + string(global.playerFourScore));
	draw_set_color(c_white);
	draw_text(190, 150, "Player one: Share to continue");
	draw_text(20, 300, "Music from https://www.zapsplat.com/");
	draw_text(20, 320, "Yeehaw from https://freesound.org/people/javapimp/sounds/439191/");
}