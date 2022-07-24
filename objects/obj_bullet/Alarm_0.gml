/// @description Insert description here
// You can write your code in this editor


switch (dir){
	case ("north"):
		y-=32
		break;
	case ("south"):
		y+=32;
		break;
	case ("east"):
		x+=32;
		break;
	case ("west"):
		x-=32;
		break;
}
alarm_set(0, 10);