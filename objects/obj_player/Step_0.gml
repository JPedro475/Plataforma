//Checando o obj_transicao
if(instance_exists(obj_transicao)) exit;


//Invencibilidade
if (invencivel && tempo_invencivel >0)
{
	tempo_invencivel--;
	//Alterar o valor entre 1 e -1
	image_alpha = max(sin(get_timer()/100000), 0.2);
}
else
{
	invencivel = false;
	image_alpha = 1;
}


//Variaveis
var _right, _left, _jump, _attack, _defesa;
var _chao = place_meeting(x, y + 1, obj_chao)

_right = keyboard_check(vk_right);
_left = keyboard_check(vk_left);
_jump = keyboard_check_pressed(vk_space);
_attack = keyboard_check_pressed(ord("Z"));
_defesa = keyboard_check(ord("X"));

if (buff > 0) buff -= 1;

//Movimentação
	velh = (_right - _left) * max_velh * global.vel_multi;

//Gravidade
if (!_chao)
{
	if (velv < max_velv * 2)
	{
	velv += GRAVIDADE * massa * global.vel_multi;
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
		if (velh != 0)
		{
			estado = "movendo";
		}
		else if (_jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * _jump);
			image_index = 0;
		}
		
		else if (_attack)
		{
			estado = "ataque"
			velh = 0;
			image_index = 0;
		}
		
		else if (_defesa) 
		{
			estado = "defesa";
			velh = 0;
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region Movendo
	case "movendo":
	{
		sprite_index = spr_player_andando;
		
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
		else if (_defesa)
		{
			estado = "defesa";
			velh = 0;
			image_index = 0;
		}
		
		break;	
	}
	#endregion
	
	#region Pulo
	case "pulo":
	{
		//Mover enquanto pula
		velh = (_right - _left) * max_velh;
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
	case "ataque":
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
			if (_defesa)
			{
				estado = "defesa";
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
}
	#endregion
	
 	#region Defesa
	/*case "defesa":
	{
		sprite_index = spr_player_defesa;
		
		//Saindo do estado
		 if (image_index >= image_index)
		{
			estado = "parado"
			velh = 0;
		}
		break;
	}*/
	
	#endregion
	
	#region Hit
	case "hit":
	{
		if(sprite_index != spr_player_hurt)
		{
			sprite_index = spr_player_hurt;
			image_index = 0;
			
			//Screenshake
			screenshake(3);
			
			//invencivel
			invencivel = true;
			tempo_invencivel = invencivel_timer;
		}
		
		//Reduz a vida do jogador
		if (estado != "defesa")
		{
		obj_player.vida -= 1;
		}
		
		//Ficando parado apos hit
		velh = 0;
		
		//Checando se dve morrer
		if (vida_atual > 0)
		{
			if(image_index >= image_number - 1)
			{
				estado = "parado";
			}
		}
		else
		{
			if(image_index >= image_number - 1)
			{
				estado = "morto";
			}
		}
		
		if(image_index >= image_number - 1)
		{
			estado = "parado";
		}
		break;
	}
	#endregion
	
	#region Morto
	case "morto":
	{
		//Check do controle
		if(instance_exists(obj_jogo_controle))
		{
			with(obj_jogo_controle)
			{
				game_over = true;
			}
		}
		
		velh=0
		if(sprite_index != spr_player_dead)
		{
			image_index = 0;
			sprite_index = spr_player_dead;
		}
		
		if (image_index >= image_number -1)
		{
			image_index = image_number -1;
		}
		break;
	}
	#endregion
	
	//Estado default
	default:
	{
		estado = "parado";
	}
	
}

if(keyboard_check(vk_enter)) game_restart();
