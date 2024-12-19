if(global.pause) exit;

	if gamepad_is_connected(global.controle) and room = rm_fase_4 and x >= 308 and x <= 316 and y <= 87 and y >= 56
	{velv = -len}

y += velv;
x += velh;

if not instance_exists(obj_coletavel)
{
	 if room = rm_fase_6 or room = rm_menu
	{
		room_goto(rm_menu)
	}else{
		room_goto_next()
		}
}

/*
show_debug_message(x)
show_debug_message(y)
show_debug_message(gamepad_axis_value(global.controle, gp_axislh))
show_debug_message(gamepad_axis_value(global.controle, gp_axislv))
show_debug_message(gamepad_axis_value(global.controle, gp_axisrh))
show_debug_message(gamepad_axis_value(global.controle, gp_axisrv))
show_debug_message(room)
show_debug_message(timer_ultra_jump)
*/