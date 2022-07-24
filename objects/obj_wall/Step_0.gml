/// @description Insert description here
// You can write your code in this editor


if place_meeting(x, y, obj_boundry){
	if holding != noone and instance_exists(holding){
		holding.grabbed = noone;
	}
	instance_destroy(id);
}