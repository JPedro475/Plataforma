if (file_exists("save.ini"))file_delete("save.ini");
{
	
	ini_open("save_ini");
	ini_write_real("Player","x_atual",obj_player.x);
	ini_write_real("Player","y_atual",obj_player.y);
	ini_write_real("Player","vida_atual",obj_player.vida);
	ini_close();
}

show_message("Jogo Salvo");