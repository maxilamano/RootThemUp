/// @description Life UI

draw_self()

if(intLife < intMaxLife){
	//show_debug_message(intLife)
	draw_healthbar(x+intLifeBarX1, y+intLifeBarY1, x+intLifeBarX2, y+intLifeBarY2, intLife, c_white, c_red, c_red, 1, true, false)
}
