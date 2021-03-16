/// @descrition Initialize Particles
/// @function scr_initPart()
function scr_initPart(){
	//gml_pragma("global", "initPart()");
	
	#region Particle Types
	
	// Blood Particle
	var _p = part_type_create();
	
	part_type_shape(_p, pt_shape_disk);
	part_type_life(_p, 10, 20);
	part_type_alpha2(_p, 1, 0.5);
	part_type_color2(_p, c_red, c_maroon);
	part_type_size(_p, 0.01, 0.1, 0, 0);
	part_type_speed(_p, 2, 4, 0, 0);
	part_type_direction(_p, 0, 360, 0, 0);
	part_type_gravity(_p, 0.2, 270);
	
	global.ptBlood = _p;
	
	// Block Particle
	var _p = part_type_create();
	
	part_type_shape(_p, pt_shape_star);
	part_type_life(_p, 5, 10);
	part_type_alpha1(_p, 1);
	part_type_color2(_p, c_yellow, c_white);
	part_type_size(_p, 0.75, 1, 0.05, 0);
	part_type_direction(_p, 0, 360, 1, 0);
	
	global.ptBlock = _p;
	
	#endregion
}