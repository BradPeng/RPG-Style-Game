// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoomTransition(_type, _targetRoom){
	if (!instance_exists(o_transition)) {
		with(instance_create_depth(0, 0, -9999, o_transition)) {
			type = _type
			target = _targetRoom
		}
	} else {
		show_debug_message("Trying to transistion while transition is already happening");	
	}
}