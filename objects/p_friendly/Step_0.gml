/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused) {
	if (npc_script[state] != -1) {
		script_execute(npc_script[state]);	
	}
	depth = -bbox_bottom;
}