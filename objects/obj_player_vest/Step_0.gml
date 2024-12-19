if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}

image_alpha -= 0.05

if (image_alpha <= 0) instance_destroy(id)