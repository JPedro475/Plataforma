var _sprl = sprite_get_width(spr_vida);
var _buffer = 25;
var _vidas = obj_player.vida;

for (var i = 0; i < _vidas; i++;)
{
	draw_sprite_ext(spr_vida, 0, 20 + (_sprl * i) + (_buffer * i), 20, 1.5, 1, 0, c_white, 1);
	
}