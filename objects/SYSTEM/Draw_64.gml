/// @description Draw Debug Shit

draw_set_font(fnt_Small);
draw_set_halign(fa_left);
draw_set_color(c_black);

switch(room)
{
	case Arena:
		if (show_var) {
			draw_text(8, 8, "State: " + Player_One.state_name);
			draw_text(8, 20, "Ground: " + string(Player_One.grounded));
			draw_text(8, 32, "Crouch: " + string(Player_One.crouched));
			draw_text(8, 44, "HSP: " + string(Player_One.hsp));
			draw_text(8, 56, "VSP: " + string(Player_One.vsp));
			draw_text(8, 68, "SPD/RES: " + string(Player_One.spd) +"/"+ string(Player_One.spd_res));
			draw_text(8, 80, "Img Spd: " + string(Player_One.image_speed));
	
	
			draw_text(80, 8, "HP/MAX: " + string(Player_One.hp) + "/" + string(Player_One.hp_max));
		}
		
		// Display Health Bars
		var xOff = 32;
		var yOff = 48;
		var width = 384;
		var height = 32;
		var border = 3;
		// Draw Border
		draw_set_color(c_gray);
		draw_rectangle(xOff-border, yOff-border, xOff+width+border, yOff+height+border,0);
		// Draw Empty Health
		draw_set_color(c_red);
		draw_rectangle(xOff, yOff, xOff+width, yOff+height,0);
		// Draw Health
		draw_set_color(c_green);
		width = lerp(0, width, (Player_One.hp/Player_One.hp_max));
		draw_rectangle(xOff, yOff, xOff+width, yOff+height,0);
		// Draw Name
		draw_set_color(c_yellow);
		draw_set_font(fnt_Large);
		draw_set_valign(fa_center);
		draw_text(xOff + 16, yOff + height/2, Player_One_Name);
		
		
		// Display P2 Health Bars
		xOff = room_width - 32;
		yOff = 48;
		width = 384;
		height = 32;
		border = 3;
		// Draw Border
		draw_set_color(c_gray);
		draw_rectangle(xOff+border, yOff-border, xOff-width-border, yOff+height+border,0);
		// Draw Empty Health
		draw_set_color(c_red);
		draw_rectangle(xOff, yOff, xOff-width, yOff+height,0);
		// Draw Health
		draw_set_color(c_green);
		if (Player_Two != pointer_null) width = lerp(0, width, (Player_Two.hp/Player_Two.hp_max));
		draw_rectangle(xOff, yOff, xOff-width, yOff+height,0);
		// Draw Name
		draw_set_color(c_yellow);
		draw_set_font(fnt_Large);
		draw_set_halign(fa_right);
		draw_text(xOff - 16, yOff + height/2, Player_Two_Name);
		
		break;
	
	case CharacterSelect:
		draw_set_color(c_white)
		draw_set_font(fnt_Large);
		draw_set_halign(fa_center);
		
		// Write Player One Name
		draw_text(199,208,Player_One_Name);
		// Write Player Two Name
		draw_text(room_width - 199,208,Player_Two_Name);
		break;
}