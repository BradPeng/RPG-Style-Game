/// @description Drop items
event_inherited();
entity_drop_list = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
	[obj_arrow_drop],
	[obj_arrow_drop, obj_coin],
);

