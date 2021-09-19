draw_self();

if (just_died) {
	rotation = -dead_direction * (get_timer() - died_time) div 10000 mod 360;
	if (abs(rotation) >= 80) {
		just_died = false;
		repeat(random_range(2,3)) {
			instance_create_depth(x+random_range(-20,10),y+random_range(-20,10),-900,obj_wood);
		}
	}
	draw_sprite_ext(tree_top, 0, x, y, 1 , 1, rotation, c_white, 1);
}