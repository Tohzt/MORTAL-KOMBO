// UPDATE STATES

/// @function PLAYER_STATE_UPDATE(_name, _curr, _prev, _elapse, _sprite, _speed, _loop, _playFromBeg)
function PLAYER_STATE_UPDATE(_name, _curr, _prev, _elapse, _sprite, _speed, _loop, _playFromBeg) 
{
	State.name		= _name; 
	State.current	= _curr;
	State.previous	= _prev;
	State.elapse	= _elapse;
	State.anim		= _sprite;
	State.animSpd	= _speed;
	State.animLoop	= _loop;
	
	// Update Animation
	PLAYER_STATE_ANIM_UPDATE(_playFromBeg);
}

/// @function PLAYER_STATE_CHANGE(_nextState, _currentState, _elapse, _playFromBeg)
function PLAYER_STATE_CHANGE(_nextState, _currentState, _elapse, _playFromBeg) 
{
	var spd_1 = 0.5;
	switch(_nextState) {
		case STATES.IDLE:
			PLAYER_STATE_UPDATE("IDLE",		_nextState, _currentState, _elapse, SPRITES.IDLE,		spd_1, true, _playFromBeg);
			break;
		case STATES.TAUNT:
			PLAYER_STATE_UPDATE("TAUNT",	_nextState, _currentState, _elapse, SPRITES.TAUNT,		spd_1, true, _playFromBeg);
			break;
		case STATES.WALK:
			PLAYER_STATE_UPDATE("WALK",		_nextState, _currentState, _elapse, SPRITES.WALK,		spd_1, true, _playFromBeg);
			break;
		case STATES.RUN:
			PLAYER_STATE_UPDATE("RUN",		_nextState, _currentState, _elapse, SPRITES.RUN,		spd_1, true, _playFromBeg);
			break;
		case STATES.CROUCH:
			PLAYER_STATE_UPDATE("CROUCH",	_nextState, _currentState, _elapse, SPRITES.CROUCH,		spd_1, false, _playFromBeg);
			break;
		case STATES.STAND:
			PLAYER_STATE_UPDATE("STAND",	_nextState, _currentState, _elapse, SPRITES.STAND,		spd_1, false, _playFromBeg);
			break;
		case STATES.JUMP:
			PLAYER_STATE_UPDATE("JUMP",		_nextState, _currentState, _elapse, SPRITES.JUMP,		spd_1, false, _playFromBeg);
			break;
		case STATES.FALL:
			PLAYER_STATE_UPDATE("FALL",		_nextState, _currentState, _elapse, SPRITES.FALL,		spd_1, false, _playFromBeg);
			break;
		case STATES.FALL_HURT:
			PLAYER_STATE_UPDATE("FALL-HURT",_nextState, _currentState, _elapse, SPRITES.FALL_HURT,	spd_1, false, _playFromBeg);
			break;
		case STATES.BLOCK_H:
			PLAYER_STATE_UPDATE("BLOCK_H",	_nextState, _currentState, _elapse, SPRITES.BLOCK_H,	spd_1, false, _playFromBeg);
			break;
		case STATES.BLOCK:
			PLAYER_STATE_UPDATE("BLOCK",	_nextState, _currentState, _elapse, SPRITES.BLOCK,		spd_1, false, _playFromBeg);
			break;
		case STATES.BLOCK_L:
			PLAYER_STATE_UPDATE("BLOCK_L",	_nextState, _currentState, _elapse, SPRITES.BLOCK_L,	spd_1, false, _playFromBeg);
			break;
		case STATES.PUNCH_H:
			PLAYER_STATE_UPDATE("PUNCH_H",	_nextState, _currentState, _elapse, SPRITES.PUNCH_H,	spd_1, false, _playFromBeg);
			break;
		case STATES.PUNCH:
			PLAYER_STATE_UPDATE("PUNCH",	_nextState, _currentState, _elapse, SPRITES.PUNCH,		spd_1, false, _playFromBeg);
			break;
		case STATES.PUNCH_L:
			PLAYER_STATE_UPDATE("PUNCH_L",	_nextState, _currentState, _elapse, SPRITES.PUNCH_L,	spd_1, false, _playFromBeg);
			break;
		case STATES.KICK_H:
			PLAYER_STATE_UPDATE("KICK_H",	_nextState, _currentState, _elapse, SPRITES.KICK_H,		spd_1, false, _playFromBeg);
			break;
		case STATES.KICK:
			PLAYER_STATE_UPDATE("KICK",		_nextState, _currentState, _elapse, SPRITES.KICK,		spd_1, false, _playFromBeg);
			break;
		case STATES.KICK_L:
			PLAYER_STATE_UPDATE("KICK_L",	_nextState, _currentState, _elapse, SPRITES.KICK_L,		spd_1, false, _playFromBeg);
			break;
		case STATES.KICK_J:
			PLAYER_STATE_UPDATE("KICK_J",	_nextState, _currentState, _elapse, SPRITES.KICK_inAIR,	spd_1, false, _playFromBeg);
			break;
		case STATES.HURT_H:
			PLAYER_STATE_UPDATE("HURT_H",	_nextState, _currentState, _elapse, SPRITES.HURT_H,		spd_1, false, _playFromBeg);
			break;
		case STATES.HURT:
			PLAYER_STATE_UPDATE("HURT",		_nextState, _currentState, _elapse, SPRITES.HURT,		spd_1, false, _playFromBeg);
			break;
		case STATES.HURT_L:
			PLAYER_STATE_UPDATE("HURT_L",	_nextState, _currentState, _elapse, SPRITES.HURT_L,		spd_1, false, _playFromBeg);
			break;
		case STATES.DEAD:
			PLAYER_STATE_UPDATE("DEATH",	_nextState, _currentState, _elapse, SPRITES.DEATH,		spd_1, false, _playFromBeg);
			break;	
	}
}


  /*************************/
 /** ANIMATION FUNCTIONS **/
/*************************/

/// @function PLAYER_STATE_ANIM_UPDATE(_sprite, _speed, _playFromBeg)
function PLAYER_STATE_ANIM_UPDATE(_playFromBeg)
{
	//sprite_index = _sprite;
	sprite_index = State.anim;
	if (_playFromBeg) {
		image_speed = State.animSpd;
		image_index = 0;
	}
	else {
		image_speed = 0;
		image_index = image_number-1;
	}
}

/// @function PLAYER_STATE_CHANGE_EOA( _state)
function PLAYER_STATE_CHANGE_EOA( _state)
{
	// Look for End Of Animation cycl3
	if (image_index == image_number-1) {
		// Default to IDLE State
		if (_state == STATES.CROUCH)
			PLAYER_STATE_CHANGE(_state, State.current, 0, false);
		else
			PLAYER_STATE_CHANGE(_state, State.current, 0, true);
	}
}