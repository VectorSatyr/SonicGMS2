/// @description Calculates the distance needed to move the player's virtual mask out of collision with the given instance, focusing only on the arms. (horizontal sensor)
/// @param {Real} character player character instance index
/// @param {Real} ind instance index
/// @param {Real} xrad distance in pixels to extend the mask extends horizontally at BOTH ends)
/// @returns {Real} distance in pixels to move outside, or undefined on failure to relocate
function game_pc_calc_wall_distance(character, ind, xrad, yrad)
{
	var distance = undefined;
	with (character) {
		var sine = dsin(mask_direction);
		var cosine = dcos(mask_direction);
		var px = x_int + (sine * yrad);
		var py = y_int + (cosine * yrad);
		if (game_shape_in_point(ind, px, py)) {
			for (var ox = xrad; ox < (xrad * 2); ++ox) {
				if (not game_shape_in_point(ind, px + (cosine * ox), py - (sine * ox))) {
					distance = -(xrad + ox); // right side
					break;
				} else if (not game_shape_in_point(ind, px - (cosine * ox), py + (sine * ox))) {
					distance = (xrad + ox); // left side
					break;
				}
			}
		} else {
			for (var ox = xrad; ox > -1; --ox) {
				if (not game_pc_arms_in_shape_ext(id, ind, ox, yrad)) {
					if (game_shape_in_line(ind, px, py, px + (cosine * (ox + 1)), py - (sine * (ox + 1)))) {
						distance = (xrad - ox); // right side
						break;
					} else if (game_shape_in_line(ind, px, py, px - (cosine * (ox + 1)), py + (sine * (ox + 1)))) {
						distance = -(xrad - ox); // left side
						break;
					}
				}
			}
		}
	}
	return distance;
}