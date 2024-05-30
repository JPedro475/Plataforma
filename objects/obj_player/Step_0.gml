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
var _chao = place_meeting(x, y + 1, obj_chao)

if (buff > 0) buff -= 1;

//Movimentação
right = keyboard_check(vk_right)
left = keyboard_check(vk_left)
jump = keyboard_check_pressed(vk_space) or keyboard_check_direct(ord("W"));
attack = keyboard_check_pressed(ord("Z")) or keyboard_check_direct(ord("J"));
defesa = keyboard_check(ord("X")) or keyboard_check_direct(ord("K"));

velh = (right - left) * max_velh * global.vel_multi;


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
		else if (jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * jump);
			image_index = 0;
		}
		
		else if (attack)
		{
			estado = "ataque"
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
		else if (jump || velv != 0)
		{
			estado = "pulo";
			velv = (-max_velv * jump) ;
			image_index = 0;
		}
		else if (attack)
		{
			estado = "ataque";
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
		velh = (right - left) * max_velh;
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
		
		if(combo == 0)
		{
			sprite_index = spr_player_attack
		}
		else if (combo == 1)
		{
			sprite_index = spr_player_attack_1;
		}
		
		//Hitbox
		if(image_index  >= 1 && dano == noone && permitir_atk)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_hitbox);
			dano.dano = ataque * ataque_multi;
			dano.pai = id;
			permitir_atk = false;
		}
		
		if(attack && combo < 1 && image_index >= image_number - 1)
		{
			combo++;
			image_index = 0;
			permitir_atk = true;
			ataque_multi += .5;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		
		if(image_index > image_number - 1)
		{
			estado = "parado";
			velh = 0;
			combo = 0;
			permitir_atk = true;
			ataque_multi = 1;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		break;
}
	#endregion
	
	#region Hit
	case "hit":
	{
		vida_atual -= 1;
		if(vida_atual < 0)
		{
			vida_atual = 0;
		}
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
		estado = "parado";
	}
	



//Reinicia o jogo
if(keyboard_check(vk_enter)) game_restart();
