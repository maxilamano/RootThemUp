/// @description Funcionamiento

depth = -y
if(place_meeting(x,y,objPlayer)){
	floatPitch = random_range(0.5,1.3);
	audio_play_sound(fxWaterPickup,3,false,1,0,floatPitch)
	global.intWater += intWaterValue;
	instance_destroy(self);
}

if(global.boolUpgradeOpen){
	if(image_alpha > 0){
		image_alpha -= 0.1
	}
}else{
	if(image_alpha < 1){
		image_alpha += 0.03
	}
}
