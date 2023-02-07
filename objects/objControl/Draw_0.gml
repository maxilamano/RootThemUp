/// @description DEBUG Y GUI
// mostrar variables en debug
if(global.debugMode){
	draw_text(0,0,"keyVAxis: " + string(objGamepad.keyVAxis));
	draw_text(0,20,"keyHAxis: " + string(objGamepad.keyHAxis));
	draw_text(0,40,"Shoot: " + string(objGamepad.keyShoot));
}

//--------------indicador mejoras, agua y vida--------------

//mejoras
draw_sprite(sprUpgradeBanner,0,room_width,0)
if(objGamepad.strControllerMode == "keyboard"){
	draw_sprite(sprUpgradeButton,0,room_width,0)
}else{
	draw_sprite(sprUpgradeButton,1,room_width-1,1)
}

//agua
draw_sprite(sprWaterIcon,0,room_width-16,0)
draw_set_halign(fa_right)
draw_set_font(fntScore);
draw_text(room_width-30, 4,string(global.intWater))

//vida
draw_set_halign(fa_left)
draw_sprite(sprLifeIcon,0,2,0)
draw_text(20,4,string(global.intPlantLife))

//mini planta
if(global.intCurrentTier == 2 and global.arrUpgrades[1] == 1 and !global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", sqcUpgradeMenu)){
	draw_sprite_ext(sprUpgradeBanner,9,0,room_height,-1,-1,0,c_white,1)
	switch(global.arrUpgrades[0]){
		case 1:
			draw_sprite(sprRadish,0,9,room_height-12)
			draw_text(14,room_height-13,arrMiniPlantPrices[0])
			draw_sprite(sprWaterMiniIcon,0,46,room_height-12)
			break;
		case 2:
			draw_sprite(sprPotato,0,9,room_height-12)
			draw_text(14,room_height-13,arrMiniPlantPrices[1])
			draw_sprite(sprWaterMiniIcon,0,46,room_height-12)
			break;
		case 3:
			draw_sprite(sprGrenade,0,9,room_height-12)
			draw_text(16,room_height-13,arrMiniPlantPrices[2])
			draw_sprite(sprWaterMiniIcon,0,48,room_height-12)
			break;
	}
}

