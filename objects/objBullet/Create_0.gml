/// @description Definir variables
if(objGamepad.strControllerMode == "keyboard"){
	floatMoveAngle = point_direction(objPlayer.x,objPlayer.y,mouse_x,mouse_y); //direccion del proyectil
}else{
	floatMoveAngle = point_direction(objPlayer.x,objPlayer.y,objGamepad.intGamepadPointerX,objGamepad.intGamepadPointerY); //direccion del proyectil
}
floatShootSpeed = 6; //velocidad del proyectil
floatHSpeed = max(1,(lengthdir_x(objPlayer.floatHSpeed/4, floatMoveAngle))) * lengthdir_x(floatShootSpeed,floatMoveAngle) //calcular velocidad horizontal segun angulo (se le suma velocidad de jugador)
floatVSpeed = max(1,(lengthdir_y(objPlayer.floatVSpeed/4, floatMoveAngle))) * lengthdir_y(floatShootSpeed,floatMoveAngle) //calcular velocidad vertical segun angulo (se le suma velocidad de jugador)

boolHit = false; //indica si la bala chocó con algo

floatDamage = global.floatDamage; //daño por defecto