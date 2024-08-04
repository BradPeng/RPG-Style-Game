// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBow(){
	if (global.playerAmmo[ITEM.BOW] > 0 and global.i_lifted == noone) {
		global.playerAmmo[ITEM.BOW]--;
		endActionFrame = 5;
		player_act_out_animation(spr_player_bow, player_fire_arrow);
	}
}