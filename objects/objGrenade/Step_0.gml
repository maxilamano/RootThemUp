/// @description Explosion
if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	if(place_meeting(x,y,objEnemy)){
		if(!boolAboutToExplode){
				boolAboutToExplode = true;
				audio_play_sound(fxAboutToExplode,5,false)
		}
		sprite_index = sprGrenadeBoom;
	}

	if(sprite_index == sprGrenadeBoom){
		if(image_index > 7){
			if(!boolExplode){
				boolExplode = true;
				audio_stop_sound(fxAboutToExplode)
				audio_play_sound(fxBoom,5,false)
			}
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