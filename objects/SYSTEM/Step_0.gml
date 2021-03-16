/// @description Input Combo Tracker

PlayerInput("P1");

switch(room) {
	case Arena:
		// Timer Countdown
		Round_Timer = max(0, --Round_Timer);
		
		// End Of Round
		if (Round_Timer == 0
		||	Player_One.State.current == STATES.DEAD
		||	Player_Two.State.current == STATES.DEAD) {
			if (alarm[0] == -1) alarm[0] = Round_Over_Delay;
			
			if (alarm[0] == Round_Over_Delay) {
				// Round Over
				if (Player_One.State.current == STATES.DEAD)
					Player_Two_Wins++;
				else 
				if (Player_Two.State.current == STATES.DEAD) 
					Player_One_Wins++
					
				else {
					if (Player_One.hp > Player_Two.hp) Player_One_Wins++;
					else 
					if (Player_Two.hp > Player_One.hp) Player_Two_Wins++;
					else
						show_message("DRAW");
				}
			
				// Detect Winner
				if (Player_One_Wins >= 2){}
				if (Player_Two_Wins >= 2){}
			}
		}
		
		break;
		
	case CharacterSelect:
		break;
}






// DEBUG

if (room == Arena && inp_Select) {
	show_var = !show_var
}

// Hard Restart
if (keyboard_check_pressed(vk_escape)) game_restart();


if (room == Arena)
{
	if (keyboard_check_pressed(vk_lshift)) Player_One.hp -= 10;
	if (keyboard_check_pressed(vk_rshift)) Player_Two.hp -= 10;
	
	if (inp_LB) {
			audio_stop_all();
			// Set Background
			_bgr = choose(1,2,3,4,4);
			alarm[0] = 1;
		}
	if (inp_RB) game_restart();
}

if (room == CharacterSelect)
{
	if (inp_Select) room_goto_next();
}


// Particle Test
if (mouse_check_button_pressed(mb_right)) {
	part_particles_create(global.partSystem, mouse_x, mouse_y, global.ptBasic, 20);
}
