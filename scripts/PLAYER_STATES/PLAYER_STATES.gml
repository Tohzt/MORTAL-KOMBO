// Script PLAYER STATES

  /********************/
 /** STATE FUNCTIONS */
/********************/

/// @function PLAYER_STATE_IDLE()
function PLAYER_STATE_IDLE() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Delay for Taunt
	if (inp_U_Pressed) State.elapse = 0;
	
	// EXIT: INPUT
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
}
	
/// @function PLAYER_STATE_TAUNT()
function PLAYER_STATE_TAUNT()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Only loop end of animation
	if (State.elapse > 1 && floor(image_index == 0)) image_index = 3;
	
	// EXIT: EOA
	// STATE_CHANGE: Idle
	if (!inp_U)	PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
}

/// @function PLAYER_STATE_WALK()
function PLAYER_STATE_WALK() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Update hsp
	spd_modifier = spd_defaultModifier;
	hsp = move_h * spd * spd_modifier;
	
		
	// EXIT: Null INPUT
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
}
	
/// @function PLAYER_STATE_RUN()
function PLAYER_STATE_RUN() 
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Update hsp
	spd_modifier = spd_defaultModifier * 1.5;
	hsp = move_h * spd * spd_modifier;
		
	// EXIT: Null INPUT
	// STATE_CHANGE: Idle
	if (move_h == 0) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
}

/// @function PLAYER_STATE_CROUCH()
function PLAYER_STATE_CROUCH()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// EXIT: Null INPUT
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

/// @function PLAYER_STATE_JUMP()
function PLAYER_STATE_JUMP()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// JUMP
	if (State.elapse == 1) vsp = jsp;
	// Update hsp
	spd_modifier = 0.75;
	hsp = move_h * spd * spd_modifier;
	
	// EXIT: FALL
	// STATE_CHANGE: Fall
	if (vsp > 0)	PLAYER_STATE_CHANGE(STATES.FALL, State.current, 0, true);
	// STATE_CHANGE: Idle
	if (State.elapse > 1
	&&	isGrounded) PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
}

/// @function PLAYER_STATE_FALL()
function PLAYER_STATE_FALL()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update hsp
	spd_modifier = 0.75;
	hsp = move_h * spd * spd_modifier;
	
	// EXIT: GROUNDED
	// STATE_CHANGE: Idle
	if (isGrounded) {
		PLAYER_STATE_CHANGE(STATES.IDLE, State.current, 0, true);
	}
}

/// @function PLAYER_STATE_BLOCK_H()
function PLAYER_STATE_BLOCK_H()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Defense Up - High Dmg
	//
		
	// EXIT: Release Block || Up INPUT
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
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Defense Up - Mid Dmg
	//
		
	// EXIT: Release Block || Press U/D INPUT
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
	
	// Update Facing Direction
	image_xscale = dir;
	
	// Defense Up - Low Dmg
	//
		
	// EXIT: Release Block || Down INPUT
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

	// Punch High
	// Punch High
	if (State.elapse == 10) {
		atk_x = dir ? x + 64 : x - 64;
		atk_y = y - sprite_height + 100;
		var _atk = instance_create_depth(atk_x, atk_y, depth, o_DMG);
		with (_atk) { 
			image_blend = c_red;
			target = other.target;
			hitbox = "high"
		}
	}
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_PUNCH()
function PLAYER_STATE_PUNCH()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Punch Mid
	if (State.elapse == 10) {
		atk_x = dir ? x + 64 : x - 64;
		atk_y = y - sprite_height + 142;
		var _atk = instance_create_depth(atk_x, atk_y, depth, o_DMG);
		with (_atk) { 
			image_blend = c_orange;
			target = other.target;
			hitbox = "mid"
		}
	}
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_PUNCH_L()
function PLAYER_STATE_PUNCH_L()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Punch Mid
	if (move_h != 0) {
		sprite_index = s_PUNCH_L_uc;
		if (State.elapse == 5) {
			atk_x = dir ? x + 52 : x - 52;
			atk_y = y - sprite_height + 172;
			var _atk = instance_create_depth(atk_x, atk_y, depth, o_DMG);
			with (_atk) { 
				image_blend = c_orange;
				target = other.target;
				hitbox = "mid"
			}
		}
		// Punch High
		if (State.elapse == 10) {
			atk_x = dir ? x + 64 : x - 64;
			atk_y = y - sprite_height + 100;
			var _atk = instance_create_depth(atk_x, atk_y, depth, o_DMG);
			with (_atk) { 
				image_blend = c_red;
				target = other.target;
				hitbox = "high"
			}
		}
	}
	else {
		if (State.elapse == 5) {
			atk_x = dir ? x + 64 : x - 64;
			atk_y = y - sprite_height + 172;
			var _atk = instance_create_depth(atk_x, atk_y, depth, o_DMG);
			with (_atk) { 
				image_blend = c_yellow;
				target = other.target;
				hitbox = "low"
			}
		}
	}
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.CROUCH);
}

/// @function PLAYER_STATE_KICK_H()
function PLAYER_STATE_KICK_H()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Kick High
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_KICK()
function PLAYER_STATE_KICK()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Kick Mid
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_KICK_L()
function PLAYER_STATE_KICK_L()
{//{	if State.elapse == 1 show_debug_message(State.name);
	
	// Kick Low
		
	// EXIT: EOA
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_HURT_H()
function PLAYER_STATE_HURT_H()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Invulnerability
	
	// EXIT: EOA
	// Might Add a Timer
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
}

/// @function PLAYER_STATE_HURT()
function PLAYER_STATE_HURT()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Determine Area Hit
	if (Collision.hitbox == "mid") {
	
		// Invulnerability
		
		// EXIT: EOA
		// Might Add a Timer
		// STATE_CHANGE: Idle
		PLAYER_STATE_CHANGE_EOA(STATES.IDLE);
	}
	else if (Collision.hitbox == "high") {
		PLAYER_STATE_CHANGE(STATES.HURT_H, State.current, 0, true);
	}
	else if (Collision.hitbox == "low") {
		if (State.previous == STATES.CROUCH
		||	State.previous == STATES.BLOCK_L) {
			show_debug_message("crouched")
			PLAYER_STATE_CHANGE(STATES.HURT_L, State.current, 0, true);
		}
		else {
			show_debug_message("NOT crouched")
			// Redirect Hitbox for Animation
			Collision.hitbox = "mid";
			PLAYER_STATE_CHANGE(STATES.HURT, State.current, 0, true);
		}
	}
}
	
/// @function PLAYER_STATE_HURT_L()
function PLAYER_STATE_HURT_L()
{//	if State.elapse == 1 show_debug_message(State.name);
	
	// Invulnerability
	
	// EXIT: EOA
	// Might Add a Timer
	// STATE_CHANGE: Idle
	PLAYER_STATE_CHANGE_EOA(STATES.CROUCH);
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


