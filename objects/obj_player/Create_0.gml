/// @description Insert description here
// You can write your code in this editor

moveTimer = 15;
bombTimer = 100;
glueTimer = 100;
glueable = true;
movable = true;
bombable = true;
facing = "down";
grabbed = noone;

switch (cnumber){
	case (0):
		sprite_index = spr_player_one;
		death = snd_mole_death;
		global.playerOneScore++;
		break;
	case (1):
		sprite_index = spr_player_two;
		death = snd_robot_death;
		global.playerTwoScore++;
		break;
	case (2):
		sprite_index = spr_player_three;
		death = snd_cowbow_death;
		global.playerThreeScore++;
		break;
	case (3):
		sprite_index = spr_player_four;
		death = snd_alien_death;
		global.playerFourScore++;
		break;
}