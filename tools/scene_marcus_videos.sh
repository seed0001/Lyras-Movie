#!/bin/bash
# Animates the Marcus wake-up scene stills with Veo (no audio; Lyra narration added in edit)
cd "$(dirname "$0")/.."
S="Photorealistic cinematic live-action footage, smooth natural motion, consistent character, no text overlays."
v(){ python tools/gen_video.py "$1" "$2 $S" --first "images/$1.png" > "logs_v_$1.txt" 2>&1 & }
v mh1_asleep "Slow gentle push-in on a man asleep in a dark blue pre-dawn bedroom. The phone on the nightstand lights up and vibrates, its cool glow flickering across his face; he stirs slightly and frowns in his sleep."
v mh2_phone_alert "The phone on the nightstand buzzes and vibrates against the wood, notification glowing; in the soft-focus background the man's eyes slowly open. Very slow push-in."
v mh3_wakes "The man sitting on the edge of the bed rubs his eyes, reads the phone, lets out a small amused exhale and shakes his head with a wry smile, then stands up. Static camera, soft blue light."
v mh4_garage "The man finishes zipping his leather jacket, picks up the helmet from the bike seat, and glances out the open garage door toward the glowing dawn horizon. The garage door continues to roll up. Slow dolly in."
v mh5_ride_wide "The motorcycle rider speeds down the empty desert highway toward camera at sunrise, dust kicking up behind, the camera drone pulls back and rises smoothly to reveal the vast desert and mountains bathed in golden light."
v mh6_ride_tracking "Fast tracking shot moving alongside the rider as he cruises down the desert highway at sunrise, bushes streaking by, sun flaring behind him, he glances to the horizon with a relaxed grin."
v mh7_ride_closeup "Close-up of the rider on the moving motorcycle, wind buffeting his jacket, his eyes smiling broadly through the open visor, he takes a deep breath of the morning air, warm sunlight flickering across his face, background streaming by."
v mh8_arrival "The man sits on his parked motorcycle at the data center security gate, holding his helmet, and the gate barrier arm lifts; he smiles toward the guard booth and nods. Morning sunlight, subtle heat shimmer, slow push-in."
v mh9_lyra_greet "The man walks into the bright data center lobby carrying his helmet, slows, and looks up at the wall intercom panel as its cyan light ring pulses softly as if speaking to him; he smiles warmly in response. Slow tracking shot."
wait; cat logs_v_*.txt; rm logs_v_*.txt
