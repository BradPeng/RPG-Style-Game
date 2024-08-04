/// Drop fragments and items

if (entity_fragment_count > 0) {
	var _fragment_array = array_create(entity_fragment_count, entity_fragment);
	drop_items(x, y, _fragment_array);
}

var _entity_drop_list_array = []
_entity_drop_list_array = entity_drop_list
if (_entity_drop_list_array != -1) {
	drop_items(x, y, _entity_drop_list_array);	
}