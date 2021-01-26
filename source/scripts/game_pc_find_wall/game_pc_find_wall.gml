function game_pc_find_wall(character, xrad, yrad)
{
	with (character) {
		wall_id = noone;
		wall_sign = 0;
		var ind = game_pc_arms_collision_solid_ext(id, xrad, yrad);
		if (ind != noone) {
			var distance = game_pc_calc_wall_distance(id, ind, xrad, yrad);
			var sine = dsin(mask_direction);
			var cosine = dcos(mask_direction);
			if (not is_undefined(distance)) {
				game_pc_position(id, x - (cosine * distance), y + (sine * distance));
				wall_id = ind;
				wall_sign = sign(distance);
			}
		}
	}
}