#region //Mudando a direção de movimentação
if place_meeting(x, y, obj_parede)
{
	if direc == 0 
	{
		direc = 1;
	}
	else if direc == 1
	{
		direc = 0	
	}
}
#endregion

#region //Direita ou Esquerda
//Direita
if direc == 0 
{
	sprite_index = spr_goblin_run
	x += vel;
}
//Esquerda
else if direc == 1
{
	sprite_index = spr_goblin_run_esq
	 x -= vel;
}
#endregion