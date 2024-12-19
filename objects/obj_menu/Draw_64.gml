var _meio_tela = display_get_gui_height() / 2
draw_set_font(fnt_menu)
var _alt = string_height("I")

draw_set_valign(1);

for (var _i = 0; _i < array_length(menu); _i++){
	var _cor = c_white;
	
	if (_i == atual)
	{
		_cor = c_red;
	}
	
	draw_set_color(_cor);
	draw_text(100,_meio_tela + (_alt * _i) - 20,menu[_i]);
	draw_set_color(-1);
}

draw_set_valign(0);
draw_set_font(-1);


//draw_rectangle(97,109,97 + 102,109 + 33,0)

/*
draw_set_font(fnt_menu)
var _gui_width,_gui_height,_x1,_y1,_margin,_m_x,_m_y
_gui_width = display_get_gui_width();
_gui_height = display_get_gui_height();
_x1 = _gui_width / 2;
_y1 = _gui_height /2;
_margin = 50;
_m_x = device_mouse_x_to_gui(0);
_m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var _i = 0; _i < op_max; _i++){
	
	var _y2 = _y1 + (_margin * _i)
	var _string_w = string_width(menu[_i])
	var _string_h = string_height(menu[_i])
	
	if (point_in_rectangle(_m_x,_m_y,_x1 - _string_w / 2,_y2 - _string_h / 2,_x1 + _string_w / 2,_y2 + _string_h / 2)){
		draw_set_color(c_red);
		atual = _i;
		if (mouse_check_button_pressed(mb_left)){
			if (atual == 3){
				game_end();
			}
		}
	}else{
		draw_set_color(c_white);
	}
	
	draw_text(_x1,_y2,menu[_i]);
}
*/