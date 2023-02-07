/// @description Definir variables

strEnemyType = choose("timber","pyro","bug"); //definir aleatoriamente tipo de enemigo


//definir sprite segun enemigo y su ataque
intDamage = 0; //daño por ataque
intDamageMaxTime = 0; //tiempo entre cada ataque
intDamageTime = 0; //tiempo restante para atacar
boolAtack = false; //indica si atacó o no
switch(strEnemyType){
	case "timber":
		sprite_index = sprTimber;
		intDamage = 8; //daño por ataque
		intDamageMaxTime = 1*room_speed; //tiempo entre cada ataque
		intDamageTime = intDamageTime; //tiempo restante para atacar
		sprWalkSprite = sprTimber; //sprite de caminar
		sprAtackSprite = sprTimberAttack; //sprite de araque
		break;
	case "pyro":
		sprite_index = sprPyro;
		intDamage = 1; //daño por ataque
		intDamageMaxTime = 0.3*room_speed; //tiempo entre cada ataque
		intDamageTime = intDamageTime; //tiempo restante para atacar
		sprWalkSprite = sprPyro; //sprite de caminar
		sprAtackSprite = sprPyroAttack; //sprite de araque
		break;
	case "bug":
		sprite_index = sprBug;
		intDamage = 6;
		intDamageMaxTime = 1*room_speed; //tiempo entre cada ataque
		intDamageTime = intDamageTime; //tiempo restante para atacar
		sprWalkSprite = sprBug; //sprite de caminar
		sprAtackSprite = sprBugAttack; //sprite de araque
		break;
}

//movimiento
floatHSpeed = 0; //velocidad horizontal
floatVSpeed = 0; //velocidad vertical
floatMaxSpeed = 0.6; //velocidad maxima
floatAcc = 0.01 //aceleracion
intMoveDirection = point_direction(x,y,objMainPlant.x,objMainPlant.y); //direccion a la que se mueve
intCurrentX = x; //guardar x
intCurrentY = y //guardat y



//vida
intMaxLife = 100; //vida total
intLife = intMaxLife; //vida actual
floatKnockback = 2 //knockback al tocar una bala
floatBulletDefaultDamage = 20;
if(instance_exists(objBullet)){//cambiar daño segun bala
	floatBulletDefaultDamage = instance_nearest(x,y,objBullet).floatDamage
}
floatBulletDamage = floatBulletDefaultDamage;

intBugLife = 70;
intPyroLife = 100;
intTimberLife = 150


//pos de barra de vida con respecto al enemigo (las cuatro esquinas)
intLifeBarX1 = -20;
intLifeBarY1 = -30;
intLifeBarX2 = 20;
intLifeBarY2 = -25;

