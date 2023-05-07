// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBow(){
	if (global.playerAmmo[ITEM.BOW] > 0 and global.iLifted == noone) {
		global.playerAmmo[ITEM.BOW]--;
		PlayerActOutAnimation(s_player_bow, PlayerFireArrow);
	}
}