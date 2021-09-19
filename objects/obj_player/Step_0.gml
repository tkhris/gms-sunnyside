up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
shift_key = keyboard_check(vk_shift);
space_key = keyboard_check(vk_space);
z_key = keyboard_check(ord("Z"));
left_click = mouse_check_button(mb_left);

max_spd = walk_spd;

xspd = (right_key - left_key);
yspd = (down_key - up_key);

// set sprite
#region Sprite
if ((space_key || attacking) && !digging && !axeing && alarm[0] < 1) {
	xspd = 0;
	yspd = 0;
	if (attacking == false) {
		sprite_index = spr_sword;
		image_index = 0;
		attacking = true;
	}
	
	if (attacking == true && image_index == image_number - 1) {
		attacking = false;
		alarm[0] = cooldown;
	}
	
	exit;
} else if ((z_key || digging) && !attacking && !axeing && alarm[0] < 1) {
	xspd = 0;
	yspd = 0;
	if (digging == false) {
		sprite_index = spr_dig;
		image_index = 0;
		digging = true;
	}
	
	if (digging == true && image_index == image_number - 1) {
		digging = false;
		alarm[0] = cooldown;
	}
	
	exit;
} else if ((left_click || axeing) && !digging && !attacking && alarm[0] < 1) {
	xspd = 0;
	yspd = 0;
	if (axeing == false &&
		current_cursor.plant_colliding != noone  &&
		distance_to_object(current_cursor.plant_colliding) < resource_range &&
		sign(current_cursor.plant_colliding.x - x) == sign(image_xscale)) {
			resource_attacking = current_cursor.plant_colliding;
			sprite_index = spr_axe;
			image_index = 0;
			axeing = true;
	}
	
	if (axeing == true && image_index == image_number - 1) {
		axeing = false;
		resource_attacking.hp--;
		alarm[0] = cooldown;
	}
	
	exit;
} else if (xspd == 0 && yspd == 0) {
	sprite_index = spr_idle;
	exit;
} else if (shift_key) {
	max_spd = run_spd;
	sprite_index = spr_run;
} else {
	sprite_index = spr_walking
}
#endregion

dir = point_direction(0, 0, xspd, yspd);

xspd = lengthdir_x(max_spd, dir);
yspd = lengthdir_y(max_spd, dir);

#region Collisions
if (xspd != 0 && place_meeting(x + xspd, y, obj_parent_collider)) {
	repeat(abs(xspd)) {
		if (!place_meeting(x + xspd, y, obj_parent_collider)) {
			x += sign(xspd);
		} else {
			break;
		}
	}
	xspd = 0;
}

if (yspd != 0 && place_meeting(x, y + yspd, obj_parent_collider)) {
	repeat(abs(yspd)) {
		if (!place_meeting(x, y + sign(yspd), obj_parent_collider)) {
			y += sign(yspd);
		} else {
			break;
		}
	}
	yspd = 0;
}
#endregion

x += xspd;
y += yspd;

#region Image Face
if (xspd > 0) {
	image_xscale = RIGHT;
} else if (xspd < 0) {
	image_xscale = LEFT;
}
#endregion

depth = -y;