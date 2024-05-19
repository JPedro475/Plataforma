if(global.pause)
{
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

script_execute(estado);

#region //Direção
	if dir 
	{
		direc = 0;
		sprite_index = spr_player_andando;
	}
	else if esq
	{
		direc = 1;
		sprite_index = spr_player_andando_esq;
	}
	else
	{
		
		if direc == 0
		{
			sprite_index = spr_player_idle;
		}
		else if  direc == 1 
		{
			sprite_index = spr_player_idle_esq;
		}
	}
	#endregion

#region //Combate
if alarm[0] > 0
{
	if image_alpha >= 1 
	{
		alfa_hit = -0.05;
	}
	else if image_alpha <= 0
	{
		alfa_hit = 0.05;
	}
	
	image_alpha += alfa_hit;
} 
else 
{
	image_alpha = 1;
}
#endregion
