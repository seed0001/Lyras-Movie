#!/bin/bash
# Generates the "Marcus wake-up ride" scene stills (character-locked via images/char_ref.png) + contact sheet
cd "$(dirname "$0")/.."
S="Photorealistic cinematic film still, shot on ARRI Alexa, anamorphic lens, shallow depth of field, natural color grade, no text unless specified."
C="The man is the same person shown in the attached reference image (Marcus: 48, short salt-and-pepper hair, grey-flecked stubble beard, sun-weathered tan, lean build) - match his face exactly."
B="The motorcycle is a matte black sport bike with a single thin red accent stripe and no logos; his helmet is a matte black full-face helmet."
g(){ python tools/gen_image.py "$1" "$2 $C $S" --ref images/char_ref.png > "logs_$1.txt" 2>&1 & }
g mh1_asleep "Pre-dawn, 4:47 AM. A dark, minimalist desert-home bedroom lit only by deep blue light through the window. Marcus is asleep on his side under grey sheets. On the nightstand his phone suddenly lights up, casting a cold white-cyan glow across his face and the pillow. Quiet, still, intimate."
g mh2_phone_alert "Extreme close-up of a smartphone on a wooden nightstand in a dark room, vibrating. The lock screen shows a clean notification card that reads 'VIRA OPS - PRIORITY ALERT' and below it 'Cluster 7 thermal anomaly. On-site review requested.' and the time 4:47. The glow lights the edge of a sleeping man's face blurred in the background."
g mh3_wakes "Marcus sits up on the edge of his bed in the blue pre-dawn light, squinting at the glowing phone in his hand, rubbing his face with the other hand, a wry tired half-smile as if to say 'of course'. Bare-armed in a grey t-shirt."
g mh4_garage "Inside a home garage at blue hour dawn, the roll-up door half open revealing a faint orange glow on the desert horizon. Marcus, now in his black leather jacket and jeans, zips the jacket next to his motorcycle, helmet resting on the seat, a travel coffee mug on the workbench. $B"
g mh5_ride_wide "Epic wide drone shot at sunrise: a lone motorcycle rider speeding down an empty two-lane desert highway that cuts straight toward distant rugged red-brown mountains, the sun just cresting the horizon, long golden light, long shadow stretching behind the bike, dust and warm haze. $B"
g mh6_ride_tracking "Low dynamic tracking shot alongside Marcus riding his motorcycle fast on a desert highway at sunrise, leaning slightly, golden sun flare behind him, creosote bushes blurred with motion, his black leather jacket catching the warm light. The helmet visor is flipped up showing his eyes crinkled in a relaxed grin. $B"
g mh7_ride_closeup "Close-up from the front of Marcus riding his motorcycle, helmet visor flipped up, his eyes and cheeks crinkled in a genuine joyful smile, warm golden sunrise light on his face, desert and mountains softly blurred behind him, sense of freedom and cool morning air. $B"
g mh8_arrival "Morning golden hour. Marcus rolls his motorcycle up to the security gate of a massive white hyperscale data center in the desert, rows of long white buildings and cooling units stretching into the distance, red-brown mountains behind, a small guard booth, chain-link fence. He has the helmet off under one arm, grinning. $B"
g mh9_lyra_greet "Inside a sleek, quiet data center entrance lobby at dawn, polished concrete floor, warm sunlight streaming through tall glass doors behind him. Marcus walks in carrying his helmet under his arm, smiling and looking up toward a slim wall-mounted intercom panel whose soft cyan light ring glows as a voice greets him. Clean minimalist architecture, subtle blue accent lighting."
wait; cat logs_*.txt; rm logs_*.txt
python - <<'PY'
from PIL import Image, ImageDraw, ImageFont
import glob,os
fs=sorted(glob.glob("images/mh*.png")); W,H=640,360; rows=(len(fs)+1)//2
s=Image.new("RGB",(2*W,rows*(H+30)),"black"); d=ImageDraw.Draw(s); f=ImageFont.truetype("arial.ttf",20)
for i,p in enumerate(fs):
    x,y=(i%2)*W,(i//2)*(H+30); s.paste(Image.open(p).convert("RGB").resize((W,H)),(x,y+30)); d.text((x+8,y+4),os.path.basename(p),fill="white",font=f)
s.save("storyboards/marcus_wakeup.jpg",quality=88)
PY
