/// Drop fragments and items

if (entityFragmentCount > 0) {
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	drop_items(x, y, fragmentArray);
}

if (entityDropList != -1) {
	drop_items(x, y, entityDropList);	
}