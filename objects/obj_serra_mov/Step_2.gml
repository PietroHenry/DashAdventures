velv = clamp(velv, -10, 10)
velh = clamp(velh, -10, 10)

if(global.pause) 
{
	image_speed = 0
	exit
}else{image_speed = 1}
x += velh
y += velv