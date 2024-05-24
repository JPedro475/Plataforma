// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_inimigo_ataque_melee(){
///@arg player
///@arg detection
///@arg xscale


var _outro = argument0;
var _detection = argument1;
var _xscale = argument2




//Campo de visão
var _player = collision_line(x, y - (sprite_height/2.5), x + (_detection * _xscale), y - (sprite_height/2.5), _outro, 0, 1);
//Se o player entrou no campo de visão
if (_player)
{
	estado = "ataque";
}

}