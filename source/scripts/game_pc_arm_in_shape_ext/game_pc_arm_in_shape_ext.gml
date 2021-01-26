/// @description Returns whether the mask of the given instance intersects the arms (horizontal sensor) of the player's virtual mask.
/// @param {Real} character player character instance index
/// @param {Real} shape terrain shape instance index
/// @param {Real} radius distance in pixels to extend the mask (extends horizontally at BOTH ends)
/// @returns {Real} 0: no intersect; 1: completely inside; 2: overlapping
function game_pc_arm_in_shape_ext(character, shape, xrad, yrad)
{
	var result = 0;
	with (character) {
		var sine = dsin(mask_direction);
		var cosine = dcos(mask_direction);
		var x1 = x_int + (sine * yrad);
		var y1 = y_int + (cosine * yrad);
		var x2 = x1 + (cosine * xrad);
		var y2 = y1 - (sine * yrad);
		result = game_shape_in_line(shape, x1, y1, x2, y2);
	}
	return result;
}