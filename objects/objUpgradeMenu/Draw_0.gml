/// @description Imostrar mejoras
draw_self();

//no tier
	draw_sprite_ext(sprFlowerT1, 0, arrTier1Pos[0][0], arrTier1Pos[0][1],1,1,0,c_dkgrey,1)//flor
	draw_sprite_ext(sprBushT1  , 0, arrTier1Pos[1][0], arrTier1Pos[1][1],1,1,0,c_dkgrey,1)//arbusto
	draw_sprite_ext(sprTreeT1  , 0, arrTier1Pos[2][0], arrTier1Pos[2][1],1,1,0,c_dkgrey,1)//arbol
		
	//subtier 1
	draw_sprite_ext(sprRadish	 , 0, arrTier1Pos[0][0]+arrTier2Pos[0][0], arrTier1Pos[0][1]+arrTier2Pos[0][1],1,1,0,c_dkgray,1)//rabano
	draw_sprite_ext(sprDamageIcon, 0, arrTier1Pos[0][0]+arrTier2Pos[1][0], arrTier1Pos[0][1]+arrTier2Pos[1][1],1,1,0,c_dkgray,1)//daño
	if(global.arrUpgrades[0] == 1){
		if(global.arrUpgrades[1] == 1){
			draw_sprite(sprRootT2A,0, x-103,y-1);
			draw_sprite(sprRootDot,0, x-102,y);
			draw_sprite_ext(sprRadish	 , 0, arrTier1Pos[0][0]+arrTier2Pos[0][0], arrTier1Pos[0][1]+arrTier2Pos[0][1],1,1,0,c_white,1)//rabano
		}else if(global.arrUpgrades[1] == 2){
			draw_sprite(sprRootT2B,0, x-101,y-1);
			draw_sprite(sprRootDot,0, x-102,y);
			draw_sprite_ext(sprDamageIcon, 0, arrTier1Pos[0][0]+arrTier2Pos[1][0], arrTier1Pos[0][1]+arrTier2Pos[1][1],1,1,0,c_white,1)//daño
		}
	}
	//subtier 2
	draw_sprite_ext(sprPotato	 , 0, arrTier1Pos[1][0]+arrTier2Pos[0][0], arrTier1Pos[1][1]+arrTier2Pos[0][1],1,1,0,c_dkgray,1)//papa
	draw_sprite_ext(sprBulletsIcon, 0, arrTier1Pos[1][0]+arrTier2Pos[1][0], arrTier1Pos[1][1]+arrTier2Pos[1][1],1,1,0,c_dkgray,1)//mas balas
	if(global.arrUpgrades[0] == 2){
		if(global.arrUpgrades[1] == 1){
			draw_sprite(sprRootT2A,0, x-1,y-1);
			draw_sprite(sprRootDot,0, x,y);
			draw_sprite_ext(sprPotato	 , 0, arrTier1Pos[1][0]+arrTier2Pos[0][0], arrTier1Pos[1][1]+arrTier2Pos[0][1],1,1,0,c_white,1)//papa
		}else if(global.arrUpgrades[1] == 2){
			draw_sprite(sprRootT2B,0, x+1,y-1);
			draw_sprite(sprRootDot,0, x,y);
			draw_sprite_ext(sprBulletsIcon, 0, arrTier1Pos[1][0]+arrTier2Pos[1][0], arrTier1Pos[1][1]+arrTier2Pos[1][1],1,1,0,c_white,1)//mas balas
		}
	}
	
	//subtier 3
	draw_sprite_ext(sprGrenade	 , 0, arrTier1Pos[2][0]+arrTier2Pos[0][0], arrTier1Pos[2][1]+arrTier2Pos[0][1],1,1,0,c_dkgray,1)//granada
	draw_sprite_ext(sprBoostIcon , 0, arrTier1Pos[2][0]+arrTier2Pos[1][0], arrTier1Pos[2][1]+arrTier2Pos[1][1],1,1,0,c_dkgray,1)//mas velocidad
	if(global.arrUpgrades[0] == 3){
		if(global.arrUpgrades[1] == 1){
			draw_sprite(sprRootT2A,0, x+101,y-1);
			draw_sprite(sprRootDot,0, x+102,y);
			draw_sprite_ext(sprGrenade	 , 0, arrTier1Pos[2][0]+arrTier2Pos[0][0], arrTier1Pos[2][1]+arrTier2Pos[0][1],1,1,0,c_white,1)//granada
		}else if(global.arrUpgrades[1] == 2){
			draw_sprite(sprRootT2B,0, x+102,y-1);
			draw_sprite(sprRootDot,0, x+102,y);
			draw_sprite_ext(sprBoostIcon , 0, arrTier1Pos[2][0]+arrTier2Pos[1][0], arrTier1Pos[2][1]+arrTier2Pos[1][1],1,1,0,c_white,1)//mas velocidad
		}
	}
	
