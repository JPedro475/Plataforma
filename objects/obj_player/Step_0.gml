//Variaveis
var _right, _left, _jump, _attack, _dash;
var _chao = place_meeting(x, y + 1, obj_chao)

_right = keyboard_check(vk_right);
_left = keyboard_check(vk_left);
_jump = keyboard_check_pressed(vk_space);
_attack = keyboard_check_pressed(ord("Z"));
_dash = keyboard_check_pressed(ord("X"));

if (buff > 0) buff -= 1;


//Gravidade
if (!_chao)
{
	if (velv < max_velv * 2)
	{
	velv += GRAVIDADE * massa;
	}
}

//Maquina de estado
switch(estado)
{
	#region Parado
	case "parado":
	{
		//comportamento do estado
		sprite_index = spr_player_idle;
		
		
		//Condição de troca de Estado
		//Movendo
		if (_right || _left)
		{
			estado = "movendo";
		}
		else if (_jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * _jump) ;
			image_index = 0;
		}
		
		else if (_attack)
		{
			estado = "ataque"
			velh = 0;
			image_index = 0;
		}
		
		else if (_dash) 
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region Movendo
	case "movendo":
	{
		sprite_index = spr_player_andando;
		
		//Movimentação
		velh = (_right - _left) * max_velh;
		
		//Parado
		if (abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		else if (_jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * _jump) ;
			image_index = 0;
		}
		else if (_attack)
		{
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		else if (_dash)
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;	
	}
	#endregion
	
	#region Pulo
	case "pulo":
	{
		//Queda
		if (velv > 0)
		{
			sprite_index = spr_player_fall;
		}
		else
		{
			sprite_index = spr_player_jump;
			
		}
		
		
		if (_chao)
		{
			estado = "parado";
			velh = 0;
		}
		break;
	}
	#endregion
	
	#region Ataque
	/*case "ataque":
{
		velh = 0;
		
		
		if (combo == 0)
		{
			sprite_index = spr_player_attack;
		}
		else if (combo == 1)
		{
			sprite_index = spr_player_attack_1;
			
		}
		else if (combo == 2)
		{
			sprite_index = spr_player_attack_2;
		}
		
		//Hitbox
		if (image_index >= 2 && dano == noone && permitir_atk)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, obj_hitbox);
			dano.dano = ataque * ataque_multi;
			dano.pai = id;
			permitir_atk = false;
		}
		
		//Configuração do buff
		
		if (attack && combo < 2)
		{
			buff = room_speed;
		}
		
		if (buff && combo < 2 && image_index >= image_number - 1)
		{
			combo++; 
			image_index = 0;
			permitir_atk = true;
			ataque_multi += .5;
		if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
			
			//Zerar o buff
			
			buff = 0;
		}
		
		
		if (image_index > image_number - 1)
		{
			estado = "parado";
			velh = 0;
			combo = 0;
			permitir_atk = true;
			ataque_multi = 1;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
			if (_dash)
			{
				estado = "dash";
				image_index = 0;
				combo = 0;
				if (dano)
				{
					instance_destroy(dano, false);
					dano = noone;
				}
			}
			if (velv != 0)
		{
			estado = "pulo";
			image_index = 0;
		}
	}
		break;
}*/
	#endregion
	
	#region Defesa
	/*case "defesa":
	{
		sprite_index = spr_player_defesa;
		if (abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		else if (_jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * _jump) ;
			image_index = 0;
		}
		else if (_attack)
		{
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		else if (_dash)
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;	
	}
		
	}*/
	#endregion
	
}
