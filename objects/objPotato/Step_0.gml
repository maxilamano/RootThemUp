/// @description PAPA!

if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	if(place_meeting(x+1,y,objEnemy) or place_meeting(x-1,y,objEnemy) or place_meeting(x,y+1,objEnemy) or place_meeting(x,y-1,objEnemy)){
		intLife -= 0.5 
	}
	
	if(intLife < 0){
		instance_destroy(self);
	}
}