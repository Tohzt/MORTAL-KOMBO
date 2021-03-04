/// @description Init Player CREATE

// Health
hp_max = 100;
hp = hp_max;

// Movement Variables
input = "P1";
hsp = 0;
vsp = 0;
move_h = 0;
dir = 1; // LEFT: -1 | RIGHT: 1 

spd = 5;
spd_defaultModifier = 1;
spd_modifier = spd_defaultModifier;
jsp = -14;

target = pointer_null;

// Attack Variables
atk_delay = 10;
atk_cd	  = 0;
atk_x = pointer_null;
atk_y = pointer_null;

// Damage Variables
Collision = {
	damage	  : 0,
	target	  : "",
	knockback : false,
	hitbox	  : "mid"
};

// State Machine
enum STATES {
	IDLE,		TAUNT,
	WALK,		RUN,
	CROUCH,		JUMP,	FALL,
	BLOCK_H,	BLOCK,	BLOCK_L,
	PUNCH_H,	PUNCH,	PUNCH_L,
	KICK_H,		KICK,	KICK_L,
	HURT_H,		HURT,	HURT_L,
	DEAD
}

State = {
	name : "IDLE",
	current : STATES.IDLE,
	previous : STATES.IDLE,
	elapse : 0,
	anim : s_IDLE,
	animSpd : 0.5,
	animLoop : true
};
