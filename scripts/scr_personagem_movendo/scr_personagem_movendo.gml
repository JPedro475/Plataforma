// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_movendo(){
	dir = keyboard_check(vk_right);
	esq = keyboard_check(vk_left);
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
	if (!place_meeting(x,y + 1, obj_chao))
	{
		sprite_index = spr_player_jump;
		velv += grav;
	}
	
	else
	{
		if (cima)
		{
			velv =  -2.8;
		}
		/*else if (velv > 0)
		{
			image_index = 0;
			sprite_index = spr_player_fall;
		}*/
		
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
	
	#region //Ataque
	if keyboard_check_pressed(ord("Z"))
	{
		image_index = 0;
		estado = scr_personagem_atacando;
		
		//Direita
		if direc == 0 
		{
			instance_create_layer(x+20, y-8,"Colisores", obj_hitbox);	
		}
		
		//Esquerda
		else if direc ==1 
		{
			instance_create_layer(x - 20, y - 8,"Colisores", obj_hitbox);		
		}
	}
	#endregion

}


function scr_personagem_atacando()
{
	if direc == 0 
	{
		sprite_index = spr_player_attack;
	}
	else if direc ==1
	{
		sprite_index = spr_player_attack_esq;
	}
	
	if scr_animation_end()
	{
		estado = scr_personagem_movendo;
	}
}