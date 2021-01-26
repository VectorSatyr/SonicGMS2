function player_react_to_competition_lamp_post(argument0, argument1) {
	var ind = argument0;
	var phase = argument1;

	switch (phase) {
	case "checking":
	    if (
			not ind.activated and 
			game_pc_arms_in_shape_ext(id, ind, x_wall_radius, y_wall_radius)
		) {
	        game_pc_react_to(id, ind);
	    }
	    break;

	case "entering":
		// TODO: create competition check point for respawning
	    instance_perform_user_event(ind, 0);
	    game_pc_play_sound(id, LampPostSound);
	    break;

	case "exiting":
	    break;
	}


}
