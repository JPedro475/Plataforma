event_inherited()

if (die != true)
{
	if vida <=0 
	{
		if reset == false
		{
			image_index = 0;
			reset = true;
			
		}
		
		die = true;
		sprite_index = spr_tomate_die;
	}
}
event_inherited()