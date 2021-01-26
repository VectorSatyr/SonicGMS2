/// @description Returns whether the mask of the given instance intersects the arms (horizontal sensor) of the player's virtual mask.
/// @param {Real} character player character instance index
/// @param {Real} shape terrain shape instance index
/// @param {Real} xrad distance in pixels to extend the mask (extends horizontally at BOTH ends)
/// @param {Real} yrad distance in pixels to extend the mask (extends vertically DOWNWARD)
/// @returns {Real} 0: no intersect; 1: completely inside; 2: overlapping
function game_pc_arms_in_shape_ext(character, shape, xrad, yrad)
{
	var result = 0;
	with (character) {
		var sine = dsin(mask_direction);
		var cosine = dcos(mask_direction);
		var ox = x_int + (sine * yrad);
		var oy = y_int + (cosine * yrad);
		var hx = cosine * xrad;
		var hy = -(sine * xrad);
		result = game_shape_in_line(
			shape, ox - hx, oy - hy, ox + hx, oy + hy
		);
	}
	return result;
}