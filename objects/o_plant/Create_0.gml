/// Drop coins
event_inherited();

entityDropList = choose(
	[o_coin],
	[o_coin, o_coin],
	[o_coin, o_coin, o_coin],
	[o_bomb_drop],
	[o_bomb_drop, o_coin],
	[o_arrow_drop],
	[o_arrow_drop, o_coin],
	-1,
	-1,
	-1,
	-1,
	-1
	);