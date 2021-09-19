with(all) {
	depth = -y;
	if (object_get_name(object_index) == "obj_cursor") {
		depth = -1000;
	}
	if (object_get_name(object_index) == "obj_inventory") {
		depth = -900;
	}
}