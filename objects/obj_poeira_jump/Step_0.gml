if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}

if image_index >= image_number - 1
{instance_destroy(id)}