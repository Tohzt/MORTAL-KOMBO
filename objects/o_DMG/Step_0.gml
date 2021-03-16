/// @description Insert description here
// You can write your code in this editor

image_alpha = 0.5;

if (place_meeting(x,y,target)) {
	var inst = instance_place(x,y,target);
	if (inst != noone) {
		if (inst.iFrames == 0) {
			with (inst) {
				PLAYER_STATE_CHANGE(STATES.HURT, State.current, 0, true);
				Collision.xx		= other.x;
				Collision.yy		= other.y;
				Collision.damage	= other.damage;
				Collision.target	= other.target;
				Collision.knockback = other.knockback;
				Collision.hitbox	= other.hitbox
			}
		}
		instance_destroy();
	}
}