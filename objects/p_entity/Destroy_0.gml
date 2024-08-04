/// Drop fragments and items

if (entityFragmentCount > 0) {
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	drop_items(x, y, fragmentArray);
}

if (entity_drop_list != -1) {
	drop_items(x, y, entity_drop_list);	
}