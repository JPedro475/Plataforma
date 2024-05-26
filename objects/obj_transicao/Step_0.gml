//Já mudei de room
if (mudei)
{
	alpha -= .02;
}
else //Não mudou de room
{
	alpha += .02;
}

//Se a tela escureceu faz a transição de room

if(alpha >= 1)
{
	room_goto(destino);
	
	//Posição do player
	obj_player.x = destino_x;
	obj_player.y = destino_y;
}

if (mudei && alpha <= 0)
{
	instance_destroy();
}