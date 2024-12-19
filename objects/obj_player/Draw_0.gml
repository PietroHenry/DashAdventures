if(global.pause) 
{
	image_speed = 0
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha);
	exit
}else{image_speed = 1}

if velh != 0
{xscale_dir =	sign(velh)}

var _left,_right;

if gamepad_is_connected(global.controle)
{
	_left	= gamepad_axis_value(global.controle, gp_axislh) < 0.25;
	_right	= gamepad_axis_value(global.controle, gp_axislh) > -0.25;
}else{
	_left	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_right	= keyboard_check(ord("D")) or keyboard_check(vk_right);
}

if _left or _right or (estado = ESTADO.DASH and (velh != 0 or velv != 0))
{movendo = 1}else{movendo = 0}

if _left and _right
{movendo = 0}

if !chao and velv < 0 {pulando = 1}
if !chao and velv = 0 {pulando = 0}
if !chao and velv > 0 {pulando = 2}
if chao {pulando = 0}
if estado = ESTADO.DASH or carga = 0
{dash = 1}else{dash = 0}

if not _right or not _left
{timer_setas -= 1}

if _right or _left
{timer_setas = 600}

if timer_setas <= 0
{draw_sprite(spr_setas_tutu_right,0,x,y - 32)}

sprite_index = sprite[movendo][pulando][dash]

draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha);