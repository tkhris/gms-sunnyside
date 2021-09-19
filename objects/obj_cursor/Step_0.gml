x = mouse_x;
y = mouse_y;

if (mouse_check_button_pressed(mb_left)) {
	clicked = true;
	image_index = 0;
}

if (clicked) {
	image_speed = 1;
	if (image_index == image_number - 1) {
		clicked = false;
		image_index = 0;
	}
} else {
	image_speed = 0;
}

