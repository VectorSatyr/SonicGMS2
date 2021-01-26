function player_react_to_spike_trap(argument0, argument1) {
	var ind = argument0;
	var phase = argument1;

	switch (phase) {
	case "checking":
	    if (state != player_is_hurt and recovery_time <= 0 and 
	        invincibility_time <= 0 and not superform) {
	        var rotation_offset = angle_wrap(round_to(ind.image_angle, 90) - mask_direction);
	        if (game_pc_arms_in_shape_ext(id, ind, x_wall_radius, y_wall_radius)) {
	            if ((rotation_offset == 270 and x_speed < 0) or rotation_offset == 90 and x_speed > 0) {
	                game_pc_react_to(id, ind);
	            }
	            break;
	        }
	        if (ground_id == ind or game_pc_lower_in_shape(id, ind, y_radius)) {
	            if (rotation_offset == 0 and y_speed >= 0) {
	                game_pc_react_to(id, ind);
	            }
	            break;
	        }
	        if (game_pc_upper_in_shape(id, ind, y_radius)) {
	            if (rotation_offset == 180 and y_speed < 0) {
	                game_pc_react_to(id, ind);
	            }
	            break;
	        }
	    }
	    break;

	case "entering":
	    game_pc_damage(id, sign(x_int - ind.x), SpikeSound);
	    break;

	case "exiting":
	    break;
	}



}
