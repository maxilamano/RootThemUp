/// @description Creacion de variables e instancias

depth = -999 //siempre arriba

instance_create_depth(0,0,-999,objGamepad); //gamepad

instUpgradeMenu = instance_create_layer(room_width/2, room_height+(room_height/2), "Upgrades", objUpgradeMenu)
instMainPlant = instance_create_depth(room_width/2,room_height/2,0,objMainPlant) //planta principal

global.debugMode = false; //modo debug

intEnemyMaxSpawnTime = random_range(2*room_speed,5*room_speed); //tiempo de spawn de enemigos
intLevel = 1; //nivel de dificultad, afecta al tiempo de spawn de enemigos e incrementa con el tiempo
intLevelMaxIncreaseTime = 10*room_speed; //tiempo maximo para subir de nivel
intLevelIncreaseTime = intLevelMaxIncreaseTime; //tiempo restante para subir de nivel
intEnemySpawnTime = 0//intEnemyMaxSpawnTime;
intEnemySpawnDistance = room_width;


//secuencia menu mejoras
sqcUpgradeMenu = layer_sequence_create("Upgrades",room_width/2,room_height/2,sqcNone);
global.boolUpgradeOpen = false //indica si el menu ed mejoras está abierto

global.arrUpgrades = [0,0,0]; //indica la mejora comprada en cada tier (0 significa ninguno)
global.intCurrentTier = 0; //tier mas alta comprada (0  significa ninguno)

//agua (puntos)
intWaterMaxIncreaseTime = 5 * room_speed;
intWaterIncreaseTime = intWaterMaxIncreaseTime;
intWaterIncreaseValue = 5;
global.intWater = 100000// cantidad inicial de agua

//vida
global.intPlantLife = 100;


//ataque
global.floatDamage = 20

//mini plantas
arrMiniPlantPrices = [350, 500, 400] //precios mini plantas

//sonido
if(!audio_group_is_loaded(Fx)){ //efectos de sonido
	audio_group_load(Fx);
}
if(!audio_group_is_loaded(Music)){ //musica
	audio_group_load(Music);
}