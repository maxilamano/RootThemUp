/// @description Insert description here
// You can write your code in this editor

intMinutesLasted = 0; //minutos aguantados

while(global.intTimeLasted >= 60){
	intMinutesLasted++;
	global.intTimeLasted -= 60;
}