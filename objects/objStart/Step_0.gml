/// @description Funcionamiento Click
if(!mouse_check_button(mb_left) and boolClick){
	room_goto(roomGame);
}

if(mouse_y > (y-sprite_height/2) and mouse_y < (y+sprite_height/2) and mouse_x > (x-sprite_width/2) and mouse_x < (x+sprite_width/2) and mouse_check_button(mb_left)){
	boolClick = true;
}else{
	boolClick = false;
}

