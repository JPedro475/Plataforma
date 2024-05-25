if(global.pause)
{
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

//Colisão e movimentação
var _velh = sign(velh);
var _velv = sign(velv);


//Horizontal
repeat(abs(velh))
{
	if (place_meeting(x + _velh, y, obj_chao))
	{
		velh = 0
		break;
	}
	x += _velh; 
}

//Vertical
repeat(abs(velv))
{
	if (place_meeting(x, y + _velv, obj_chao))
	{
		velv = 0;
		break;
	}
	y += _velv;
}
