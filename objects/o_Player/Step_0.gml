/// @description STEP
//show_debug_message("state: "+state_name+" ("+string(state_cur)+")")
// Physics
if (vsp < 20) vsp += 0.5;

// Get Player Input
if(alive) PlayerInput(input);
move_h = inp_R - inp_L;

// Update 'grounded'
grounded = place_meeting(x,y+1,o_Floor);

// Face Dir
if (move_h != 0) image_xscale = move_h;


// Block
if (inp_BLOCK) {
	if (grounded) {state_cur = STATES.ACTION; act_cur = ACTIONS.BLOCK;}
	//if (crouched) {state_cur = STATES.ACTION;}
}


// Attack Mechanics
if (act_cd <= 0) {
	// Punch
	if (inp_PUNCH) {
		if (grounded) {
			act_cur = ACTIONS.PUNCH;
			state_cur = STATES.ACTION;
			act_delay = 30;
		}
		if (crouched) {
			act_cur = ACTIONS.UPPERCUT;
			state_cur = STATES.ACTION;
			act_delay = 30;
		}
		if (inp_U) {
			act_cur = ACTIONS.HIGHPUNCH;
			state_cur = STATES.ACTION;
			act_delay = 30;
		}
	}
}

// DEBUG
if (hp <= 0) {
	alive = false;
	state_cur = STATES.DEAD;
}

// State Ticker
state_dur++;
if (state_cur != state_prev) {
	show_debug_message("SC" + string(state_prev) + "/" + string(state_cur));
	state_prev = state_cur
	state_dur = 0;
}
//else show_debug_message("-----------");

