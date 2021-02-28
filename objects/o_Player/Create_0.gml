/// @description Init Player CREATE

// Health
hp_max = 100;
hp = hp_max;

// Movement Variables
input = "P1";
hsp = 0;
vsp = 0;
move_h = 0;
move_v = 0;

spd = 2.5;
spd_res = 1;
jsp = -8;

// Attack Variables
act_delay = 10;
act_cd = 0;

enum ACTIONS {
	PUNCH,
	UPPERCUT,
	HIGHPUNCH,
	BLOCK,
	LOWBLOCK,
	KICK,
	NULL
}
act_cur = ACTIONS.NULL;

// Animation Machine
enum ANIMS {
	IDLE	= s_IDLE,
	WALK	= s_WALK,
	CROUCH	= s_CROUCH,
	JUMP	= s_JUMP,
	PUNCH	= s_PUNCH,
	UPCUT	= s_UPPERCUT,
	HPUNCH	= s_HIGHPUNCH,
	BLOCK	= s_BLOCK,
	BLOCK_L = s_BLOCK_L,
	BLOCK_H = s_BLOCK_H,
	HURT	= s_HURT,
	HURT_H	= s_HURT_H,
	DEATH	= s_DEATH
}
anim_cur = ANIMS.IDLE;
anim_spd = 0.25;
anim_dir = 1;

// State Machine
enum STATES {
	IDLE,
	MOVE,
	ACTION,
	HURT,
	DEAD
}
state_name	= "";
state_init	= true;
state_cur	= STATES.IDLE;
state_prev	= STATES.IDLE;
state_dur	= 0;
grounded	= false;
crouched	= false;
alive		= true;

// Damage Variables
incDamage = {
	damage	  : 0,
	target	  : "",
	knockback : false,
};