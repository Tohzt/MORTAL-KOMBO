// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerInput(str){
	
	if (str == "P1") {
		inp_L  = keyboard_check(vk_left);
		inp_R  = keyboard_check(vk_right);
		inp_U  = keyboard_check(vk_up);
		inp_D  = keyboard_check(vk_down);
		inp_U_Pressed = keyboard_check_pressed(vk_up);
		
		inp_PUNCH = keyboard_check_pressed(ord("1")); // Left Butt
		inp_JUMP  = keyboard_check_pressed(ord("2")); // Bottom Butt
		inp_KICK  = keyboard_check_pressed(ord("3")); // Right Butt
		inp_BLOCK = keyboard_check(ord("4"));		  // Top Butt
		inp_LB	  = keyboard_check_pressed(ord("5"));
		inp_RB	  = keyboard_check(ord("6"));
		
		inp_Select = keyboard_check_pressed(vk_tab);
	}
	else if (str == "P2") {
		inp_L  = keyboard_check(ord("A"));
		inp_R  = keyboard_check(ord("D"));
		inp_U  = keyboard_check(ord("W"));
		inp_D  = keyboard_check(ord("S"));
		inp_U_Pressed = keyboard_check_pressed(ord("W"));
		
		inp_PUNCH = keyboard_check_pressed(ord("7")); // Left Butt
		inp_JUMP  = keyboard_check_pressed(ord("8")); // Bottom Butt
		inp_KICK  = keyboard_check_pressed(ord("9")); // Right Butt
		inp_BLOCK = keyboard_check(ord("0"));		  // Top Butt
		inp_LB	  = keyboard_check_pressed(ord("Q"));
		inp_RB	  = keyboard_check(ord("E"));
		
		inp_Select = keyboard_check_pressed(vk_backspace);
	}
}


{/*	OLD TEMPLATE

		inp_LP = keyboard_check_pressed(vk_left);
		inp_L  = keyboard_check(vk_left);
		inp_LR = keyboard_check_released(vk_left);
		 
		inp_RP = keyboard_check_pressed(vk_right);
		inp_R  = keyboard_check(vk_right);
		inp_RR = keyboard_check_released(vk_right);
		
		inp_UP = keyboard_check_pressed(vk_up);
		inp_U  = keyboard_check(vk_up);
		inp_UR = keyboard_check_released(vk_up);
		
		inp_DP = keyboard_check_pressed(vk_down);
		inp_D  = keyboard_check(vk_down);
		inp_DR = keyboard_check_released(vk_down);
		
		inp_PUNCH = keyboard_check_pressed(ord("A")); // GREEN
		inp_JUMP  = keyboard_check_pressed(ord("Z")); // YELLOW
		inp_KICK  = keyboard_check(ord("S"));
		inp_BLOCK = keyboard_check(ord("X"));
		
		inp_Select = keyboard_check_pressed(vk_space);
		inp_Start  = keyboard_check_pressed(vk_backspace);
*/}