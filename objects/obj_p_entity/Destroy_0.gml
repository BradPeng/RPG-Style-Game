/// Drop fragments and items

if (entity_fragment_count > 0) {
	var _fragment_array = array_create(entity_fragment_count, entity_fragment);
	drop_items(x, y, _fragment_array);
}

if (entity_drop_list != -1) {
	drop_items(x, y, entity_drop_list);	
}