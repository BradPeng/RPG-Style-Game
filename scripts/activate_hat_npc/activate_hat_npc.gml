// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_hat_npc(){
	var _hasHat = global.iLifted != noone and global.iLifted.object_index == obj_hat;
	
	switch (global.quest_status[? "TheHatQuest"]) {
		case 0: // not started
			if (_hasHat) {// player already has hat on them 	
				// complete quest
				NewTextBox("ty", 2);
				global.quest_status[? "TheHatQuest"] = 2;
				with (obj_hat) {
					instance_destroy();	
				}
				global.iLifted = noone;
				with (obj_player) {
					spriteIdle = spr_player;
					spriteRun = spr_player_run
				}	
			} else {
				// start quest	
				NewTextBox("Hello there get me my hat", 2);
				NewTextBox("Are you going or what", 2, ["5:Yes", "6:no"]);
			}
			break;
		case 1:
			if (_hasHat) {
				NewTextBox("ty", 2);
				global.quest_status[? "TheHatQuest"] = 2;
				with (obj_hat) {
					instance_destroy();	
				}
				global.iLifted = noone;
				with (obj_player) {
					spriteIdle = spr_player;
					spriteRun = spr_player_run
				}	
			} else {
				// reminder	
				NewTextBox("bruh its right there go get it", 2);
			}
			break;
		case 2: // case already completed
			// thank you message
			NewTextBox("ty", 2);
			break;
		
		
	}	
}