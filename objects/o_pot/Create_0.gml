/// @description Drop items
event_inherited();
image_speed = 0;
entityDropList = choose(
	[o_coin],
	[o_coin, o_coin],
	[o_coin, o_coin, o_coin],
	[o_bomb_drop],
	[o_bomb_drop, o_coin],
	[o_arrow_drop],
	[o_arrow_drop, o_coin],
);

