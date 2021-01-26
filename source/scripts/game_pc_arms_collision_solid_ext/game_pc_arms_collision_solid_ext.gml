/// @description Finds the first solid intersecting the arms (horizontal sensor) of the player's virtual mask.
/// @param {Real} character player character instance index
/// @param {Real} radius distance in pixels to extend the mask (extends horizontally at BOTH ends)
/// @returns {Real} index of whichever instance was found, or noone
function game_pc_arms_collision_solid_ext(character, xrad, yrad)
{
	var result = noone;
	with (character) {
		var total = ds_list_size(local_solids);
		var ind;
		for (var n = 0; n < total; ++n) {
			ind = local_solids[| n];
			if (instance_exists(ind)) {
				if (
					ind.bottom_solid and 
					game_pc_arms_in_shape_ext(id, ind, xrad, yrad)
				) {
					result = ind;
					break;
				}
			}
		}
	}
	return result;
}