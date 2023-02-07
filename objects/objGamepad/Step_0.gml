/// @description Definir controles

//modo de control
if(gamepad_is_connected(0)){
	if(gamepad_button_check_pressed(0,gp_face4) or gamepad_button_check(0,gp_shoulderrb) or abs(gamepad_axis_value(0, gp_axislh)*10) or abs(gamepad_axis_value(0, gp_axislv)*10) or abs(gamepad_axis_value(0, gp_axisrh)*10) or abs(gamepad_axis_value(0, gp_axisrv)*10)){
		strControllerMode = "gamepad"
	}
	if(keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)){
		strControllerMode = "keyboard";
	}
}
else strControllerMode = "keyboard";


//Movimiento
keyVAxis = gamepad_axis_value(0, gp_axislv) + (keyboard_check(ord("S")) - keyboard_check(ord("W"))) //valor vertical
if(abs(keyVAxis) > 1){ //al estar usando teclado y gamepad a la vez
	keyVAxis = keyVAxis/abs(keyVAxis) //definir el valor como 1 o -1
}

keyHAxis = gamepad_axis_value(0, gp_axislh) + (keyboard_check(ord("D")) - keyboard_check(ord("A"))) //valor horizontal
if(abs(keyHAxis) > 1){ //al estar usando teclado y gamepad a la vez
	keyHAxis = keyHAxis/abs(keyHAxis) //definir el valor como 1 o -1
}

if(abs(gamepad_axis_value(0,gp_axisrh)) > 0.5 or abs(gamepad_axis_value(0,gp_axisrv)) > 0.5){
	intGamepadRAngle = point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv)); //angulo stick derecho
}

//botones
keyShoot = gamepad_button_check(0,gp_shoulderrb) or mouse_check_button(mb_left); //boton disparo
keyUpgrade = gamepad_button_check_pressed(0,gp_face4) or keyboard_check_pressed(ord("E"));  //boton menu mejoras
keyPlant = gamepad_button_check(0,gp_face1) or keyboard_check_pressed(vk_space)
