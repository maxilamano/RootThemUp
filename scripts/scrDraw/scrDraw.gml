// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawDescription(description, price){
	//guardar alineacion
	valign = draw_get_valign();
	halign = draw_get_halign();
	
	//mostrar texto
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text_ext(2, room_height-2, description,10,200) //mostrar descripcion
	
	draw_set_halign(fa_right);
	draw_text_ext(room_width-2, room_height-2,"price: " + string(price),10,200) //mostrar descripcion
	
	//revertir alineacion
	draw_set_valign(valign);
	draw_set_halign(halign);
}