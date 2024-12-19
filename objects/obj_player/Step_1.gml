if(global.pause) exit;

if x <= -7 {x = 347}
if x >= 348 {x = -6}
if y >= 200 {y = -7}
if y <= -8 {y = 200}
chao =		 place_meeting(x, y + 1, obj_wall)

if gamepad_is_connected(global.controle)
{
var _jump	= gamepad_button_check_pressed(global.controle,gp_face1);
}else{
var _jump	= keyboard_check_pressed(vk_space);
}
var _temp = place_meeting(x, y + 1, obj_wall);

if (_temp && !chao) {
    xscale = 1.6 * xscale_dir;
    yscale = 0.5 * yscale_dir;
	
	timer_ultra_jump = 60
	
	for (var _i = 0; _i < irandom_range(4,100); _i++)
	{
		var _xx = random_range(x - sprite_width/2, x + sprite_width/2);
		
		instance_create_depth(_xx,y,depth + 1000000000000,obj_vel)
	}
	instance_create_depth(x, y + sprite_height/2 - 2.5,depth + 1000000000000,obj_poeira_jump)
}

if timer_ultra_jump != 0
{
	timer_ultra_jump -= 1
	if (chao && _jump && (chao || timer_pulo > 0 || coiote_timer > 0))
	{
		velv = -max_velv - 64; // Faz o objeto saltar ao pressionar o espaço
		audio_play_sound(snd_jump,0,false)
		xscale = 0.5;
		yscale = 1.5;
	}
}