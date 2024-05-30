var _chao = place_meeting(x, y + 1, obj_chao);

if (!_chao)
{
	velv += GRAVIDADE * massa * global.vel_multi;
}



switch(estado)
{
	#region Parado
	case "parado":
	{
		velh = 0;
		timer_estado++;
		if (sprite_index != spr_zumbi_idle)
		{
			image_index = 0;
		}
		sprite_index = spr_zumbi_idle;
		
		//Estado de patrulha
		if (irandom(timer_estado) > 300)
		{
			estado = "movendo";
			timer_estado = 0;
		}
		scr_inimigo_ataque_melee(obj_player, detection, xscale);
		
		break;
	}
	#endregion
	
	#region Movendo
	case "movendo":
	{
		
		timer_estado++;
		if (sprite_index != spr_zumbi_andando)
		{
			image_index = 0;
			velh = choose(1, -1);
		}
		sprite_index = spr_zumbi_andando;
		
		//Condição de saida do estado
		if (irandom(timer_estado) > 300)
		{
			estado = "parado";
			timer_estado = 0;
		}
		scr_inimigo_ataque_melee(obj_player, detection, xscale);
		
		break;
	}
	#endregion
	
	#region Ataque
	case "ataque":
	{
		velh = 0;
		if(sprite_index != spr_zumbi_ataque)
		{
			image_index = 0;
			permitir_atk = true;
			dano = noone;
		}
		sprite_index = spr_zumbi_ataque;
		if (image_index > image_number -1)
		{
			estado = "parado";
		}
		
		//Criando o dano
		if(image_index >= 3 && dano == noone && image_index < 4 && permitir_atk)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_hitbox)
			dano.dano = ataque;
			dano.pai = id;
			permitir_atk = false;
		}
		//Apgando o dano
		if(dano != noone && image_index >= 4)
		{
			instance_destroy(dano);
			dano = noone;
		}
		break;
	}
	#endregion
	
	#region Hit
	case "hit":
	{
		if (sprite_index != spr_zumbi_hit)
		{
			image_index = 0;
			
		}
		sprite_index = spr_zumbi_hit;
		
		if (vida_atual > 0)
		{
			if (image_index > image_number - 1)
			{
				estado = "parado";
			}
		}
		else 
		{
			if (image_index >= 3)
			{
				estado = "dead";
			}
		}
		break;
	}
	#endregion
	
	#region Dead
	case "dead":
	{
		velh=0
		if (sprite_index != spr_zumbi_die)
		{
			image_index = 0;
		}
		sprite_index = spr_zumbi_die;
		
		if (image_index > image_number - 1)
		{
			image_speed = 0;
			image_alpha = .01;
			
			if (image_alpha <=0) instance_destroy();
		}
		break;
	}
	#endregion
}