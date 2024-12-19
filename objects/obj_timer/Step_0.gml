if(global.pause) exit;

if room = rm_menu
{reset = false}else{ reset = true}

if timer_atual < timer_record and room = rm_menu
{
	timer_record = timer_atual
	ini_open("save.sav")
	ini_write_real("timer","record",timer_record);
	ini_close()
}

if file_exists("save.sav"){
	ini_open("save.sav")
	timer_record = ini_read_real("timer","record",0);
	ini_close()
}else{
	timer_record = record_padrao
}

if file_exists("save.sav"){
	ini_open("save.sav")
	timer_record = ini_read_real("timer","record",0);
	ini_close()
}else{
	timer_record = record_padrao
}

if room != rm_menu
{timer_atual += 1 / room_speed}else{}

//if timer_atual > timer_record
//{
//	timer_atual = timer_record
//	room_goto(rm_menu)
//}