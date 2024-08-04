/// Make hat persistent
event_inherited();
if (global.quest_status[? "TheHatQuest"] == 2) {
	instance_destroy();	
}
