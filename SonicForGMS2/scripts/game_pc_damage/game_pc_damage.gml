// ---------------------------------------------------------------
/*
**  Evaluates the calling player instance's condition after taking
**  a hit.
**
**  Arguments
**      recoil_sign Real; horizontal sign of recoil
**      soundid     Real (optional); sound index to play when a
**                  shield is hit
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------
var soundid = HurtSound;
switch (argument_count) {
case 3: soundid = argument[2];
default:
    var character = argument[0];
    var recoil_sign = argument[1];
}
// ---------------------------------------------------------------

with (character) {
    if (recovery_time <= 0 and invincibility_time <= 0 and not superform and
        state != player_is_hurt and state != player_is_defeated and 
        state != player_is_drowning) {
        if (shield != noone) {
            if (shield.object_index == AquaShield and underwater) {
                remaining_air_time = default_remaining_air_time;
            }
            instance_destroy(shield);
            shield = noone;
            game_pc_play_sound(self, soundid);
        } else if (owner.rings > 0) {
            game_player_spawn_rings(owner, x_int, y_int);
            game_player_set_rings(owner, 0);
            game_pc_play_sound(self, RingLossSound);
        } else {
            game_pc_play_sound(self, HurtSound);
            game_pc_perform(self, player_is_defeated);
            break;
        }

        game_pc_perform(self, player_is_hurt);

        x_speed = recoil_sign * 2;
        if (x_speed == 0) {
            x_speed = -facing_sign * 2;
        }

        y_speed = -4;
    }
}
