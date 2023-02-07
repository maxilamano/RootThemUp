/// @description Puntero y compra

//cambiar pos de tiers
arrTier1Pos = [
	[x-100,y-20],
	[x,y-20],
	[x+100,y-20]
]; //pos de elementos de tier 1

//compra mejoras
if(global.intCurrentTier == 0){
	for(i = 0; i<3; i++){
		if(checkColisionSquare(arrTier1Pos[i][0], arrTier1Pos[0][1],mouse_x,mouse_y,16)){//flor
			if(objGamepad.keyShoot and global.intCurrentTier == 0){
				if(global.intWater >= arrTier1Prices[i]){
					audio_play_sound(fxWaterUpgrade,1,false); //sonido
					global.intWater -= arrTier1Prices[i];
					global.arrUpgrades[0] = i+1;
					global.intCurrentTier++;
				}
			}
		}
	}
}else if(global.intCurrentTier == 1){
	for(i = 0; i<2; i++){
		if(checkColisionSquare(arrTier1Pos[global.arrUpgrades[0]-1][0] + arrTier2Pos[i][0], arrTier1Pos[global.arrUpgrades[0]-1][1] + arrTier2Pos[i][1],mouse_x,mouse_y,16)){//flor
			if(objGamepad.keyShoot and global.intCurrentTier == 1){
				if(global.intWater >= arrTier2Prices[global.arrUpgrades[0]-1][i]){
					audio_play_sound(fxWaterUpgrade,1,false); //sonido
					global.intWater -= arrTier2Prices[global.arrUpgrades[0]-1][i];
					global.arrUpgrades[1] = i+1;
					global.intCurrentTier++;
				}
			}
		}
	}
}
//ultima mejora
if(global.intCurrentTier == 2){
	if(checkColisionSquare(mouse_x,mouse_y,x-173,y-33,8)){//vida
		if(objGamepad.keyShoot){
			if(global.intWater - intLastUpgradePrice >= 0){
				audio_play_sound(fxMasterUpgrade,3,false) //sonido
				global.intWater -= intLastUpgradePrice
				global.arrUpgrades = [0,0,0];
				global.intCurrentTier = 0;
				global.intPlantLife+=20;
			}
		}
	}
	if(checkColisionSquare(mouse_x,mouse_y,x+173,y-33,8)){//daño
		if(objGamepad.keyShoot){
			if(global.intWater - intLastUpgradePrice >= 0){
				audio_play_sound(fxMasterUpgrade,3,false) //sonido
				global.intWater -= intLastUpgradePrice
				global.arrUpgrades = [0,0,0];
				global.intCurrentTier = 0;
				global.floatDamage+=12;
			}
		}	
	}
}