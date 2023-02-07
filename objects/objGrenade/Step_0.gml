/// @description Explosion
if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	if(place_meeting(x,y,objEnemy)){
		sprite_index = sprGrenadeBoom;
	}

	if(sprite_index == sprGrenadeBoom){
		if(image_index > 7){
			while(place_meeting(x,y,objEnemy)){
				instEnemy = instance_nearest(x,y,objEnemy)
				instance_create_depth(instEnemy.x,instEnemy.y,instEnemy.depth,objWater) //dejar agua
				instance_destroy(instance_nearest(x,y,objEnemy))
			}
		}
		if(image_index > 16){
			instance_destroy(self);
		}
	}
}