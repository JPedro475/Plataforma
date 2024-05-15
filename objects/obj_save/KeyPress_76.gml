if(file_exists("save.ini"))
{
	ini_open("save.ini");
	obj_player.x = ini_read_real("Player","x_atual",0);
	obj_player.y = ini_read_real("Player","y_atual",0);
	obj_player.vida = ini_read_real("Player", "vida_atual",0);
	ini_close();
}
show_message("Leitura do save completa");