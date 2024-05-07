dir = keyboard_check(ord("D"));
esq = keyboard_check(ord("A"));
cima = keyboard_check_pressed(vk_space);

//Movimentação
velh = (dir - esq) * vel;

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

#region //Gravidade
if !place_meeting(x,y + 1, obj_chao)
{
	velv += grav;
}
else
{
	if cima
	{
		velv =  -2.8;
	}
}
#endregion

#region //Colisão horizontal
if place_meeting(x + velh ,y, obj_chao)
{
	while !place_meeting(x + sign(velh), y, obj_chao)
	{
		x += sign(velh);
	}
	velh = 0
}

x += velh;

#endregion

#region //Colisão Vertical
if place_meeting(x, y + velv, obj_chao)
{
	while !place_meeting(x , y + sign(velv), obj_chao)
	{
		 y += sign(velv);
	}
	velv = 0;
}

y += velv;
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
