/// @description Room Start

switch (room)
{
	case CharacterSelect:
		Player_One = instance_create_depth(199, 476, depth-100, o_P1)
		Player_Two = instance_create_depth(room_width - 199, 476, depth-100, o_P2)
			Player_Two.image_xscale = -1;
		break;
	case Arena:
		// Spawn Players
		Player_One = pointer_null;
		Player_Two = pointer_null;
		Player_One = instance_create_depth(96, 416, depth, o_Player);
		with (Player_One) {
			image_blend = other.p1_col;
		}
		/*
		Player_Two = instance_create_depth(room_width-96, 416, depth, o_Player);
		with (Player_Two) {
			input = "P2";
			image_xscale = -1;
			image_blend = other.p2_col;
		}*/
		break;
}