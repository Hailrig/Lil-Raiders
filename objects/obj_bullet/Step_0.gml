/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_boundry){
	audio_play_sound(snd_bullet, 1, 0);
	instance_destroy(id);
}