// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkColisionSquare(aX, aY, bX, bY, radius){
	if((bX > aX-radius) and (bX < aX+radius) and (bY > aY-radius) and (bY < aY+radius)){
		return true;
	}else{
		return false;
	}

}