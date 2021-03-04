/// @description Insert description here
// You can write your code in this editor

image_alpha = 0.5;

if (place_meeting(x,y,target)) {
	var inst = instance_place(x,y,target);
	if (inst != noone) {
		with (inst) {
			PLAYER_STATE_CHANGE(STATES.HURT, State.current, 0, true);
			Collision.damage = other.damage;
			Collision.target = other.target;
			Collision.knockback = other.knockback;
			Collision.hitbox	= other.hitbox
		}
		show_debug_message("HIT: "+hitbox);
		instance_destroy();
	}
}