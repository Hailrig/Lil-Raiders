/// @description Insert description here
// You can write your code in this editor

randomize();


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

global.playerOneScore = 0;
global.playerTwoScore = 0;
global.playerThreeScore = 0;
global.playerFourScore = 0;