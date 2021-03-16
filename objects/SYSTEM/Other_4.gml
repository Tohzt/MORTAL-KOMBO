/// @description Room Start

switch (room)
{
	case CharacterSelect:
		Player_One = instance_create_depth(200, 476, depth-100, o_P1)
		Player_Two = instance_create_depth(room_width - 200, 476, depth-100, o_P2)
			Player_Two.image_xscale = -1;
		break;
	case Arena:
		
		// Spawn Camera
		Camera = instance_create_depth(room_width/2, room_height/2, depth, CAMERA);
		
		// Start Music
		audio_play_sound(snd_bgrMusic, 1, true);
		
		switch(_bgr) {
			case 1:
				layer_background_visible(layer_background_get_id("BGR_02"), false);
				layer_background_visible(layer_background_get_id("BGR_03"), false);
				layer_background_visible(layer_background_get_id("BGR_04"), false);
				room_set_width(room, 900);
				Camera_Center = 450;
			break;
			case 2:
				layer_background_visible(layer_background_get_id("BGR_01"), false);
				layer_background_visible(layer_background_get_id("BGR_03"), false);
				layer_background_visible(layer_background_get_id("BGR_04"), false);
				room_set_width(room, 900);
				Camera_Center = 450;
			break;
			case 3:
				layer_background_visible(layer_background_get_id("BGR_01"), false);
				layer_background_visible(layer_background_get_id("BGR_02"), false);
				layer_background_visible(layer_background_get_id("BGR_04"), false);
				room_set_width(room, 900);
				Camera_Center = 450;
			break;
			case 4:
				layer_background_visible(layer_background_get_id("BGR_01"), false);
				layer_background_visible(layer_background_get_id("BGR_02"), false);
				layer_background_visible(layer_background_get_id("BGR_03"), false);
				room_set_width(room, 2024);
				Camera_Center = 1012;
			break;
		}
		
		// Spawn Players
		Player_One = pointer_null;
		Player_Two = pointer_null;
		Player_One = instance_create_depth(Camera_Center - 250, 480, depth, o_Player);
		with (Player_One) {
			color = other.p1_col;
			image_blend = color;
		}
		
		Player_Two = instance_create_depth(Camera_Center + 250, 480, depth, o_Player);
		with (Player_Two) {
			input = "P2";
			dir = -1;
			image_xscale = -1;
			color = other.p2_col;
			image_blend = color;
		}
		
		// Update Player Targets
		Player_One.target = other.Player_Two;
		Player_Two.target = other.Player_One;
		break;
}