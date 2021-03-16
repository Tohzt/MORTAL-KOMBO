/// @description Insert description here
// You can write your code in this editor

x = SYSTEM.Camera.x + (view_wport/2 * side);

var padding = 0;
switch(SYSTEM._bgr) {
	case 0:
		padding = 0;
		break;
	case 1:
		padding = 0;
		break;
	case 2:
		padding = 0;
		break;
	case 3:
		padding = 0;
		break;
	case 4:
		padding = 100;
		break;
}


switch(side) {
	case -1:
		x = max(padding, x);
		x = min(x, room_width - view_wport);
		//x += sprite_width;
		break;
	case 1:
		x = min(x,room_width - padding)
		x = max(x, view_wport);
		x -= sprite_width;
		break;
}