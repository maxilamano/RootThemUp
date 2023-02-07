/// @description Funcionamiento
// You can write your code in this editor

depth = -y //profundidad
switch(global.intCurrentTier){
	case 0:
		sprite_index = sprMainPlant;
		break;
	case 1:
		switch(global.arrUpgrades[0]){
			case 1:
				sprite_index = sprFlowerT1;
				break;
			case 2:
				sprite_index = sprBushT1;
				break;
			case 3:
				sprite_index = sprTreeT1;
				break;
		}
		break;
}

if(!global.boolUpgradeOpen){
	if(global.intCurrentTier == 0){
		if(intReloadTime > 0){
			intReloadTime--
		}else{
			intReloadTime = intMaxReloadTime;
			if(instance_exists(objEnemy)){
				audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
				instNewBullet = instance_create_depth(x,y,depth,objBullet)
				instNewBullet.floatHSpeed = lengthdir_x(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
				instNewBullet.floatVSpeed = lengthdir_y(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
			}
		}
	}else{
		switch(global.arrUpgrades[0]){
			case 1: //flor
				if(intReloadTime > 0){
					intReloadTime -= 4
				}else{
					intReloadTime = intMaxReloadTime;
					if(instance_exists(objEnemy)){
						audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
						instNewBullet = instance_create_depth(x,y,depth,objBullet)
						instNewBullet.floatHSpeed = lengthdir_x(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
						instNewBullet.floatVSpeed = lengthdir_y(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
						if(global.arrUpgrades[1] == 2){
							instNewBullet.floatDamage = instNewBullet.floatDamage * 1.1;
						}else{
							instNewBullet.floatDamage = instNewBullet.floatDamage * 0.6;
						}
					}
				}
				break;
			case 2: //arbusto
				if(intReloadTime > 0){
					intReloadTime--;
				}else{
					intReloadTime = intMaxReloadTime;
					intShootAngle = 30; //angulo entre cada bala
					if(global.arrUpgrades[1] == 2){
						intShootAngle = 20;
					}
					for(i = 0; i < 360; i+= intShootAngle){
						audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
						instNewBullet = instance_create_depth(x,y,depth,objBullet)
						instNewBullet.floatHSpeed = lengthdir_x(instNewBullet.floatShootSpeed,i)
						instNewBullet.floatVSpeed = lengthdir_y(instNewBullet.floatShootSpeed,i)
					}
				}
				break;
			case 3: //arbol
				if(intReloadTime > 0){
					if(global.arrUpgrades[1] == 2){
						intReloadTime -= 1.1;
					}else{
						intReloadTime-= 0.8;
					}
				}else{
					intReloadTime = intMaxReloadTime;
					if(instance_exists(objEnemy)){
						audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
						instNewBullet = instance_create_depth(x,y,depth,objBullet)
						instNewBullet.floatHSpeed = lengthdir_x(instNewBullet.floatShootSpeed/2, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
						instNewBullet.floatVSpeed = lengthdir_y(instNewBullet.floatShootSpeed/2, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
						instNewBullet.floatDamage = instNewBullet.floatDamage * 2.5;
						
						//agrandar bala
						instNewBullet.image_xscale = 2
						instNewBullet.image_yscale = 2
					}
				}
				break;
		}
	}
}
