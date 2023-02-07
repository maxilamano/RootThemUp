/// @description Podrido

if(!global.boolUpgradeOpen and !layer_sequence_exists("Upgrades", objControl.sqcUpgradeMenu)){
	draw_self();
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_maroon,1-intLife/100)
}
