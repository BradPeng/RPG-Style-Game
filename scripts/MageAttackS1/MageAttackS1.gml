// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageAttackS1(){
	if (levitationHeight <= 2 * pi) {
		levitationHeight += pi/60;	
	} else {
		levitationHeight = 0;	
	}
	
	sprite_index = s_mage_attack;
}