// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcs(){

}

//Screenshake
///@function screenshake(valor_do_tremor)
///@arg intensidade
function screenshake(_treme){
	var _shake = instance_create_layer(0,0, "Game_Controller", obj_screen_shake);
	_shake.shake = _treme;
}

//Defini align
///@function define_align(vertical, horizontal)
function define_align(_ver, _hor)
{
	draw_set_halign(_hor);
	draw_set_valign(_ver);
}

//Valor da animação
///@function valor_ac(animation_curve, anima, [canal])
function valor_ac(_anim, _animar = false, _channel = 0)
{
	//Posição da animação
	static _pos = 0, _val = 0;
	
	//Aumentando o valor do pos
	_pos += delta_time/1000000;
	
	if(_animar) _pos = 0;
	
	//Pegando o valor do canal
	
	var _canal = animcurve_get_channel(_anim, _channel);
	_val = animcurve_channel_evaluate(_canal, _pos);
	
	show_debug_message(_val)
	
	return _val;
}