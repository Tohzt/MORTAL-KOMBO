/// @description Input Combo Tracker

PlayerInput("P1");

if (room == Arena && inp_Select) {
	show_var = !show_var
}

// Hard Restart
if (keyboard_check_pressed(vk_escape)) game_restart();

// DEBUG
if (room == Arena)
{
	if (keyboard_check_pressed(vk_lshift)) Player_One.hp -= 10;
	if (keyboard_check_pressed(vk_rshift)) Player_Two.hp -= 10;
	
	if (inp_LB) room_restart();
	if (inp_RB) game_restart();
	
	// DAMAGE TEST (click to spawn)
	if (mouse_check_button_pressed(mb_left)) {
		instance_create_depth(mouse_x, mouse_y, depth, o_DMG);
	}
}

if (room == CharacterSelect)
{
	if (inp_Select) room_goto_next();
}

