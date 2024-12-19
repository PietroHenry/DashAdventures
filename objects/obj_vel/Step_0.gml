if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}

if image_alpha <= 0 or image_xscale <= 0 or image_yscale <= 0 {instance_destroy(id)}
image_alpha = lerp(image_alpha,0,0.1)
image_xscale = lerp(image_xscale,0,0.1)
image_yscale = lerp(image_yscale,0,0.1)