/// @description Insert description here
// You can write your code in this editor

randomize();

// Stats Bool
show_var = false;

_bgr = 4;

p1_col = c_white;
p2_col = c_white;

Player_One = pointer_null;
Player_One_Name = "Player One";
Player_Two = pointer_null;
Player_Two_Name = "Player Two";

Camera = pointer_null;
Camera_Center = room_width/2;

// Round Variables
Round_Duration  = 99 * 60;
Round_Timer = Round_Duration;
Round_Over_Delay = 60;
Player_One_Wins = 0;
Player_Two_Wins = 0;

// Sprite Machine
enum SPRITES {
	IDLE		= s_IDLE,
	TAUNT		= s_TAUNT,
	WALK		= s_WALK,
	RUN			= s_WALK,
	CROUCH		= s_CROUCH,
	STAND		= s_STAND,
	JUMP		= s_JUMP,
	FLIP_F		= s_FFLIP,
	FLIP_B		= s_BFLIP,
	FALL		= s_FALL,
	FALL_HURT	= s_FALL_HURT,
	PUNCH_H		= s_PUNCH_H,
	PUNCH		= s_PUNCH,
	PUNCH_L		= s_PUNCH_L,
	PUNCH_L_uc	= s_PUNCH_L_uc,
	KICK_H		= s_KICK,
	KICK		= s_KICK,
	KICK_L		= s_KICK,
	KICK_inAIR	= s_KICK_inAIR,
	BLOCK_H		= s_BLOCK_H,
	BLOCK		= s_BLOCK,
	BLOCK_L		= s_BLOCK_L,
	HURT_H		= s_HURT_H,
	HURT		= s_HURT,
	HURT_L		= s_HURT_L,
	DEATH		= s_DEATH
}


// State Machine
enum STATES {
	IDLE,		TAUNT,
	WALK,		RUN,	
	CROUCH,		STAND,
	JUMP,		FALL,	FALL_HURT,
	BLOCK_H,	BLOCK,	BLOCK_L,
	PUNCH_H,	PUNCH,	PUNCH_L,
	KICK_H,		KICK,	KICK_L, KICK_J,
	HURT_H,		HURT,	HURT_L,
	DEAD
}

// Damage Machine (?)

// Particle System
global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);
scr_initPart();


// Offset Window to Second Monitor
//window_set_position( -1150, window_get_y() - 300);
//room_goto_next();

audio_stop_all();