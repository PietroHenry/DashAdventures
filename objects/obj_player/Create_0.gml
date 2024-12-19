display_set_gui_size(room_width,room_height);

timer_setas = 600

if os_type == os_android or os_type == os_ios
{
	esqu = virtual_key_add(9,117,32,33,	ord("A"));
	dire = virtual_key_add(74,117,32,33,ord("D"));
	baix = virtual_key_add(41,150,33,32,ord("S"));
	cima = virtual_key_add(41,85,33,32,	ord("W"));
	
	jump = virtual_key_add(265,121,31,32,	 vk_space);
	investida = virtual_key_add(297,89,31,32,vk_control);
}

ajusta_aspecto = function()
{
	var _base_w = 1920;
	var _base_h = 1080;
	
	display_set_gui_size(_base_w, _base_h);
	
	var _max_w = display_get_width();
	var _max_h = display_get_height();
	
	var _aspect = _max_w / _max_h;
	
	if (_max_w < _max_h)
	{
		var _width = min(_base_w, _max_w);
		var _height = _width / _aspect;
	}else{
		var _height = min(_base_h, _max_h);
		var _width = _height * _aspect;
	}
	
	camera_set_view_size(view_camera[0], _width, _height);
	view_wport[0] = _max_w;
	view_hport[0] = _max_h;
	
	surface_resize(application_surface, _max_w, _max_h);
}

//ajusta_aspecto()

pega_texto = function()
{
	if (keyboard_virtual_status() == false)
	{
		keyboard_virtual_show(kbv_type_default,kbv_returnkey_default,kbv_autocapitalize_sentences,false);
	}
}

// Gravidade e acelerações
grav = 0.15;
acel_chao = 0.2;
acel_ar = 0.1;
acel = acel_chao;
deslize = 2;

velh = 0;
velv = 0;
max_velh = 3;
max_velv = 4;
len = 5;

timer_ultra_jump = 60
limire_pulo = 6;
timer_pulo = limire_pulo;

// Variável de controle para detectar o chão
chao = false;
parede_dir = false;
parede_esq = false;
carga = 1;
ultima_parede = 0;

// Escalas de animação
xscale = 1;
xscale_dir = image_xscale;
yscale = 1;
yscale_dir = image_yscale;
dura = room_speed/6;
dir = 0;

// Efeito Coyote Time
coiote_time_max = 6; // Tempo máximo para pular após sair do chão (em frames)
coiote_timer = coiote_time_max;

enum ESTADO {
    PARADO, MOVENDO, DASH
}

estado = ESTADO.PARADO;

sprite [0][0][0] = spr_player_idle;
sprite [0][1][0] = spr_player_jump_up;
sprite [0][2][0] = spr_player_jump_down;

sprite [0][0][1] = spr_player_idle;
sprite [0][1][1] = spr_player_jump_up_dash;
sprite [0][2][1] = spr_player_jump_down_dash;

sprite [1][0][0] = spr_player_free;
sprite [1][1][0] = spr_player_jump_up;
sprite [1][2][0] = spr_player_jump_down;

sprite [1][0][1] = spr_player_free_dash;
sprite [1][1][1] = spr_player_jump_up_dash;
sprite [1][2][1] = spr_player_jump_down_dash;

movendo = 0;
pulando = 0;
dash = 0;