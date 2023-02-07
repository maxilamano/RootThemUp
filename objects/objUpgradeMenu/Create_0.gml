/// @description Funcionamiento Menú


intPointerOffset = 8; //offset del puntero

arrTier1Pos = [
	[x-100,y-20],
	[x,y-20],
	[x+100,y-20]
]; //pos de elementos de tier 1

arrTier2Pos = [
	[-32,48],
	[32,48]
]; //pos elementos tier 2 (relativo a tier 1)

arrTier1Prices = [225,200,250]; //precios de mejoras de tier 1
arrTier2Prices = [//precios de mejoras de tier 2
	[625,450],
	[400,475],
	[500,350]
];
intLastUpgradePrice = 1000;
arrLastUpgradeDescription = [
	"PERMANENT\n+20 Life\nRemoves all upgrades",
	"PERMANENT\nMore damage per bullet\nRemoves all upgrades"
]

arrTier1Description =[
	"Faster shooting\nLess damage per bullet",
	"Shoot everywhere",
	"Slower shooting\nMore damage per bullet"
]

arrTier2Description =[
	[
		"Unlock Radish\nShoots at enemies",
		"More damage per bullet"
	],
	[
		"Unlock Potato\nDistracts enemies\nEveryone loves Mr.Potato",
		"More bullets per shoot"
	],
	[
		"Unlock Granade\nExplodes when touched",
		"Faster shooting"
	]
]