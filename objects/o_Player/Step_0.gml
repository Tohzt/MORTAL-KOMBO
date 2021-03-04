/// @description STATE MACHINE

// Listen For Input
PlayerInput(input);
// Get Horizontal Input
move_h = inp_R - inp_L;

// Gravity
if (vsp < 20) vsp += 0.5;
	
// LOOP ANIMATION HANDLER
if (!State.animLoop) 
{
	// STOP Animation at Last Frame
	if (floor(image_index) == image_number -1) {
		image_speed = 0;
		image_index = image_number-1;
	}
}

// Update isGrounded
if (place_meeting(x,y+1,o_Floor)) {
		isGrounded = true;
} else	isGrounded = false;

// Update Facing Direction
if (x != target.x) dir = sign(target.x - x);

// RUN CURRENT STATE
State.elapse++;
switch (State.current) {
	case STATES.IDLE:		PLAYER_STATE_IDLE();	break;
	case STATES.TAUNT:		PLAYER_STATE_TAUNT();	break;
	case STATES.WALK:		PLAYER_STATE_WALK();	break;
	case STATES.RUN:		PLAYER_STATE_RUN();		break;
	case STATES.CROUCH:		PLAYER_STATE_CROUCH();	break;
	case STATES.JUMP:		PLAYER_STATE_JUMP();	break;
	case STATES.FALL:		PLAYER_STATE_FALL();	break;
	case STATES.BLOCK_H:	PLAYER_STATE_BLOCK_H();	break;
	case STATES.BLOCK:		PLAYER_STATE_BLOCK();	break;
	case STATES.BLOCK_L:	PLAYER_STATE_BLOCK_L();	break;
	case STATES.PUNCH_H:	PLAYER_STATE_PUNCH_H();	break;
	case STATES.PUNCH:		PLAYER_STATE_PUNCH();	break;
	case STATES.PUNCH_L:	PLAYER_STATE_PUNCH_L();	break;
	case STATES.KICK_H:		PLAYER_STATE_KICK_H();	break;
	case STATES.KICK:		PLAYER_STATE_KICK();	break;
	case STATES.KICK_L:		PLAYER_STATE_KICK_L();	break;
	case STATES.HURT_H:		PLAYER_STATE_HURT_H();	break;
	case STATES.HURT:		PLAYER_STATE_HURT();	break;
	case STATES.HURT_L:		PLAYER_STATE_HURT_L();	break;
	case STATES.DEAD:		PLAYER_STATE_DEAD();	break;
}

// Collsion With Floor
if (place_meeting(x, y + vsp, o_Floor)) {
	while(!place_meeting(x, y + sign(vsp), o_Floor))
		y += sign(vsp);
	vsp = 0;
}

// Collision With Enemy
if (sign(hsp) == sign(target.x - x))
&& (place_meeting(x + hsp, y, target)) {
	while(!place_meeting(x + sign(hsp), y, target))
		x += sign(hsp);
	// Push Target
	target.hsp = hsp/2
	hsp = hsp/2;
}

// Apply Movement
x += hsp; hsp = 0;
y += vsp;