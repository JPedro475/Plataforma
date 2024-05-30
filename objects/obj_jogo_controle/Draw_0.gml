//Tela de game over
if(game_over)
{
	//Posição da camera
	var _x1 = camera_get_view_x(view_camera[0]);
	var _w = camera_get_view_width(view_camera[0]);
	var _x2 = _x1 + _w;
	var _meio_h = _x2 / 2;
	var _y1 = camera_get_view_y(view_camera[0]);
	var _h = camera_get_view_height(view_camera[0]);
	var _y2 = _y1 + _h;
	var _meio_v = _y2 / 2;
	
	
	var _qtd = _h *.15;
	valor =  lerp(valor, 1, .01);
	
	draw_set_color(c_black);
	//Escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	
	
	//Desenhando o retangulo superior
	draw_set_alpha(1);
	draw_rectangle(_x1, _y1, _x2, _y1 + _qtd * valor, false);
	
	//Desenhando o retangulo inferior
	draw_rectangle(_x1, _y2, _x2, _y2 - _qtd * valor, false);
	
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//Delay
	if(valor >= .85)
	{
		alfa = lerp(alfa, 1, 0.1);
		//Game Over
		draw_set_alpha(alfa);
		draw_set_font(fnt_menu);
		draw_set_valign(1);
		draw_set_halign(1);
		//Sombra
		draw_set_color(c_white);
		draw_text(_meio_h, _meio_v, "Game Over");
		//Texto
		draw_set_color(#a1913b);
		draw_text(_meio_h, _meio_v, "Game Over");
		draw_set_font(-1);
		
		draw_text(_meio_h,_meio_v + 40, "Aperte ENTER para reiniciar");
		
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_alpha(-1);
	}
}
else
{
	valor = 0;
}