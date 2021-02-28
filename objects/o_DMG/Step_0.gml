/// @description Insert description here
// You can write your code in this editor

x = mouse_x;
y = mouse_y;
image_alpha = 0.5;

if (place_meeting(x,y,o_Player)) {
	var inst = instance_place(x,y,o_Player);
	if (inst != noone) {
		with (inst) {
			state_cur = STATES.HURT;
			incDamage.damage = other.damage;
			incDamage.target = other.target;
			incDamage.knockback = other.knockback;
		}
		instance_destroy();
	}
}

// Change Target
image_blend = c_white;
if (y < SYSTEM.Player_One.y - 128) {
	target = "high";
	image_blend = c_red;
}