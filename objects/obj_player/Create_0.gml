#macro RIGHT 1;
#macro LEFT -1;

health = 7;

xspd = 0;
yspd = 0;
walk_spd = 1;
run_spd = 2;



attacking = false;
digging = false;
axeing = false;
cooldown = room_speed / 4;
current_cursor = instance_find(obj_cursor, 0);
gather_range = 20;
resource_range = 20;
resource_attacking = noone;