if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}

if x = 333 or x = 8
{velh = -velh}
if y = 183 or y = 8
{velv = -velv}

if (place_meeting(x + velh, y, obj_wall)) {
    while (!place_meeting(x + sign(velh), y, obj_wall)) {
        x += sign(velh);
    }
    velh = -velh;
	velh += sign(velh)
}
	
// Colisão vertical
if (place_meeting(x, y + velv, obj_wall)) {
    while (!place_meeting(x, y + sign(velv), obj_wall)) {
        y += sign(velv);
    }
    velv = -velv;
	velv += sign(velv)
}
/*
if (place_meeting(x + hspeed, y, obj_serra_mov)) {
    while (!place_meeting(x + sign(hspeed), y, obj_serra_mov)) {
        x += sign(hspeed);
    }
    hspeed = -hspeed;
	hspeed += sign(hspeed)
}
	
// Colisão vertical
if (place_meeting(x, y + vspeed, obj_serra_mov)) {
    while (!place_meeting(x, y + sign(vspeed), obj_serra_mov)) {
        y += sign(vspeed);
    }
    vspeed = -vspeed;
	vspeed += sign(vspeed)
}
*/

image_angle += (sign(image_xscale) * 2)
image_xscale = sign(velh) * -1