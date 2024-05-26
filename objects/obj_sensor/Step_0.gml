//Colisão com o player
var _player = place_meeting(x,y, obj_player);
var _espaco = keyboard_check_released(vk_space);


if (_player && _espaco)
{
	var _tran = instance_create_layer(0,0, layer, obj_transicao)
	_tran.destino = destino;
	_tran.destino_x = destino_x;
	_tran.destino_y = destino_y;
}