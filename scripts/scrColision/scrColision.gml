// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkColisionSquare(aX, aY, bX, bY, radius){ //detecta colision de dos areas cuadradas
	if((bX > aX-radius) and (bX < aX+radius) and (bY > aY-radius) and (bY < aY+radius)){
		return true;
	}else{
		return false;
	}

}

function inBounds(instance){ //indica si el objeto está completamente dentro del area de la habitación
	if(instance.x-(sprite_width/2) > 0 and instance.x+(sprite_width/2) < room_width and instance.y-(sprite_height/2) > 0 and instance.y+(sprite_height/2) < room_height){
		return true;
	}
	else{
		return false;
	}
}