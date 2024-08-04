// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_ammo(_array){
	// _array = [type, amount]
	global.player_ammo[_array[0]] += _array[1];
}