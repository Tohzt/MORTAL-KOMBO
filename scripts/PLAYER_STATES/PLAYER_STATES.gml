// Script PLAYER STATES

  /********************/
 /** STATE FUNCTIONS */
/********************/

/// @function PLAYER_STATE_IDLE()
function PLAYER_STATE_IDLE() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	//Update hsp
	hsp = max(0, hsp*sign(hsp)-0.25) * sign(hsp);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Delay for Taunt
	if (inp_U_Pressed) State.elapse = 0;
	
	// STATE_CHANGE: Walk
	if (move_h != 0)PLAYER_STATE_CHANGE(STATES.WALK,	State.current, 0, true);
	// STATE_CHANGE: Crouch
	if (inp_D)		PLAYER_STATE_CHANGE(STATES.CROUCH,	State.current, 0, true);
	// STATE_CHANGE: Jump
	if (inp_JUMP)	PLAYER_STATE_CHANGE(STATES.JUMP,	State.current, 0, true);
	// STATE_CHANGE: Taunt
	if (State.elapse > 60
	&&	inp_U)		PLAYER_STATE_CHANGE(STATES.TAUNT,	State.current, 0, true);
	
	// STATE_CHANGE: Block
	if (inp_BLOCK)	PLAYER_STATE_CHANGE(STATES.BLOCK,	State.current, 0, true);
	
	// STATE_CHANGE: Punch
	if (inp_PUNCH)	PLAYER_STATE_CHANGE(STATES.PUNCH,	State.current, 0, true);
	// STATE_CHANGE: Punch_H
	if (inp_PUNCH
	&&	inp_U)		PLAYER_STATE_CHANGE(STATES.PUNCH_H,	State.current, 0, true);
	
	// STATE_CHANGE: Kick
	if (inp_KICK)	PLAYER_STATE_CHANGE(STATES.KICK,	State.current, 0, true);
}
	
/// @function PLAYER_STATE_TAUNT()
function PLAYER_STATE_TAUNT()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Only loop end of animation
	if (State.elapse > 1 && floor(image_index == 0)) image_index = 3;
	
	// STATE_CHANGE: Idle
	if (!inp_U)	PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
}

/// @function PLAYER_STATE_CROUCH()
function PLAYER_STATE_CROUCH()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Update Facing Direction
	image_xscale = dir;
	
	// STATE_CHANGE: Idle
	if (!inp_D) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
	else {
		// STATE_CHANGE: Low Block
		if (inp_BLOCK)	PLAYER_STATE_CHANGE(STATES.BLOCK_L, State.current, 0, false);
		// STATE_CHANGE: Low Punch
		if (inp_PUNCH)	PLAYER_STATE_CHANGE(STATES.PUNCH_L,	State.current, 0, true);
	}
}

/// @function PLAYER_STATE_STAND()
function PLAYER_STATE_STAND()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}



/// @function PLAYER_STATE_WALK()
function PLAYER_STATE_WALK() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Update hsp
	spd_modifier = spd_defaultModifier;
	hsp = move_h * spd * spd_modifier;
	
	// STATE_CHANGE: Block
	if (inp_BLOCK)	PLAYER_STATE_CHANGE(STATES.BLOCK,	State.current, 0, true)
	// STATE_CHANGE: Idle
	if (move_h == 0) PLAYER_STATE_CHANGE(STATES.IDLE,	State.current, 0, true);
	// STATE_CHANGE: Punch
	if (inp_PUNCH)	PLAYER_STATE_CHANGE(STATES.PUNCH,	State.current, 0, true);
	// STATE_CHANGE: Punch_H
	if (inp_PUNCH 
	&&	inp_U)		PLAYER_STATE_CHANGE(STATES.PUNCH_H,	State.current, 0, true);
	
	// STATE_CHANGE: Jump
	if (inp_JUMP)	PLAYER_STATE_CHANGE(STATES.JUMP,	State.current, 0, true);
	
	// STATE_CHANGE: Kick
	if (inp_KICK)	PLAYER_STATE_CHANGE(STATES.KICK,	State.current, 0, true);
}
	
/// @function PLAYER_STATE_RUN()
function PLAYER_STATE_RUN() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Update hsp
	spd_modifier = spd_defaultModifier * 1.5;
	hsp = move_h * spd * spd_modifier;
		
	// STATE_CHANGE: Idle
	if (move_h == 0) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
}



