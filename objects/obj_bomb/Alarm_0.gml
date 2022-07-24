/// @description Insert description here
// You can write your code in this editor

//instance_create_depth(x-64, y-64, 0, obj_boom);
this = instance_create_depth(x+32, y, 0, obj_bullet);
this.dir = "east";
this.image_index = 1;
this = instance_create_depth(x-32, y, 0, obj_bullet);
this.dir = "west";
this.image_index = 3;
this = instance_create_depth(x, y+32, 0, obj_bullet);
this.dir = "south";
this.image_index = 0;
this = instance_create_depth(x, y-32, 0, obj_bullet);
this.dir = "north";
this.image_index = 2;
audio_play_sound(snd_explosion, 1, 0);
sprite_index = spr_explosion;
alarm_set(1, 15);