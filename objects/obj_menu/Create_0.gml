//Opções
menu = ["Iniciar", "Opções", "Créditos", "Sair"]

//Seleçao do menu
sel = 0;
marg_val = 0;
marg_total = 20;

#region Metodos
//Desenha menu
desenha_menu = function()
{
	//Fonte
	draw_set_font(fnt_menu);

	//Alinhando o texto
	define_align(0,0);
	//Desenhando a tela
	var _qtd = array_length(menu);

	//Altura da tela
	var _alt = display_get_gui_height();

	//Espaço entre as linhas
	var _espaco_y = string_height("S") + 16;
	var _alt_menu = _espaco_y * _qtd;



	for (var _i = 0; _i < _qtd; _i++)
	{
		var _cor = c_white, _marg_x = 0;
		var _texto = menu[_i];
	
		if(sel == _i)
		{
			_cor = #a1913b;
			_marg_x = marg_val;
		}
	
		draw_text_color(20 + _marg_x, (_alt / 2) - _alt_menu / 2 + (_i * _espaco_y), _texto, _cor, _cor, _cor, _cor, 1);
	}

	draw_set_font(-1);
	define_align(-1,-1);
	}

//Controle do menu
controla_menu = function()
{
	//Teclas
	var _up, _down, _enter;
	_up = keyboard_check_pressed(vk_up); //ev_gesture_tap;
	_down = keyboard_check_pressed(vk_down); //ev_gesture_tap;
	_enter = keyboard_check_pressed(vk_enter); //ev_gesture_tap;

	if (_up || _down)
	{
		sel += _down - _up;
		var _tam = array_length(menu) - 1;
		sel = clamp(sel, 0, _tam);
		
	}
	
	marg_val = marg_total * valor_ac(ac_margem, _up ^^ _down);
}
#endregion