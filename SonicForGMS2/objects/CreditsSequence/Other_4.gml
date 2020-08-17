/// @description Setup
game_window_update_ports(1);
game_screen_fade_in(BlackFadeShd, 22);
game_audio_enqueue_music(CreditsMusic, 0, false);

game_save_complete(game_save_current());

ds_queue_enqueue(headers, "SONIC FOR GMS");
ds_queue_enqueue(text, "CAST OF CHARACTERS");

ds_queue_enqueue(headers, "SPRITE RIPS BY");
ds_queue_enqueue(text, @"1001#
CHAOFANATIC#
DIVINE INSECT#
DOC MELONHEAD");

ds_queue_enqueue(headers, "SPRITE RIPS BY");
ds_queue_enqueue(text, @"DOLPHMAN#
FLARE#
GAMEMASTER12#
MARIOMADNESS734");

ds_queue_enqueue(headers, "SPRITES RIPS BY");
ds_queue_enqueue(text, @"MERCURY#
PAVELDECHEV0604#
PORTEWEEKER#
RANDOM TALKING BUSH");

ds_queue_enqueue(headers, "SPRITES RIPS BY");
ds_queue_enqueue(text, @"SID STARKILLER#
SUPACHAO#
TECHOKAMI");

ds_queue_enqueue(headers, "SOUND RIPS BY");
ds_queue_enqueue(text, @"MR. LANGE#
RANDOM TALKING BUSH");

ds_queue_enqueue(headers, "MUSIC BY");
ds_queue_enqueue(text, @"JUNKO SHIRATSU#
MARIKO NANBA#
MASATO NAKAMURA#
SEAN EVANS#
TEE LOPES");

ds_queue_enqueue(headers, "SPECIAL THANKS TO");
ds_queue_enqueue(text, @"CARLOS USHIROMIYA#
DAMIZEAN#
JAVIER MORA#
JONATHAN LAM");

ds_queue_enqueue(headers, "SPECIAL THANKS TO");
ds_queue_enqueue(text, @"KAIN#
MERCURY#
NOAH COPELAND#
PIXELATED_POPE");

ds_queue_enqueue(headers, "SPECIAL THANKS TO");
ds_queue_enqueue(text, @"POLAR EXELION#
ROGUEYOSHI#
XOT");

ds_queue_enqueue(headers, "DEVELOPED BY");
ds_queue_enqueue(text, "VECTORSATYR");

ds_queue_enqueue(headers, "CONTENT BELONGS TO");
ds_queue_enqueue(text, @"SEGA#
SONIC TEAM");

ds_queue_enqueue(headers, "THANK YOU FOR PLAYING");
ds_queue_enqueue(text, "SEE YOU NEXT TIME");