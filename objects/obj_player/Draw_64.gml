if os_type == os_android or os_type == os_ios
{

	if keyboard_check(ord("A")) or keyboard_check(vk_left)	{draw_sprite_ext(spr_botao_left,0,9,117,1,1,0,c_white,2)		}else{draw_sprite_ext(spr_botao_left,0,9,117,1,1,0,c_white,0.5)		}
	if keyboard_check(ord("D")) or keyboard_check(vk_right)	{draw_sprite_ext(spr_botao_right,0,74,117,1,1,0,c_white,2)	}else{draw_sprite_ext(spr_botao_right,0,74,117,1,1,0,c_white,0.5)	}
	if keyboard_check(ord("W")) or keyboard_check(vk_up)	{draw_sprite_ext(spr_botao_up,0,41,85,1,1,0,c_white,2)		}else{draw_sprite_ext(spr_botao_up,0,41,85,1,1,0,c_white,0.5)		}
	if keyboard_check(ord("S")) or keyboard_check(vk_down)	{draw_sprite_ext(spr_botao_down,0,41,150,1,1,0,c_white,2)	}else{draw_sprite_ext(spr_botao_down,0,41,150,1,1,0,c_white,0.5)	}
	if keyboard_check(vk_space){draw_sprite_ext(spr_botao_jump,0,265,121,1,1,0,c_white,2)	}else{draw_sprite_ext(spr_botao_jump,0,265,121,1,1,0,c_white,0.5)	}
	if keyboard_check(vk_control)  {draw_sprite_ext(spr_botao_das,0,297,89,1,1,0,c_white,2)		}else{draw_sprite_ext(spr_botao_das,0,297,89,1,1,0,c_white,0.5)		}
}
//var _w = display_get_width();
//var _h = display_get_height();

//draw_text_transformed(20,20,_w,1,1,0);
//draw_text_transformed(20,30,_h,1,1,0);