/// @function PLAYER_STATE_JUMP()
function PLAYER_STATE_JUMP()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// JUMP
	if (State.elapse == 1) vsp = jsp;
	// Update hsp
	spd_modifier = 0.75;
	hsp = move_h * spd * spd_modifier;
	
	// STATE_CHANGE: Fall
	if (vsp > -8)	PLAYER_STATE_CHANGE(STATES.FALL,	State.current, 0, true);
	// STATE_CHANGE: Idle
	if (State.elapse > 1
	&&	isGrounded) PLAYER_STATE_CHANGE(STATES.IDLE,	State.current, 0, true);
	// STATE_CHANGE: Kick
	if (inp_KICK)	PLAYER_STATE_CHANGE(STATES.KICK_J,	State.current, 0, true);
}

/// @function PLAYER_STATE_FALL()
function PLAYER_STATE_FALL()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	if (State.elapse == 1) {
		if (move_h != 0) {
			if (inp_R && dir == 1
			||	inp_L && dir != 1)
				sprite_index = s_FFLIP;
			else 
				sprite_index = s_BFLIP;
			
			image_index = 0;
		}
	}
	
	// Update hsp
	spd_modifier = 0.75;
	hsp = move_h * spd * spd_modifier;
	
	// STATE_CHANGE: Idle
	if (isGrounded) PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	// STATE_CHANGE: Kick
	if (!y + 256 < o_Floor.y
	&& inp_KICK)	PLAYER_STATE_CHANGE(STATES.KICK_J,	State.current, 0, true);
	show_debug_message("y: "+string(y)+" / o_y: "+string(o_Floor.y))
}



/// @function PLAYER_STATE_BLOCK_H()
function PLAYER_STATE_BLOCK_H()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Update Facing Direction
	image_xscale = dir;
	
	// STATE_CHANGE: Idle
	if (!inp_BLOCK) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
	// STATE_CHANGE: Block
	if (inp_BLOCK && !inp_U) {
		PLAYER_STATE_CHANGE(STATES.BLOCK, State.current, State.elapse, true);
	}
}
	
/// @function PLAYER_STATE_BLOCK()
function PLAYER_STATE_BLOCK()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Update Facing Direction
	image_xscale = dir;
	
	// STATE_CHANGE: Idle
	if (!inp_BLOCK) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
	// STATE_CHANGE: Block_H
	if (inp_BLOCK && inp_U) {
		PLAYER_STATE_CHANGE(STATES.BLOCK_H, State.current, State.elapse, true);
	}
	// STATE_CHANGE: Block_L
	if (inp_BLOCK && inp_D) {
		PLAYER_STATE_CHANGE(STATES.BLOCK_L, State.current, State.elapse, true);
	}
}

/// @function PLAYER_STATE_BLOCK_L()
function PLAYER_STATE_BLOCK_L()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Update Facing Direction
	image_xscale = dir;
	//
	// STATE_CHANGE: Idle
	if (!inp_BLOCK) {
		if (inp_D)	PLAYER_STATE_CHANGE(STATES.CROUCH,	State.current, State.elapse, false);
		if (!inp_D) PLAYER_STATE_CHANGE(STATES.IDLE,	State.current, 0, true);
	}
	// STATE_CHANGE: Block
	if (inp_BLOCK && !inp_D) {
		PLAYER_STATE_CHANGE(STATES.BLOCK, State.current, State.elapse, true);
	}
}



/// @function PLAYER_STATE_PUNCH_H()
function PLAYER_STATE_PUNCH_H()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;

	// Punch High
	if (State.elapse == 10) {
		atk_x = dir ? x + 64 : x - 64;
		atk_y = y - sprite_height + 100;
		PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "high", dmg_basic);
	}
		
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_PUNCH()
function PLAYER_STATE_PUNCH()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Punch Mid
	if (State.elapse == 10) {
		atk_x = dir ? x + 64 : x - 64;
		atk_y = y - sprite_height + 142;
		PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "mid", dmg_basic)
	}
		
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_PUNCH_L()
function PLAYER_STATE_PUNCH_L()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// Punch Mid
	if (move_h != 0) {
		sprite_index = s_PUNCH_L_uc;
		if (State.elapse == 5) {
			atk_x = dir ? x + 52 : x - 52;
			atk_y = y - sprite_height + 172;
			PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "low", dmg_weak);
		}
		// Punch High
		if (State.elapse == 10) {
			atk_x = dir ? x + 64 : x - 64;
			atk_y = y - sprite_height + 100;
			PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "high", dmg_strong);
		}
	}
	else {
		if (State.elapse == 5) {
			atk_x = dir ? x + 64 : x - 64;
			atk_y = y - sprite_height + 172;
			PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "low", dmg_basic);
		}
	}
		
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.CROUCH);
}



