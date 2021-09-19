#macro INVENTORY_SLOTS 15
row_length = 6;
inventory = ds_list_create();
randomize();
ds_list_add(inventory, new Wood());
ds_list_add(inventory, new Carrot());
ds_list_add(inventory, new Fish());

open = false;