/// @description Initialize
owner = noone;

// state machine
state = player_is_ready;
state_previous = -1;
state_changed = false;

spinning = false;
rolling_jump = false;
underwater = false;
superform = false;

jump_action_available = true;

spindash_charge = 0;
spindash_atrophy = 0.96875;

input_up = false;
input_down = false;
input_left = false;
input_right = false;
input_action = false;

input_up_pressed = false;
input_down_pressed = false;
input_left_pressed = false;
input_right_pressed = false;
input_action_pressed = false;

horizontal_axis_value = 0;

// timers
control_lock_time = 0;
remaining_air_time = 0;
recovery_time = 0;
superspeed_time = 0;
invincibility_time = 0;
superform_time = 0;

default_slide_lock_time = 32;
default_spring_lock_time = 16;
default_remaining_air_time = 1800;
default_recovery_time = 120;

// physics
x_int = xstart;
y_int = ystart;

x_speed = 0;
y_speed = 0;

facing_sign = 1;

game_pc_refresh_physics(id);

wall_push_speed = land_acceleration;

air_friction_threshold = 0.125;
brake_threshold = 4;
ceiling_land_threshold = -4;
roll_threshold = 1.03125;
unroll_threshold = 0.5;
slide_threshold = 2.5;

// collision detection
x_radius = 8;
x_wall_radius = 10;

y_radius = 15;
y_wall_radius = 8;
y_snap_distance = 16;

on_the_ground = true;

wall_id = noone;
wall_sign = 0;

ground_id = noone;
cliff_sign = 0;

ceiling_id = noone;

linked_object_id = noone;

depth_mask = 1;

direction = 0;
gravity_direction = 0;

local_direction = 0;
mask_direction = 0;
angle_resolution = 1.40625;

local_instances = ds_list_create();
local_solids = ds_list_create();

reaction_list = ds_list_create();
previous_reaction_list = ds_list_create();

mask = instance_create_depth(x, y, depth - 1, PlayerBoundingMask);
mask.source = id;

// regions and boundaries
bound_left = 16;
bound_top = 16;
bound_right = room_width - 16;
bound_bottom = room_height - 16;

bound_mask = 0;
bound_ignore_mask = 8;

// animation
image_speed = 0;

animations = ds_map_create();
current_animation = "";

image_angle_resolution = 45;

// other values
camera = instance_create_layer(x, y, "general", PlayerCamera);
camera.owner = id;

shader = instance_create_layer(x, y, "effects", SuperFormShader);
shader.source = id;

shield = noone;

invincibility_effect = noone;

super_sparks = false;

audio_emitter = audio_emitter_create();
audio_emitter_position(audio_emitter, x, y, 0);
with (GameAudioConfiguration)
{
	audio_emitter_gain(other.audio_emitter, volume_sound);
}

var dist = point_distance(0, 0, CAMERA_WIDTH * 0.5, CAMERA_HEIGHT * 0.5);
audio_emitter_falloff(audio_emitter, dist, dist * 1.5, 1);

sounds = ds_map_create();

ring_soundid = RingRightSound;
rev_soundid = -1;
rev_audio_pitch = audio_sound_get_pitch(SpinRevSound);

drowning_music = noone;

invincibility_music = noone;

chain_multiplier = 0;

stage_end = false;