// State Machine
switch(state_cur) {
	case STATES.IDLE:
		state_name = "IDLE";
		// Update Anim
		anim_cur = ANIMS.IDLE;
		
		/*--STATE-BEHAVIOR--*/
		spd_res = 1;
		
		// Jump
		if (inp_JUMP && act_delay>0) {
			vsp += jsp;
			state_cur = STATES.MOVE;
			anim_cur = ANIMS.JUMP;
			image_index = 0;
			image_speed = 0.25;
		}
		
		// Detect Input
		if (!inp_D) crouched = false;
		if (abs(move_h) > 0 ||
			inp_D			||
			!grounded)
		{
				state_cur = STATES.MOVE;
		}
				
		break;
		
	case STATES.MOVE:
		state_name = "MOVE";
		// Update Anim
		if (!crouched && grounded) {
			anim_cur = ANIMS.WALK;
			image_speed = 0.25;
		}
		
		/*--STATE-BEHAVIOR--*/

		// Detect Crouch
		if (crouched) 
		{
			// Slow Movement in Crouch
			spd_res = 0;
		
			// Update Anim
			anim_cur = ANIMS.CROUCH;
			if (sprite_index = ANIMS.CROUCH) {
				if (floor(image_index) == image_number-1)
					image_speed = 0;
			}
			else {
				image_index = 0;
				image_speed = 0.5;
			}
			
			// Break Crouch
			if (!inp_D) crouched = false;
		}
		else if (inp_D	 && 
				grounded && 
				act_delay>0)
		{
			spd_res = 0.5;
			crouched = true;
		}
		
		// Detect Jump
		if (grounded) {
			if (inp_JUMP && !crouched && act_delay>0) {
				vsp += jsp;
				anim_cur = ANIMS.JUMP;
				image_index = 0;
			}
		}
		else {
			// Slow Movement in Air
			spd_res = 0.75;
		
			// Update Anim
			if (sprite_index = ANIMS.JUMP) {
				if (floor(image_index) == image_number-1)
					image_speed = 0;
			}
			else {
				image_index = 0;
				image_speed = 0.25;
			}
		}
		
		// Update Position Data
		hsp = move_h * (spd * spd_res);
		
		// Detect IDLE
		if (hsp == 0 && grounded && !crouched)
		{
			state_cur = STATES.IDLE;
		}
		break;

		
	case STATES.ACTION:
		state_name = "ACTION";
	
		switch(act_cur) {
			case ACTIONS.BLOCK:
				state_name = "BLOCK";
				// Update Speed in Block
				hsp = 0;
					if (inp_D)	anim_cur = ANIMS.BLOCK_L;
					else if (inp_U)	anim_cur = ANIMS.BLOCK_H;
					else			anim_cur = ANIMS.BLOCK;
				
				// Update Anim
				if (sprite_index == ANIMS.BLOCK || sprite_index == ANIMS.BLOCK_L || sprite_index == ANIMS.BLOCK_H) {
					if (floor(image_index) == image_number-1)
						image_speed = 0;
				}
				else {
					image_index = 0;
					image_speed = 0.5;
				}
		
				// Detect Ground
				if (!grounded || act_delay > 0 || !inp_BLOCK) {
					state_cur = STATES.IDLE;
				}
				break;
				
			case ACTIONS.PUNCH:
				state_name = "PUNCH";
				hsp = 0;
				// Update Anim
				anim_cur = ANIMS.PUNCH;
		
				if (sprite_index = ANIMS.PUNCH) {
					if (floor(image_index) == image_number-1) {
						state_cur = STATES.IDLE;
					}
				}
				else {
					image_index = 0;
					image_speed = 0.5;
				}
				break;
				
			case ACTIONS.UPPERCUT:
				state_name = "PUNCH_L";
				hsp = 0;
				// Update Anim
				anim_cur = ANIMS.UPCUT;
		
				if (sprite_index = ANIMS.UPCUT) {
					if (floor(image_index) == image_number-1) {
						state_cur = STATES.IDLE;
					}
				}
				else 
					image_index = 0;
					image_speed = 0.5;
				break;
				
			case ACTIONS.HIGHPUNCH:
				state_name = "PUNCH_H";
				hsp = 0;
				// Update Anim
				anim_cur = ANIMS.HPUNCH;
		
				if (sprite_index = ANIMS.HPUNCH) {
					if (floor(image_index) == image_number-1) {
						state_cur = STATES.IDLE;
					}
				}
				else 
					image_index = 0;
					image_speed = 0.5;
				break;
		}
		
		break;
		
	case STATES.HURT:
		state_name = "HURT";
		if (state_dur == 0) {
			if (incDamage.target == "mid")
				anim_cur = ANIMS.HURT;
			if (incDamage.target == "high")
				anim_cur = ANIMS.HURT_H;
			else
				show_message("error: Missing Target ~o_Player/Step");
			image_index = 0;
			image_speed = 0.5;
			
			// Take Damage
			hp -= incDamage.damage;
			if (incDamage.knockback > 0) hsp -= incDamage.knockback*image_xscale
		}
		else {
			if (floor(image_index) == image_number-1) image_speed = 0;
			
			// Go Idle After Duration
			if (state_dur >= 30) {
				state_cur = STATES.IDLE;
			}
		}
		break;
	
	case STATES.DEAD:
		hsp = 0;
		
		if (state_init)
		{	show_debug_message("INIT")
			state_init = false;
			anim_cur = ANIMS.DEATH;
			sprite_index = ANIMS.DEATH;
			image_index = 0;
			image_speed = 0.5;
		}
		else
		{	
			if (floor(image_index) == image_number-1) 
			{
				image_speed = 0;
				image_index = image_number-1;
			}
		}
		
		state_name = "DEAD";
		break;
}

// Collsion With Floor
if (place_meeting(x, y + vsp, o_Floor)) {
	while(!place_meeting(x, y + sign(vsp), o_Floor))
		y += sign(vsp);
	vsp = 0;
}

// Apply Movement
x += hsp; hsp = 0;
y += vsp;



// Update Animation
sprite_index = anim_cur;


/*
switch(anim_cur) {
	case ANIMS.IDLE:
		image_speed = 0;
		break;
	
	case ANIMS.WALK:
		image_speed = 0.25;
		break;
	
	case ANIMS.PUNCH:
		image_speed = 0.25;
		break;
		
	case ANIMS.JUMP:
		break;
}
*/






