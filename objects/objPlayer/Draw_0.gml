/// @description Insert description here
// You can write your code in this editor

//draw_text(0,0,x);
//draw_text(0,20,y);
if(global.boolUpgradeOpen){
	if(image_alpha > 0){
		image_alpha -= 0.1
	}
}else{
	if(image_alpha < 1){
		image_alpha += 0.03
	}
}

