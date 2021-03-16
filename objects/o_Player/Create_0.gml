/// @description Init Player CREATE

// Health
hp_max = 100;
hp = hp_max;
hp_disp = hp;
iFrames = 0;
durInvul = 20;

// Movement Variables
input = "P1";
hsp = 0;
vsp = 0;
move_h = 0;
dir = 1; // LEFT: -1 | RIGHT: 1 

isGrounded = true;

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


dmg_weak = 2;
dmg_basic = 5;
dmg_strong = 10;

// Damage Variables
Collision = {
	xx		  : 0,
	yy		  : 0,
	damage	  : 0,
	target	  : "",
	knockback : false,
	hitbox	  : "mid"
};

State = {
	name	 : "IDLE",
	current  : STATES.IDLE,
	previous : STATES.IDLE,
	elapse	 : 0,
	anim	 : SPRITES.IDLE,
	animSpd  : 0.5,
	animLoop : true
};

// Character
color = c_white;








