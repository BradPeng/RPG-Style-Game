// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBomb(){
	if (global.player_ammo[ITEM.BOMB] > 0 and global.i_lifted == noone) {
		global.player_ammo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x + CARDINAL_DIR * 5, y + 10, "Instances", obj_bomb);
		activate_liftable(_bomb);
	}	
}