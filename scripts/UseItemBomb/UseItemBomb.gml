// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBomb(){
	if (global.playerAmmo[ITEM.BOMB] > 0 and global.iLifted == noone) {
		global.playerAmmo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", o_bomb);
		ActivateLiftable(_bomb);
	}	
}