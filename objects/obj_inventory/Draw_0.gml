x = camera_get_view_x(view_camera[0]) + 128;
y = camera_get_view_y(view_camera[0]) + 128;

if (open) {
	draw_sprite_stretched(
		inventory_background,
		0,
		x,
		y,
		12+row_length*20,
		12+(((INVENTORY_SLOTS-1) div row_length)+1)*20
	);

	for (var i = 0; i < INVENTORY_SLOTS; i++) {
		var xx = x + (i mod row_length) * 20 + 16;
		var yy = y + (i div row_length) * 20 + 16;
		draw_sprite(inventory_slot, 0, xx, yy);
		var item = ds_list_find_value(inventory, i)
		if (item) {
			draw_sprite(item.sprite, 0, xx, yy);
		}
	}
}