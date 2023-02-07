/// @description Movimiento

depth = -y

//mover a la direccion calculada
x += floatHSpeed;
y += floatVSpeed;

//destruir si se sale de la pantalla
if(x > room_width + sprite_width or x < -sprite_width or y > room_height + sprite_height or y < -sprite_height){
	instance_destroy(self);
}

if(boolHit){
	instance_destroy(self); //destruir al indicar que chocó (para ejecutarlo un fotograma despues)
}

if(global.boolUpgradeOpen){
	instance_destroy(self);
}

//destruir si choca on el enemigo
if(place_meeting(x,y,objEnemy)){
	boolHit = true //indica que chocó
}