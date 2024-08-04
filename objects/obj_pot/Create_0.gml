/// @description Drop items
event_inherited();
image_speed = 0;
entityDropList = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
	[obj_arrow_drop],
	[obj_arrow_drop, obj_coin],
);

