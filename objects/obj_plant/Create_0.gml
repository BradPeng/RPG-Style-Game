/// Drop coins
event_inherited();

entityDropList = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
	[obj_arrow_drop],
	[obj_arrow_drop, obj_coin],
	-1,
	-1,
	-1,
	-1,
	-1
	);