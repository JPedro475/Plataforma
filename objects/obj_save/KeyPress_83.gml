if (file_exists("save.sav"))file_delete("save.sav");
{
	
	ini_open("save_sav");
	ini_write_real("Player","x_atual",obj_player.x);
	ini_write_real("Player","y_atual",obj_player.y);
	ini_write_real("Player","vida_atual",obj_player.vida);
	ini_close();
}

show_message("Jogo Salvo");