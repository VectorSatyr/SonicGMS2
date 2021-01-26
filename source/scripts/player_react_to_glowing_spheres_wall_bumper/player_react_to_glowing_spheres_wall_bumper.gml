function player_react_to_glowing_spheres_wall_bumper(argument0, argument1) {
	var ind = argument0;
	var phase = argument1;

	switch (phase) {
	case "checking":
	    if (
			game_pc_arms_in_shape_ext(id, ind, x_wall_radius + 2, y_wall_radius)
		) {
	        game_pc_react_to(id, ind);
	    }
	    break;

	case "entering":
	    ind.timer = 12;

	    if (state == player_is_hurt) {
	        game_pc_perform(id, player_is_falling);
	    }

	    x_speed = ind.force * sign(x_int - ind.x);

	    if (state == player_is_running) {
	        control_lock_time = default_spring_lock_time;
	    }

	    if (state == player_is_jumping) {
	        rolling_jump = false;
	    }

	    game_pc_animate(id, "flip", true);

	    game_pc_play_sound(id, BumperSound);
	    break;

	case "exiting":
	    break;
	}


}
