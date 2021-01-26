/// @description Grounded movement step. Takes a sample of the player's current speed and checks for collisions.
/// @param {Real} character player character instance index
/// @param {Real} step movement step in pixels
function game_pc_step_on_ground(argument0, argument1) {
	var character = argument0;
	var step = argument1;

	with (character) {
	    game_pc_position(id, x + (dcos(direction) * step), y - (dsin(direction) * step));
	    game_pc_refresh_local_index(id);
	    game_pc_trigger_reactions(id);
	    if (state != player_is_defeated) {
	        game_pc_find_wall(id, x_wall_radius, y_wall_radius);
	        if (wall_id != noone) {
	            if (sign(x_speed) == wall_sign) {
	                x_speed = 0;
	            }
	        }
	        if (on_the_ground) {
	            game_pc_find_ground(id, y_radius + y_snap_distance);
	            if (ground_id == noone) {
	                on_the_ground = false;
	            }
	        }
	    }
	}



}
