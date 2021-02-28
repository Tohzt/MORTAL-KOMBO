/// @description Insert description here
// You can write your code in this editor

image_blend = col;

PlayerInput("P1");

var move_h = inp_R - inp_L;
var move_v = inp_D - inp_U;

xx += move_h * spd;
yy += move_v * spd;

var inst = instance_position(xx,yy,o_Characters);
if (inst != noone) {
	if (inp_KICK) {
		selected = true;
		sx = inst.x;
		sy = inst.y;
		col = inst.col;
		tricker = inst.tricker;
		SYSTEM.Player_One_Name = tricker;
		
		with (SYSTEM) {
			p1_col = other.col;
		}
	}
}