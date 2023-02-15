/// @description Movimiento
 
depth = -y //profundidad

if(instance_exists(objBullet)){//cambiar daño segun bala
	floatBulletDefaultDamage = instance_nearest(x,y,objBullet).floatDamage
}

if(instance_exists(objPotato)){
	intMoveDirection = point_direction(x,y,instance_nearest(x,y,objPotato).x,instance_nearest(x,y,objPotato).y);
}else{
	intMoveDirection = point_direction(x,y,objMainPlant.x,objMainPlant.y);
}
if(abs(floatHSpeed) < abs(lengthdir_x(floatMaxSpeed,intMoveDirection))){
	floatHSpeed += floatAcc * lengthdir_x(floatMaxSpeed,intMoveDirection)/abs(lengthdir_x(floatMaxSpeed,intMoveDirection));
}else{
	floatHSpeed = lengthdir_x(floatMaxSpeed,intMoveDirection)
}
if(abs(floatVSpeed) < abs(lengthdir_y(floatMaxSpeed,intMoveDirection))){
	floatVSpeed += floatAcc * lengthdir_y(floatMaxSpeed,intMoveDirection)/abs(lengthdir_y(floatMaxSpeed,intMoveDirection));
}else{
	floatVSpeed = lengthdir_y(floatMaxSpeed,intMoveDirection)
}


//pa no dividir por 0
if (floatHSpeed == 0){
	floatHSpeed += 0.01
}
if (floatVSpeed == 0){
	floatVSpeed += 0.01
}

if(!global.boolUpgradeOpen){
	repeat(max(1,abs(floatHSpeed))){ //colision horizontal
		if(!place_meeting(x + (floatHSpeed/abs(floatHSpeed)), y ,objMainPlant)){
			x += floatHSpeed
		}else{
			break;
		}
	}

	repeat(max(1,abs(floatVSpeed))){ //colision vertical
		if(!place_meeting(x,y + (floatVSpeed/abs(floatVSpeed)),objMainPlant)){
			y += floatVSpeed
		}else{
			break;
		}
	}
}else{
	if(x+(sprite_width/2)>0 and x<room_width and y+(sprite_height/2)>0 and y-(sprite_height/2)<room_height){
		if(y < objMainPlant.y){
			y += point_distance(x,y,x,objMainPlant.y)/3
			//show_debug_message(point_distance(x,y,x,objMainPlant.y)/2)
		}else if(y > objMainPlant.y){
			y -= point_distance(x,y,x,objMainPlant.y)/3
			//show_debug_message(point_distance(x,y,x,objMainPlant.y)/2)
		}
	}
}


//animacion

//cambiar direccion
if (abs(lengthdir_x(1,point_direction(x,y,objMainPlant.x,objMainPlant.y))) != 0){
	image_xscale = lengthdir_x(1,point_direction(x,y,objMainPlant.x,objMainPlant.y))/abs(lengthdir_x(1,point_direction(x,y,objMainPlant.x,objMainPlant.y)))
		
}else{
	image_xscale = 1; //pa no dividir por 0
}

if(!global.boolUpgradeOpen){
	if(!layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu) or layer_sequence_is_finished(objControl.sqcUpgradeMenu)){
		intCurrentX = x;
		intCurrentY = y;
	}else{
		x += lengthdir_x(point_distance(x,y,intCurrentX,intCurrentY)/3, point_direction(x,y,intCurrentX,intCurrentY)) //regresar a pos real
		y += lengthdir_y(point_distance(x,y,intCurrentX,intCurrentY)/3, point_direction(x,y,intCurrentX,intCurrentY)) //regresar a pos real
	}

	//ataque
	if(place_meeting(x,y+1,objMainPlant) or place_meeting(x,y-1,objMainPlant) or place_meeting(x+1,y,objMainPlant) or place_meeting(x-1,y,objMainPlant)){
		sprite_index = sprAtackSprite; //cambiar a sprite ataque
		switch(strEnemyType){
			case "timber": //hacha
				if(int64(image_index) = 7){
					if(!boolAtack){
						boolAtack = !boolAtack
						audio_play_sound(fxAxeHit,0,false) //sonido golpe
						if (global.arrUpgrades[0] == 3){
							if(global.intPlantLife-(intDamage*1.5) > 0){
								global.intPlantLife -= (intDamage*1.5);
							}else{
								global.intPlantLife = 0
							}
						}else{
							if(global.intPlantLife-intDamage > 0){
								global.intPlantLife -= intDamage;
							}else{
								global.intPlantLife = 0
							}
						}
					}
				}else{
					boolAtack = false;
				}
				break;
			case "pyro": //fuego
				if(int64(image_index) == 3){
					if(!boolAtack){
						boolAtack = !boolAtack
						audio_play_sound(fxFireHit,0,false) //sonido golpe
						if(global.intPlantLife-intDamage > 0){
							global.intPlantLife -= intDamage;
						}else{
							global.intPlantLife = 0
						}
					}
				}else{
					boolAtack = false;
				}
				break;
			case "bug": //bicho
				if(int64(image_index) == 6){
					if(!boolAtack){
						boolAtack = !boolAtack
						audio_play_sound(fxBugHit,0,false) //sonido golpe
						if(global.intPlantLife-intDamage > 0){
							global.intPlantLife -= intDamage;
						}else{
							global.intPlantLife = 0
						}
					}
				}else{
					boolAtack = false;
				}
				break;
		}
	}else{
		sprite_index = sprWalkSprite
	}
}