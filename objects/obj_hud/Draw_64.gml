var _sprl = sprite_get_width(spr_vida);
var _buffer = 30;
var _vidas = obj_player.vida_atual;

for(var _i = 0; _i < _vidas; _i++){
	draw_sprite_ext(spr_vida, 0, 20 + (_sprl * _i) + (_buffer * _i), 20, 2, 2, 0, c_white, 1);
}