/// Make hat persistent
event_inherited();
if (global.questStatus[? "TheHatQuest"] == 2) {
	instance_destroy();	
}
