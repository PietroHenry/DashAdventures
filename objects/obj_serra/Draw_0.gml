draw_self()
if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}

image_angle += (sign(image_xscale) * 2)