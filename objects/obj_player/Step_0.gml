/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(cnumber, 0.6);
moveX = gamepad_axis_value(cnumber, gp_axislh);
moveY = gamepad_axis_value(cnumber, gp_axislv);
lookX = gamepad_axis_value(cnumber, gp_axisrh);
lookY = gamepad_axis_value(cnumber, gp_axisrv);
bomb = gamepad_button_check_pressed(cnumber, gp_face1);
grab = gamepad_button_check_pressed(cnumber, gp_shoulderrb);
glue = gamepad_button_check_pressed(cnumber, gp_shoulderlb);

currentx = x;
currenty = y;

if (movable == true and moveX > 0){
	if place_empty(x+32, y, obj_boundry) and place_empty(x+32, y, obj_bomb) and place_empty(x+32, y, obj_player){
		wall = instance_place(x+32, y, obj_wall);
		if wall == noone{
			x += 32;
			movable = false;
			alarm_set(0, moveTimer);
			if grabbed != noone{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		} else if place_empty (x+64, y) and (wall.grabbed == false or wall == grabbed){
			x += 32;
			movable = false;
			alarm_set(0, moveTimer);
			wall.x+=32;
			if grabbed != noone and wall != grabbed{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		}
	}
}

if (movable == true and moveX < 0){
	if place_empty(x-32, y, obj_boundry) and place_empty(x-32, y, obj_bomb) and place_empty(x-32, y, obj_player){
		wall = instance_place(x-32, y, obj_wall);
		if wall == noone{
			x -= 32;
			movable = false;
			alarm_set(0, moveTimer);
			if grabbed != noone{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		} else if place_empty (x-64, y) and (wall.grabbed == false or wall == grabbed){
			x -= 32;
			movable = false;
			alarm_set(0, moveTimer);
			wall.x-=32;
			if grabbed != noone and wall != grabbed{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		}
	}
}

if (movable == true and moveY > 0){
	if place_empty(x, y+32, obj_boundry) and place_empty(x, y+32, obj_bomb) and place_empty(x, y+32, obj_player){
		wall = instance_place(x, y+32, obj_wall);
		if wall == noone{
			y += 32;
			movable = false;
			alarm_set(0, moveTimer);
			if grabbed != noone{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		} else if place_empty (x, y+64) and (wall.grabbed == false or wall == grabbed){
			y += 32;
			movable = false;
			alarm_set(0, moveTimer);
			wall.y+=32;
			if grabbed != noone and wall != grabbed{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		}
	}
}

if (movable == true and moveY < 0){
	if place_empty(x, y-32, obj_boundry) and place_empty(x, y-32, obj_bomb) and place_empty(x, y-32, obj_player){
		wall = instance_place(x, y-32, obj_wall);
		if wall == noone{
			y -= 32;
			movable = false;
			alarm_set(0, moveTimer);
			if grabbed != noone{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		} else if place_empty (x, y-64) and (wall.grabbed == false or wall == grabbed){
			y -= 32;
			movable = false;
			alarm_set(0, moveTimer);
			wall.y-=32;
			if grabbed != noone and wall != grabbed{
				grabbed.x = currentx;
				grabbed.y = currenty;
			}
		}
	}
}

if place_meeting(x, y, obj_bullet) or place_meeting(x, y, obj_boundry){
	die();
}

function die(){
	if grabbed != noone{
		grabbed.image_index = 0;
		grabbed.holding = noone;
		grabbed = noone;
	}
	audio_play_sound(death, 0, 0);
	global.players--;
	switch (cnumber){
		case (0):
			global.playerOneScore--;
			break;
		case (1):
			global.playerTwoScore--;
			break;
		case (2):
			global.playerThreeScore--;
			break;
		case (3):
			global.playerFourScore--;
			break;
		
	}
	instance_destroy(id);
}

if (lookY < 0 or moveY < 0){
	facing = "up";
	image_index = 2;
}
if (lookY > 0 or moveY > 0){
	facing = "down";
	image_index = 0;
}
if (lookX < 0 or moveX < 0){
	facing = "left";
	image_index = 3;
}
if (lookX > 0 or moveX > 0){
	facing = "right";
	image_index = 1;
}

switch(facing){
	case "up":
		xadd = 0;
		yadd = -32;
		break;
	case "down":
		xadd = 0;
		yadd = 32;
		break;
	case "right":
		xadd = 32;
		yadd = 0;
		break;
	case "left":
		xadd = -32;
		yadd = 0;
}

if (bombable == true and bomb == true){
	if (place_empty(x+xadd, y+yadd)){
		bombable = false;
		alarm_set(1, bombTimer);
		instance_create_depth(x+xadd, y+yadd, 0, obj_bomb);
	}
}

if grab == true{
	if grabbed == noone{
		wall = instance_place(x+xadd, y+yadd, obj_wall)
		if wall != noone and wall.grabbed == false{
			audio_play_sound(snd_grab, 1, 0);
			grabbed = wall;
			grabbed.grabbed = true;
			grabbed.holding = id;
			grabbed.image_index = 1;
		}
	}
	else{
		grabbed.image_index = 0;
		grabbed.grabbed = false;
		grabbed = noone;
	}
}

wall = instance_place(x+xadd, y+yadd, obj_wall);
if (glue == true and glueable == true and wall != noone and wall.grabbed == false){
	audio_play_sound(snd_glue, 1, 0);
	glueable = false;
	bound = instance_create_depth(wall.x, wall.y, 0, obj_boundry);
	bound.outer = 0;
	instance_destroy(wall);
	alarm_set(2, glueTimer);
}










