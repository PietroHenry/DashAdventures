//record_padrao = 41.1
record_padrao = 120
if file_exists("save.sav"){
	ini_open("save.sav")
	timer_record = ini_read_real("timer","record",0);
	ini_close()
}else{
	timer_record = record_padrao
}

if (file_exists("save.sav")) {file_delete("save.sav");}

timer_atual = timer_record
reset = false