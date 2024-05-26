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