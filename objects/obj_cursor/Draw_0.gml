if (place_meeting(x, y, obj_parent_plant)) {
	plant_colliding = instance_place(x, y, obj_parent_plant);
	//show_debug_message(string(floor((get_timer() / 500000) mod 2)));
	//if (floor((get_timer() / 500000) mod 2) == 0) {
	//	dir = -1;
	//} else {
	//	dir = 1;
	//}
	//distance += (((get_timer() / 500000) mod 2) + 4) * dir;

	if (plant_colliding.hp > 0) {
		draw_sprite(selectbox_tl, 0, plant_colliding.bbox_left-distance, plant_colliding.bbox_top-distance);
		draw_sprite(selectbox_tr, 0, plant_colliding.bbox_right+distance, plant_colliding.bbox_top-distance);
		draw_sprite(selectbox_bl, 0, plant_colliding.bbox_left-distance, plant_colliding.bbox_bottom+distance);
		draw_sprite(selectbox_br, 0, plant_colliding.bbox_right+distance, plant_colliding.bbox_bottom+distance);
	} else {
		plant_colliding = noone;
	}
} else {
	plant_colliding = noone;
}
draw_self();