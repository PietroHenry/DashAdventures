var _numslots = gamepad_get_device_count()

for (var _i = 0; _i < _numslots; _i++){
	
	if (gamepad_is_connected(_i)){
		global.controle = _i;
	}
}