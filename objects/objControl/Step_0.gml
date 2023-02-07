/// @description Enemigos y mejoras

//spawn enemigos
if(!global.boolUpgradeOpen){
	if(intEnemySpawnTime > 0 ){
		intEnemySpawnTime--; //reducir tiempo
	}else{
		intEnemyMaxSpawnTime -= max(0.5,15/intLevel); //aumentar nivel
		if(intEnemyMaxSpawnTime < room_speed * 0.5){
			intEnemyMaxSpawnTime = room_speed * 0.5;
		}
		intEnemySpawnTime = intEnemyMaxSpawnTime; //reiniciar el tiempo de spawn
		intEnemySpawnAngle = random_range(0,360); //direccion en la que sale el enemigo
		intEnemySpawnX = objMainPlant.x + lengthdir_x(intEnemySpawnDistance,intEnemySpawnAngle); //pos x del enemigo
		intEnemySpawnY = objMainPlant.y + lengthdir_y(intEnemySpawnDistance,intEnemySpawnAngle); //pos y del enemigo
		instance_create_depth(intEnemySpawnX, intEnemySpawnY, -20,objEnemy) //spawn enemigo
	}
}

//aumentar nivel
if(!global.boolUpgradeOpen){
	if(intLevelIncreaseTime > 0){
		intLevelIncreaseTime--;
	}else{
		intLevelIncreaseTime = intLevelMaxIncreaseTime
		intLevel++
		show_debug_message(intLevel)
	}
	
	//profundidad planta
	if(layer_sequence_is_finished(sqcUpgradeMenu)){
		layer_sequence_destroy(sqcUpgradeMenu)
	}
	
	//aumentar puntos
	if(intWaterIncreaseTime > 0){
		intWaterIncreaseTime--
	}else{
		intWaterIncreaseTime = intWaterMaxIncreaseTime
		global.intWater += intWaterIncreaseValue
	}
}

if (objGamepad.keyUpgrade){
	if(!global.boolUpgradeOpen){
		global.boolUpgradeOpen = true;
		layer_sequence_destroy(sqcUpgradeMenu)
		sqcUpgradeMenu = layer_sequence_create("Upgrades",room_width/2,room_height/2,sqcOpenUpgrade)
		sequence_instance_override_object(layer_sequence_get_instance(sqcUpgradeMenu),objMainPlant,instMainPlant) //usar planta
		sequence_instance_override_object(layer_sequence_get_instance(sqcUpgradeMenu),objUpgradeMenu,instUpgradeMenu) //usar menu
		
		
	}else{
		global.boolUpgradeOpen = false;
		layer_sequence_destroy(sqcUpgradeMenu)
		sqcUpgradeMenu = layer_sequence_create("Upgrades",room_width/2,room_height/2,sqcCloseUpgrade)
		sequence_instance_override_object(layer_sequence_get_instance(sqcUpgradeMenu),objMainPlant,instMainPlant) //usar planta
		sequence_instance_override_object(layer_sequence_get_instance(sqcUpgradeMenu),objUpgradeMenu,instUpgradeMenu) //usar menu
	}
}

//reset
if(keyboard_check_pressed(ord("P"))){
	room_restart();
	instance_destroy(self);
}

//colocar mini planta
if(global.intCurrentTier == 2 and global.arrUpgrades[1] == 1 and !global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", sqcUpgradeMenu)){
	if(objGamepad.keyPlant){
		switch(global.arrUpgrades[0]){
			case 1:
				if(global.intWater - arrMiniPlantPrices[0]){
					global.intWater -= arrMiniPlantPrices[0];
					instance_create_depth(objPlayer.x,objPlayer.y,objPlayer.depth,objRadish)
				}
				break;
			case 2:
				if(global.intWater - arrMiniPlantPrices[1]){
					global.intWater -= arrMiniPlantPrices[1];
					instance_create_depth(objPlayer.x,objPlayer.y,objPlayer.depth,objPotato)
				}
				break;
			case 3:
				if(global.intWater - arrMiniPlantPrices[2]){
					global.intWater -= arrMiniPlantPrices[2];
					instance_create_depth(objPlayer.x,objPlayer.y,objPlayer.depth,objGrenade)
				}
				break;
		}
	}
}

if(global.intPlantLife <=0){
	room_goto(roomGameOver)
}