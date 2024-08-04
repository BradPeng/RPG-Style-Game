// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mage_levitate(){
	if (levitation_height <= 2 * pi) {
		levitation_height += pi/60;	
	} else {
		levitation_height = 0;	
	}
	z = 15 + 5 * sin(levitation_height);
}