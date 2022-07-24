/// @description Insert description here
// You can write your code in this editor
if global.gameover == false{
	instance_create_depth(x, y, 0, obj_boundry);
	audio_play_sound(snd_closer, 1, 0);
	switch (dir){
		case ("south"):
			xadd = 0;
			yadd = 32;
			change = "east";
			break;
		case ("north"):
			xadd = 0;
			yadd = -32;
			change = "west";
			break;
		case ("east"):
			xadd = 32;
			yadd = 0;
			change = "north"
			break;
		case ("west"):
			xadd = -32;
			yadd = 0;
			change = "south"
			break;
	}

	bound = instance_place(x+xadd, y+yadd, obj_boundry)
	if bound != noone{
		if bound.outer == 1{
			dir = change;
			switch (dir){
				case ("south"):
					xadd = 0;
					yadd = 32;
					break;
				case ("north"):
					xadd = 0;
					yadd = -32;
					break;
				case ("east"):
					xadd = 32;
					yadd = 0;
					break;
				case ("west"):
					xadd = -32;
					yadd = 0;
					break;
			}	
		}
	}

	x += xadd;
	y += yadd;

	alarm_set(0, rate);
}