draw_set_font(fnt_menu);
var _dist = 50;

var _gui_largura = display_get_gui_width();
var _gui_altura = display_get_gui_height();

var _x = _gui_largura/2;
var _y = _gui_altura/2;


for(var _i = 0; _i < op_max; _i++)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if (index == _i)
	{
		draw_set_color(#a1913b);
	}else{
		draw_set_color(c_white);
	}
	
	draw_text(_x, _y + (_dist *_i), opcoes[_i]);
	
}



draw_set_font(-1);