if(global.intCurrentTier > 0){//tier 1 comprada
	switch(global.arrUpgrades[0]){
		case 1:
			draw_sprite(sprRootT1C,0, x-1,y-41);
			draw_sprite_ext(sprFlowerT1, 0, arrTier1Pos[0][0], arrTier1Pos[0][1],1,1,0,c_white,1)//flor
			draw_sprite(sprCheckmark,0,arrTier1Pos[0][0] + intPointerOffset, arrTier1Pos[0][1] + intPointerOffset) //check
			break;
		case 2:
			draw_sprite(sprRootT1B,0, x,y-39);
			draw_sprite_ext(sprBushT1  , 0, arrTier1Pos[1][0], arrTier1Pos[1][1],1,1,0,c_white,1)//arbusto
			draw_sprite(sprCheckmark,0,arrTier1Pos[1][0] + intPointerOffset, arrTier1Pos[1][1] + intPointerOffset) //check
			break;
		case 3:
			draw_sprite(sprRootT1A,0, x+2,y-41);
			draw_sprite_ext(sprTreeT1  , 0, arrTier1Pos[2][0], arrTier1Pos[2][1],1,1,0,c_white,1)//arbol
			draw_sprite(sprCheckmark,0,arrTier1Pos[2][0] + intPointerOffset, arrTier1Pos[2][1] + intPointerOffset) //check
			break;
	}
}
	if(global.arrUpgrades[0] != 0){ //punto centro
		draw_sprite(sprRootDot,0, x,y-41);
	}
//mostrar descripciones y precios
for(i = 0; i<3; i++){ //tier 1
	if(checkColisionSquare(arrTier1Pos[i][0], arrTier1Pos[0][1],mouse_x,mouse_y,16)){//flor
		draw_sprite(sprPointerCorner,0,arrTier1Pos[i][0] + intPointerOffset, arrTier1Pos[0][1] + intPointerOffset); //mostrar cursor
		drawDescription(arrTier1Description[i],arrTier1Prices[i]); //mostrar descripcion y texto
	}
}
for(i = 0; i<3; i++){ //tier 2
	for(j = 0; j<2; j++){//subtiers
		if(checkColisionSquare(arrTier1Pos[i][0]+arrTier2Pos[j][0], arrTier1Pos[i][1]+arrTier2Pos[j][1],mouse_x,mouse_y,16)){//flor
			draw_sprite(sprPointerCorner,0,arrTier1Pos[i][0]+arrTier2Pos[j][0] + intPointerOffset, arrTier1Pos[i][1]+arrTier2Pos[j][1] + intPointerOffset); //mostrar cursor
			drawDescription(arrTier2Description[i][j],arrTier2Prices[i][j]); //mostrar descripcion y texto
		}
	}
}

//ultima mejora
if(global.intCurrentTier == 2){
	if(checkColisionSquare(mouse_x,mouse_y,x-173,y-33,8)){//vida
		drawDescription(arrLastUpgradeDescription[0],intLastUpgradePrice)
	}
	if(checkColisionSquare(mouse_x,mouse_y,x+173,y-33,8)){//daño
		drawDescription(arrLastUpgradeDescription[1],intLastUpgradePrice)
	}
	draw_sprite_ext(sprHealthBigIcon,0,x-173,y-33,1,1,0,c_white,1);
	draw_sprite_ext(sprDamageBigIcon,0,x+173,y-33,1,1,0,c_white,1);
}