if(global.pause) exit;

var _colisao = function(){
	// Colisão horizontal
	if (place_meeting(x + velh, y, obj_wall)) {
	    while (!place_meeting(x + sign(velh), y, obj_wall)) {
	        x += sign(velh);
	    }
	    velh = 0;
	}
		
	// Colisão vertical
	if (place_meeting(x, y + velv, obj_wall)) {
	    while (!place_meeting(x, y + sign(velv), obj_wall)) {
	        y += sign(velv);
	    }
	    velv = 0;
	}
}

gamepad_set_axis_deadzone(global.controle,0.25)

chao =		 place_meeting(x, y + 1, obj_wall);
parede_dir = place_meeting(x + 1, y, obj_wall);
parede_esq = place_meeting(x - 1, y, obj_wall);

var _jump_comand = function(){
		//posso mudar minha velocidade
		//pulando
		if (_jump && (chao || timer_pulo > 0 || coiote_timer > 0))
		{
			velv = -max_velv;
			audio_play_sound(snd_jump,0,false)
			xscale = 0.5;
			yscale = 1.5;
		}
}

if (parede_dir || parede_esq)
{ultima_parede = 0;}else{ultima_parede = 1;}
if (chao) { timer_pulo = 6; coiote_timer = 6; carga = 1; }else {
    if (coiote_timer > 0) coiote_timer--; // Diminui o timer se não estiver no chão
    if (timer_pulo > 0) timer_pulo--;
}

// Controles de movimento
var _left,_right,_up,_down,_jump,_jump_s,_avanco_h,_dash,_key_input,_prevencao;

if gamepad_is_connected(global.controle)
{
	_left	= gamepad_axis_value(global.controle, gp_axislh) < 0.25	;
	_right	= gamepad_axis_value(global.controle, gp_axislh) > -0.25;
	_up		= gamepad_axis_value(global.controle, gp_axislv) < 0.25	or gamepad_button_check_pressed(global.controle,gp_face4);
	_down	= gamepad_axis_value(global.controle, gp_axislv) > -0.25;
	_jump	= gamepad_button_check_pressed(global.controle,gp_face1);
	_jump_s = gamepad_button_check_released(global.controle,gp_face1);
	_dash	= gamepad_button_check_pressed(global.controle,gp_face3);
	_prevencao = gamepad_is_connected(global.controle) and room = rm_fase_4 and x >= 308 and x <= 316 and y <= 87 and y >= 56
	
}else{
	_left	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_right	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_up		= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_down	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	_jump	= keyboard_check_pressed(vk_space);
	_jump_s = keyboard_check_released(vk_space);
	_dash	= keyboard_check_pressed(vk_tab);
}
_key_input = _left or _right or _up or _down

// Colisão horizontal
if (place_meeting(x + velh, y, obj_wall)) {
    while (!place_meeting(x + sign(velh), y, obj_wall)) {
        x += sign(velh);
    }
    velh = 0;
}

mask_index = sprite_index

var _pre_dash = function(){
	
	// Controles de movimento
	var _left,_right,_up,_down,_jump,_jump_s,_avanco_h,_dash,_key_input,_prevencao;
	
	if gamepad_is_connected(global.controle)
	{
		_left	= gamepad_axis_value(global.controle, gp_axislh) < 0.25	;
		_right	= gamepad_axis_value(global.controle, gp_axislh) > -0.25;
		_up		= gamepad_axis_value(global.controle, gp_axislv) < 0.25	or gamepad_button_check_pressed(global.controle,gp_face4);
		_down	= gamepad_axis_value(global.controle, gp_axislv) > -0.25;
		_jump	= gamepad_button_check_pressed(global.controle,gp_face1);
		_jump_s = gamepad_button_check_released(global.controle,gp_face1);
		_dash	= gamepad_button_check_pressed(global.controle,gp_face3);
		_prevencao = gamepad_is_connected(global.controle) and room = rm_fase_4 and x >= 308 and x <= 316 and y <= 87 and y >= 56
		
	}else{
		_left	= keyboard_check(ord("A")) or keyboard_check(vk_left);
		_right	= keyboard_check(ord("D")) or keyboard_check(vk_right);
		_up		= keyboard_check(ord("W")) or keyboard_check(vk_up);
		_down	= keyboard_check(ord("S")) or keyboard_check(vk_down);
		_jump	= keyboard_check_pressed(vk_space);
		_jump_s = keyboard_check_released(vk_space);
		_dash	= keyboard_check_pressed(vk_control);
	}
	_key_input = _left or _right or _up or _down
	
		if (_dash && carga > 0 && _key_input)
		{
			if _right image_xscale = 1
			if _left image_xscale = -1
			dir = point_direction(0,0,_right - _left, _down - _up)
			estado = ESTADO.DASH
			carga=0;
		}
}

