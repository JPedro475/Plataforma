draw_set_font(fnt_menu);
var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();
var _x1 = _gui_width / 2;
var _y1 = _gui_height / 2;
var _margin = 50;
var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for( var _i = 0; _i < op_tamanho; _i++)
{
	var _y2 = _y1 + (_margin * _i);
	var _string_w = string_width(opcoes[_i]);
	var _string_h = string_height(opcoes[_i]);
	
	
	if (point_in_rectangle(_m_x, _m_y, _x1 - _string_w / 2,  _y2 - _string_h / 2, _x1 + _string_w / 2, _y2 + _string_h / 2))
	{
		draw_set_color(c_white);
		index = _i;
		if(mouse_check_button_pressed(mb_left))
		{
			if (index == 0)
			{
				room_goto(rm_fase_1);
			}
			/*else if (index == 1)
			{
				
			}*/
			/*else if (index == 2)
			{
				
			}*/
			else if(index == 3)
			{
				game_end();
			}
		}
	}
	else
	{
		draw_set_color(#a1913b);
	}
	
	draw_text(_x1, _y2, opcoes[_i]);
}


