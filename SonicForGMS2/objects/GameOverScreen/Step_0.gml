/// @description  Animate
if (timer > 0) {
	--timer;
	if (timer <= 0 or game_input_event_pressed("start")) {
	    var next_room = RestartRoom;
	    var index = game_save_current();
	    var file = game_save_find(index);
	    if (instance_exists(file)) {
	        if (file.player_continues > 0) {
	            game_save_update_continues(-1, index);
	            game_save_write(index);
	            game_console_show_message("GAME SAVED");
	            next_room = ContinueRoom;
	        }
	    }
	    game_screen_fade_out(BlackFadeShd, 22, next_room);
	    game_audio_fade_out_music(22);
		instance_destroy();
	}
}