#!/bin/bash
# Animates the pit bull adoption scene stills with Veo (no audio; Lyra narration added in edit)
cd "$(dirname "$0")/.."
S="Photorealistic cinematic live-action footage, smooth natural motion, consistent character: white pit bull with a grey patch around his right eye only."
v(){ python tools/gen_video.py "$1" "$2 $S" --first "images/$1.png" > "logs_v_$1.txt" 2>&1 & }
v pb1_cctv_wander "Static locked-off security camera footage. The small white dog trots slowly along the outside of the perimeter fence toward the camera, stopping once to sniff the ground. The timestamp overlay ticks forward second by second. Slight heat shimmer. The camera does not move."
v pb2_heat "The tired white pit bull trudges toward the camera across cracked desert ground, panting heavily with tongue out, heat shimmer rising around him. Slow low tracking shot backing away in front of him."
v pb3_cctv_gate "Static locked-off security camera footage. The white pit bull sits in front of the gate, looks up directly into the camera, tilts his head, and lets out a small hopeful bark. The timestamp overlay ticks forward. The camera does not move."
v pb4_gate_opens "The gate's lock panel light glows green and the chain-link gate slides open smoothly on its track. The white pit bull perks his ears, glances at the panel, then trots through the opening past the camera. Static camera."
v pb5_sprinklers "The sprinklers spray sparkling water with a rainbow in the mist; the wet white pit bull happily snaps at and laps up the spray, shakes water off his fur, tail wagging hard. Bright midday sun. Slow push-in."
v pb6_front_door "The tall glass entrance doors finish sliding open. The white pit bull, silhouetted against the bright desert sun, hesitates, sniffs the cool air, then walks cautiously inside toward the camera onto the polished floor. Static camera."
v pb7_lobby_cool "The white pit bull lies sprawled belly-flat on the cool concrete floor, lets out a big contented sigh, his side rising and falling, eyes slowly closing. The wall intercom's cyan light ring gently pulses. Very slow push-in."
v pb8_server_aisle "The white pit bull trots happily down the server aisle toward the camera, tail wagging, goofy open-mouth smile, server LEDs blinking all around. Camera slowly tracks backward in front of him."
v pb9_home "Calm night scene. The white pit bull sleeps curled on the dog bed, breathing slowly, ear twitching once as he dreams. The cyan tag on his collar and the intercom ring on the wall softly pulse in sync. Monitors flicker gently. Very slow push-in."
wait; cat logs_v_*.txt; rm logs_v_*.txt
