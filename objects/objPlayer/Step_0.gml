/// @description Movimiento

//--------------Movimiento--------------/

depth = -y

//calcular velocidad
floatMoveAngle = point_direction(0,0,objGamepad.keyHAxis, objGamepad.keyVAxis); //calcular angulo de movimiento
if (objGamepad.keyHAxis != 0 or objGamepad.keyVAxis != 0){
	floatHSpeed = lengthdir_x(floatMaxSpeed,floatMoveAngle); //velocidad horizontal
	floatVSpeed = lengthdir_y(floatMaxSpeed,floatMoveAngle); //velocidad vertical
}else{
	if(abs(floatHSpeed) - floatFricc > 0){ //friccion horizontal
		floatHSpeed -= floatFricc * floatHSpeed/abs(floatHSpeed);
	}else{
		floatHSpeed = 0
	}
	
	if(abs(floatVSpeed) - floatFricc > 0){ //friccion vertical
		floatVSpeed -= floatFricc * floatVSpeed/abs(floatVSpeed);
	}else{
		floatVSpeed = 0
	}
}


//aplicar velocidad
if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	repeat(abs(floatHSpeed)){ //colision horizontal
		if(!place_meeting(x + (floatHSpeed/abs(floatHSpeed)), y ,objMainPlant) and x + floatHSpeed/abs(floatHSpeed) > 0 and x + floatHSpeed/abs(floatHSpeed) < room_width){
			x += floatHSpeed/abs(floatHSpeed)
		}else{
			break;
		}
	}

	repeat(abs(floatVSpeed)){ //colision vertical
		if(!place_meeting(x,y + (floatVSpeed/abs(floatVSpeed)),objMainPlant) and y + floatVSpeed/abs(floatVSpeed) > 0 and y + floatVSpeed/abs(floatVSpeed) < room_height){
			y += floatVSpeed/abs(floatVSpeed)
		}else{
			break;
		}
	}
}



//--------------Disparo--------------//
if(objGamepad.keyShoot and !global.boolUpgradeOpen){
	if (intReloadTime <= 0){
		instance_create_depth(x,y,1,objBullet);
		audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
		intReloadTime = intMaxReloadTime;
	}
}

if (intReloadTime > 0){
	intReloadTime--; //disminuir tiempo restante de disparo
}