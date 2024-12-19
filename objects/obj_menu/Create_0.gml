window_set_size(1280,720)
window_center()

timer = -1

if os_type == os_android or os_type == os_ios
{
	selecao = virtual_key_add(97,58,150,33,vk_control);
	fim = virtual_key_add(97,109,102,33,vk_f4);
}
menu = ["JOGAR","SAIR"];
//op_max = array_length(menu);
atual = 0