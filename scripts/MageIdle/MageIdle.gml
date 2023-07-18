// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageIdle(){
	if (levitationHeight <= 2 * pi) {
		levitationHeight += pi/25;	
	} else {
		levitationHeight = 0;	
	}
}