/// @description Insert description here
// You can write your code in this editor

global.gameover = false;
global.players = 4;
closer = false;
speeder = false;
if !audio_is_playing(snd_music){
	audio_play_sound(snd_music, 1, 1);
}