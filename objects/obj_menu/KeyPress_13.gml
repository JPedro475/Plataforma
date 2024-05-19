if (index == 0){
	room_goto_next();
	
}else if (index == 3){
	game_end();
}else if (index == 1){
	if(file_exists("save.sav"))
	{
		ini_open("save.sav");
		obj_player.x = ini_read_real("Player","x_atual",0);
		obj_player.y = ini_read_real("Player","y_atual",0);
		obj_player.vida = ini_read_real("Player", "vida_atual",5);
		ini_close();
	}
}
else if (index == 2)
{
	room_goto(Opcoes);
}
audio_play_sound(snd_enter, 2, false);