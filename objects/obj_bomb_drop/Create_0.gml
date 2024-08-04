/// @description Change drops to coin if bomb not unlocked yet
event_inherited();
// collectScriptArg is variable def [item type, amount]
// collectScriptArg[0] is the item type, so bomb. if we 
// dont have it unlocked yet, change the entire instance to a coin
if (!global.player_item_unlocked[collectScriptArg[0]]) {
	instance_change(obj_coin, true);	
}
