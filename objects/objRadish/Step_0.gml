/// @description disparo y muerte

if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	if(intLife < 0){
		instance_destroy(self);
	}
	else{
		intLife -= 0.01
	}
	
	if(intReloadTime < 0){
		audio_play_sound(fxShoot,4,false,1,0,random_range(0.7,1.3)) //sonido
		intReloadTime = intMaxReloadTime
		instNewBullet = instance_create_depth(x,y,depth,objBullet)
		instNewBullet.floatHSpeed = lengthdir_x(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
		instNewBullet.floatVSpeed = lengthdir_y(instNewBullet.floatShootSpeed, point_direction(x, y, instance_nearest(x,y,objEnemy).x, instance_nearest(x,y,objEnemy).y));
	}
	else{
		intReloadTime--
	}
}