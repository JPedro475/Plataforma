if (file_exists("save.sav"))
{
	ini_open("save.sav");
	obj_player.x = ini_read_real("Jogador","x_atual",0);
	obj_player.y = ini_read_real("Jogador","y_atual",0);
	obj_player.vida = ini_read_real("Jogador", "vida_atual",5);
	ini_close();
}