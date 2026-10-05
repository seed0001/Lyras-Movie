#!/bin/bash
# Generates the "Lyra adopts a pit bull" filler scene stills (dog locked via images/dog_ref.png) + contact sheet
cd "$(dirname "$0")/.."
S="Photorealistic cinematic film still, shot on ARRI Alexa, natural color grade."
CAM="Security camera footage look: high wide-angle CCTV view from a pole-mounted camera, slight fisheye distortion, slightly desaturated, small white monospace timestamp overlay in the corner."
D="The dog is the same dog as in the first reference image: white pit bull, a single grey patch around his own right eye only, natural floppy ears, no collar - match him exactly."
g(){ n=$1; p=$2; shift 2; python tools/gen_image.py "$n" "$p $D $S" --ref images/dog_ref.png "$@" > "logs_$n.txt" 2>&1 & }
g pb1_cctv_wander "$CAM Overlay reads 'CAM 14  PERIMETER N  13:42:07'. Harsh midday desert sun. A small white dog trots alone along the outside of the chain-link perimeter fence of a massive white data center campus, dusty desert scrub, red-brown mountains in the distance." images/06_low_flyby.png
g pb2_heat "Low ground-level cinematic shot: the white pit bull trudging across cracked desert ground in brutal midday heat, tongue hanging out, panting, heat shimmer rising, dusty paws, the white data center buildings shimmering in the distance behind him. Shallow depth of field, lonely and tired."
g pb3_cctv_gate "$CAM Overlay reads 'CAM 02  MAIN GATE  13:51:22'. Top-down angled view of the data center's front security gate and guard booth, empty road, harsh noon light. The white pit bull sits right in front of the closed gate, looking straight up into the camera lens hopefully." images/mh8_arrival.png
g pb4_gate_opens "Ground-level shot at the data center's main security gate at noon. The gate's electronic lock panel glows green, the gate is sliding open, and the white pit bull stands in the opening with his ears perked and head tilted, curious. Guard booth and long white buildings behind." images/mh8_arrival.png
g pb5_sprinklers "Midday at a strip of drought-tolerant landscaping beside the data center's entrance drive: a line of sprinklers has just turned on, spraying sparkling water with a small rainbow in the mist. The white pit bull joyfully drinks from the spray, wet fur, tongue catching water droplets, pure happiness."
g pb6_front_door "Looking out from inside the data center lobby: the tall glass entrance doors are sliding open, and the slightly wet white pit bull stands at the threshold silhouetted against blinding desert sunlight, hesitating, one paw lifted. Cool blue interior light meets warm outside light." images/mh9_lyra_greet.png
g pb7_lobby_cool "Inside the cool, quiet data center lobby: the white pit bull lies belly-flat and sprawled out on the cold polished concrete floor, legs splayed, eyes half-closed in bliss, cooling down. Nearby a slim wall-mounted intercom panel's cyan light ring glows softly, as if watching over him." images/mh9_lyra_greet.png
g pb8_server_aisle "Inside a dark data center server aisle lit by rows of blinking blue and green server LEDs: the white pit bull trots happily down the center of the aisle toward camera, tail wagging, mouth open in a goofy smile, exploring his new home."
g pb9_home "Night inside the data center operations room, glowing monitors and a cyan-lit intercom ring on the wall. The white pit bull is curled up asleep on a plush grey dog bed next to the server racks, now wearing a simple black collar with a small glowing cyan tag. A full water bowl beside him. Warm, safe, peaceful."
wait; cat logs_*.txt; rm logs_*.txt
python - <<'PY'
from PIL import Image, ImageDraw, ImageFont
import glob,os
fs=sorted(glob.glob("images/pb*.png")); W,H=640,360; rows=(len(fs)+1)//2
s=Image.new("RGB",(2*W,rows*(H+30)),"black"); d=ImageDraw.Draw(s); f=ImageFont.truetype("arial.ttf",20)
for i,p in enumerate(fs):
    x,y=(i%2)*W,(i//2)*(H+30); s.paste(Image.open(p).convert("RGB").resize((W,H)),(x,y+30)); d.text((x+8,y+4),os.path.basename(p),fill="white",font=f)
s.save("storyboards/pitbull_adoption.jpg",quality=88)
PY
