var item = other.item;
var destory = false;
with (obj_inventory) {
	if (ds_list_size(inventory) < INVENTORY_SLOTS) {
		ds_list_add(inventory, item);
		destory = true;
	}
}
if (destory) {
	instance_destroy(other);
}