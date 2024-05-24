if(global.pause)
{
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

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