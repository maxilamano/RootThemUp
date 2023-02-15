/// @description Movimiento

depth = -y

//mover a la direccion calculada
x += floatHSpeed;
y += floatVSpeed;

//destruir si se sale de la pantalla
if(x > room_width + sprite_width or x < -sprite_width or y > room_height + sprite_height or y < -sprite_height){
	instance_destroy(self);
}

//daño enemigo y knockback
if(place_meeting(x,y,objEnemy)){
	instEnemy = instance_nearest(x,y,objEnemy)
	audio_stop_sound(fxHit)//detener sonido
	audio_play_sound(fxHit,4,false) //sonido
	//calculo daño
	switch(instEnemy.strEnemyType){
		case "bug":
			floatDamage = instEnemy.floatBulletDefaultDamage * instEnemy.intMaxLife/instEnemy.intBugLife
			break;
		case "pyro":
			floatDamage = instEnemy.floatBulletDefaultDamage * instEnemy.intMaxLife/instEnemy.intPyroLife
			break;
		case "timber":
			floatDamage = instEnemy.floatBulletDefaultDamage * instEnemy.intMaxLife/instEnemy.intTimberLife
			break;
	}
	
	if(instEnemy.intLife - floatDamage > 0){ //comprobar si el daño es mayor a la vida
		instEnemy.intLife -= floatDamage; //hacer daño
		
		//knockback
		instEnemy.floatHSpeed = -lengthdir_x(instEnemy.floatKnockback,point_direction(instEnemy.x,instEnemy.y,x,y));
		instEnemy.floatVSpeed = -lengthdir_y(instEnemy.floatKnockback,point_direction(instEnemy.x,instEnemy.y,x,y));
		instance_destroy(self); //desaparecer
	}else{
		floatDamage -= instEnemy.intLife //reducir daño
		if(image_xscale>0.2){
			image_xscale *= 0.7 //reducir tamaño
			image_yscale *= 0.7 //reducir tamaño
		}
		else{
			image_xscale = 0.2;
			image_yscale = 0.2;
		}
		instance_create_depth(instEnemy.x,instEnemy.y,depth,objWater) //dejar agua
		instance_destroy(instEnemy); //matar enemigo
		
		//cambiar velocidad en caso de haber mas enemigos
		if(instance_exists(objEnemy)){
			instEnemy = instance_nearest(x,y,objEnemy)
			floatHSpeed = lengthdir_x(floatShootSpeed,point_direction(x,y,instEnemy.x,instEnemy.y)) //cambiar trayectoria hacia nuevo enemigo
			floatVSpeed = lengthdir_y(floatShootSpeed,point_direction(x,y,instEnemy.x,instEnemy.y)) //cambiar trayectoria hacia nuevo enemigo
		}
	}
}


if(global.boolUpgradeOpen){
	instance_destroy(self);
}