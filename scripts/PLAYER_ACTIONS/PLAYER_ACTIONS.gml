// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function PLAYER_ACTION_ATTACK(_x, _y, _target, _hitbox, _damage, _color){
function PLAYER_ACTION_ATTACK(_x, _y, _target, _hitbox, _damage){
	var _color = c_white;
	switch(_hitbox) {
		case "low":  _color = c_yellow; break;
		case "mid":  _color = c_orange; break;
		case "high": _color = c_red;	break;
	}
	var _atk = instance_create_depth(_x, _y, depth, o_DMG);
		with (_atk) { 
			image_blend = _color;
			target = _target;
			hitbox = _hitbox;
			damage = _damage;
		}
}