if (hp < max_hp && hp >= 0) {
	if (healthbar == noone && hp > 0) {
		healthbar = instance_create_depth(x,y,-2000,obj_redbar);
		healthbar.image_speed = 0;
	}
	
	if (hp <= 0 && dead = false) {
		instance_destroy(healthbar);
		healthbar = noone;
		just_died = true;
		dead = true;
		died_time = get_timer();
		dead_direction = sign(instance_find(obj_player, 0).image_xscale);
	} else if (healthbar != noone) {
		healthbar.image_index = 3;
	}
}