// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_hat_npc(){
	var _hasHat = global.iLifted != noone and global.iLifted.object_index == obj_hat;
	
	switch (global.quest_status[? "TheHatQuest"]) {
		case 0: // not started
			if (_hasHat) {// player already has hat on them 	
				// complete quest
				new_text_box("ty", 2);
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
				new_text_box("Hello there get me my hat", 2);
				new_text_box("Are you going or what", 2, ["5:Yes", "6:no"]);
			}
			break;
		case 1:
			if (_hasHat) {
				new_text_box("ty", 2);
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
				new_text_box("bruh its right there go get it", 2);
			}
			break;
		case 2: // case already completed
			// thank you message
			new_text_box("ty", 2);
			break;
		
		
	}	
}