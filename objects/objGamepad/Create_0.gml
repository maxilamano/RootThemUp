/// @description Definir variables
if(gamepad_is_connected(0)){
	strControllerMode = "gamepad"
}
else strControllerMode = "keyboard"

keyVAxis = 0; //control vertical
keyHAxis = 0; //control horizontal

keyShoot = 0; //botón disparo
keyUpgrade = 0; //boton menu mejoras

intGamepadRAngle = point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv)); //angulo stick derecho
