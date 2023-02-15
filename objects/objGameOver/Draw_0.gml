/// @description restart text


draw_self();
draw_set_halign(fa_center)
draw_text(x,y+80,"Time Lasted: " + string(intMinutesLasted) + ":" +string(global.intTimeLasted))
draw_text(x,y+100,"Press P to Restart") //texto reiniciar
draw_set_halign(fa_left)
