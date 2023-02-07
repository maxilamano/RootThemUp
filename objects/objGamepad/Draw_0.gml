/// @description Puntero
if(strControllerMode == "keyboard"){
	draw_sprite(sprPointer,0,mouse_x,mouse_y)
}
else{
	if(!global.boolUpgradeOpen){
		intGamepadPointerX = objPlayer.x + lengthdir_x(objPlayer.sprite_width, intGamepadRAngle)
		intGamepadPointerY = objPlayer.y + lengthdir_y(objPlayer.sprite_width, intGamepadRAngle)
	
		draw_sprite_ext(sprPointerGamepad,0,intGamepadPointerX,intGamepadPointerY,1,1,intGamepadRAngle-45,c_white,objPlayer.image_alpha);
	}
}

