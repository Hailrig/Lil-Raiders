/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_escape){
	game_end();
}
restart1 = gamepad_button_check_pressed(0, gp_select);
restart2 = gamepad_button_check_pressed(0, gp_select);
restart3 = gamepad_button_check_pressed(0, gp_select);
restart4 = gamepad_button_check_pressed(0, gp_select);

if global.players < 2 and alarm_get(0) = -1{
	global.gameover = true
	alarm_set(0, 100);
}
if global.players < 4 and closer == false{
	closer = true;
	close = instance_create_depth(32, 32, -1, obj_closer);
}

if global.players < 3 and speeder = false{
	speeder = true;
	close.rate = 20;
}

if room == rm_roundend and restart1 == true or restart2 == true or restart3 == true or restart4 == true{
	rm = irandom_range(1, 5);

	switch (rm){
		case (1):
			room_goto(rm_room1);
			break;
		case (2):
			room_goto(rm_room2);
			break;
		case (3):
			room_goto(rm_room3);
			break;
		case (4):
			room_goto(rm_room4);
			break;
		case (5):
			room_goto(rm_room5);
			break;
	}
}