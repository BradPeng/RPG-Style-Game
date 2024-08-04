/// @description Change drops to coin if bomb not unlocked yet
event_inherited();
// collect_script_arg is variable def [item type, amount]
// collect_script_arg[0] is the item type, so bomb. if we 
// dont have it unlocked yet, change the entire instance to a coin
if (!global.player_item_unlocked[collect_script_arg[0]]) {
	instance_change(obj_coin, true);	
}