/// @function PLAYER_STATE_KICK_H()
function PLAYER_STATE_KICK_H()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_KICK()
function PLAYER_STATE_KICK()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	if (State.elapse == 15) {
		var _xx = 64;
		atk_x = dir ? x + _xx : x - _xx;
		atk_y = y - sprite_height + 102;
		PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "high", dmg_strong)
	}
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_KICK_L()
function PLAYER_STATE_KICK_L()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = 0;
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_KICK_J()
function PLAYER_STATE_KICK_J()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// In-Air Controls
	if (move_h != 0 && move_h == dir) hsp = move_h * spd * 0.75;
	
	// Deploy Attack
	if (State.elapse == 15) {
		var _xx = 64;
		atk_x = dir ? x + _xx : x - _xx;
		atk_y = y - sprite_height + 160;
		PLAYER_ACTION_ATTACK(atk_x, atk_y, target, "high", dmg_basic);
	}
	
	// STATE_CHANGE: Fall
	PLAYER_STATE_CHANGE_EOA(STATES.FALL);
}



/// @function PLAYER_STATE_HURT_H()
function PLAYER_STATE_HURT_H()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = move_h * spd * 0.5;
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_HURT()
function PLAYER_STATE_HURT()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = move_h * spd * 0.5;
	
	// State Variable
	var blocked = false;
	
	// Take Damage
	if (State.elapse <= 1)	{
		// Check if Blocking && Matching
		if (Collision.hitbox == "mid" && State.previous == STATES.BLOCK) {
			blocked = true;
		}
		else if (Collision.hitbox == "high" && State.previous == STATES.BLOCK_H) {
			blocked = true;
		}
		else if (Collision.hitbox == "low" && State.previous == STATES.BLOCK_L) {
			blocked = true;
		}
		// Take Damage
		hp = max(0, hp-(blocked ? Collision.damage div 4 : Collision.damage));
		
	}
	
	if (!isGrounded) {
		vsp = jsp*0.75;
		PLAYER_STATE_CHANGE(STATES.FALL_HURT, State.current, 0, true);
	}
	else {
		if (blocked) {
			// Play Block Sound
			//audio_play_sound(choose(s_AttackSound_01, s_AttackSound_02), 0,false);
			// Play Impace Particles
			part_particles_create(global.partSystem, Collision.xx, Collision.yy, global.ptBlock, 1);
		
			// Return to previous State;
			PLAYER_STATE_CHANGE(State.previous, State.current, 0, false);
		}
		else {
			// Play Impact Sound
			audio_play_sound(choose(s_AttackSound_01, s_AttackSound_02), 0,false);
			// Play Impace Particles
			part_particles_create(global.partSystem, Collision.xx, Collision.yy, global.ptBlood, 20);
		
			// Determine Area Hit
			if (Collision.hitbox == "mid") {
				// Set iFrames
				if (State.elapse == 1) iFrames = durInvul;
				// STATE_CHANGE: Idle
				PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
			}
			else if (Collision.hitbox == "high") {
				// Set iFrames
				if (State.elapse == 1) iFrames = durInvul;
				PLAYER_STATE_CHANGE(STATES.HURT_H, State.current, 0, true);
			}
			else if (Collision.hitbox == "low") {
				if (State.previous == STATES.CROUCH
				||	State.previous == STATES.BLOCK_L) {
					// Set iFrames
					if (State.elapse == 1) iFrames = durInvul;
					PLAYER_STATE_CHANGE(STATES.HURT_L, State.current, 0, true);
				}
				else {
					// Redirect Hitbox for Animation
					Collision.hitbox = "mid";
					// Set iFrames
					if (State.elapse == 1) iFrames = durInvul;
					PLAYER_STATE_CHANGE(STATES.HURT, State.current, 0, true);
				}
			}
		}
	}
}
	
/// @function PLAYER_STATE_HURT_L()
function PLAYER_STATE_HURT_L()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	hsp = move_h * spd * 0.5;
	
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.CROUCH);
}

/// @function PLAYER_STATE_FALL_HURT()
function PLAYER_STATE_FALL_HURT()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	
	// Update hsp
	spd_modifier = 0.75;
	hsp = -dir * spd * spd_modifier;
	
	// STATE_CHANGE: Idle
	if (isGrounded) {
		PLAYER_STATE_CHANGE(STATES.STAND, State.current, 0, true);
	}
}


/// @function PLAYER_STATE_DEAD()
function PLAYER_STATE_DEAD()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Stop Moving
	hsp = 0;
	
	// EXIT: Timer
	// STATE_CHANGE: Idle
	if (keyboard_check_pressed(vk_space)) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
}