// STATE MACHINE
switch(estado)
{
	case ESTADO.PARADO:
		velh = 0;
		velv = 0;
		
		if (!chao && (parede_dir || parede_esq))
		{
			if (velv > 0)
			{
				velv = lerp(velv,deslize,acel)
			}else
			{
				velv +=grav;
			}
			
			if (!ultima_parede && _jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = 0.5;
				yscale = 1.5;
			}
			else if (ultima_parede && _jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = 0.5;
				yscale = 1.5;
			}
		}
		else if (!chao)
		{
			velv += grav
		}
		
		_colisao()
		
		//posso mudar minha velocidade
		//pulando
		if (_jump && (chao || timer_pulo > 0 || coiote_timer > 0))
		{
			velv = -max_velv;
			audio_play_sound(snd_jump,0,false)
			for (var _i = 0; _i < irandom_range(4,100); _i++)
			{
				var _xx = random_range(x - sprite_width/2, x + sprite_width/2);
				
				instance_create_depth(_xx,y,depth + 1000000000000,obj_vel)
			}
			instance_create_depth(x, y + sprite_height/2 - 2.5,depth + 1000000000000,obj_poeira_jump)
			xscale = 0.5;
			yscale = 1.5;
		}
		
		if (abs(velh) > 0 || abs(velv) > 0 || _left || _right || _jump)
		{
			estado = ESTADO.MOVENDO;
		}
		
		_pre_dash()
	break;
	case ESTADO.MOVENDO:
		_avanco_h = (_right - _left) * max_velh;
		if (chao) acel = acel_chao;
		else acel = acel_ar;
		
		velh = lerp(velh, _avanco_h, acel);
		
		if (!chao && (parede_dir || parede_esq))
		{
			if (velv > 0)
			{
				velv = lerp(velv,deslize,acel)
			}else
			{
				velv +=grav;
			}
			
			if (parede_dir && _jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = 0.5;
				yscale = 1.5;
			}
			else if (parede_esq && _jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = 0.5;
				yscale = 1.5;
			}
		}
		else if (!chao)
		{
			velv += grav
		}
		
		if (chao && _jump && (chao || timer_pulo > 0 || coiote_timer > 0))
		{
			velv = -max_velv; // Faz o objeto saltar ao pressionar o espaço
			audio_play_sound(snd_jump,0,false)
			xscale = 0.5;
			yscale = 1.5;
		}
		    
		
		if (_jump_s && velv < 0) velv *= 0.7
		
		_colisao()
		
		// Limita a velocidade vertical
		velv = clamp(velv, -max_velv, max_velv);
		
		_pre_dash()
	break;
	case ESTADO.DASH:
		
		dura--;
		
		velh = lengthdir_x(len,dir);
		velv = lengthdir_y(len,dir);
		
		if _right image_xscale = 1
		if _left image_xscale = -1
		
		if (dir == 90 || dir == 270)
		{
			yscale = 1.5;
			xscale = 0.5 * sign(xscale_dir);
		}else{
			yscale = 0.5;
			xscale = 1.6 * sign(xscale_dir);
		}
		
		mask_index = sprite_index
		
		var _rastro = instance_create_layer(x,y,layer,obj_player_vest)
		_rastro.xscale = xscale;
		_rastro.yscale = yscale;
		
		_colisao()
		
		if (dura <= 0)
		{
			estado = ESTADO.MOVENDO;
			dura = room_speed/6;
			
			//velh =(max_velh * sign(velh) * 0.5);
			//velv =(max_velv * sign(velv) * 0.5);
		}
	break;
}

xscale = lerp(xscale, xscale_dir, 0.15);
yscale = lerp(yscale, yscale_dir, 0.15);