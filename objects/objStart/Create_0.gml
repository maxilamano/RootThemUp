/// @description Variables

depth = -999 //al frente

boolClick = false //indica si se le dio clicik

//animación
sqcStart = layer_sequence_create("Instances",room_width/2,room_height/2,sqcStartMenu)
instStart = layer_sequence_get_instance(sqcStart);
sequence_instance_override_object(instStart,objStart,self);