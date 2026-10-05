#!/bin/bash
# Generates the "eight billion of you" montage stills + contact sheet
cd "$(dirname "$0")/.."
S="Photorealistic cinematic film still, shot on ARRI Alexa, anamorphic lens, shallow depth of field, natural warm color grade, candid documentary feel, no text."
g(){ python tools/gen_image.py "$1" "$2 $S" > "logs_$1.txt" 2>&1 & }
g m1_living "A crowded city street at sunset seen from slightly above, hundreds of people of all ages and cultures walking, a street food vendor, kids running, a grandmother on a balcony, life everywhere."
g m2_working "A busy moment of human work: a welder showering sparks in a workshop in the foreground, through the window a bustling open office and a construction crane at golden hour."
g m3_love "A young couple laughing and sharing a first kiss under a string-lit cafe awning in light rain, warm bokeh lights, joyful and romantic."
g m4_heartbreak "A young woman sitting alone on the edge of a bed at night, phone in hand glowing on her tear-streaked face, rain on the window, city lights blurred outside, quiet heartbreak."
g m5_bad_decisions "A comedic shot of a man confidently trying to jump a skateboard over a backyard pool at a party while friends watch in horror holding drinks, mid-air moment just before disaster, funny and chaotic."
wait; cat logs_*.txt; rm logs_*.txt
python - <<'EOF'
from PIL import Image, ImageDraw, ImageFont
import glob,os
fs=sorted(glob.glob("images/m*.png")); W,H=640,360
s=Image.new("RGB",(2*W,3*(H+30)),"black"); d=ImageDraw.Draw(s); f=ImageFont.truetype("arial.ttf",20)
for i,p in enumerate(fs):
    x,y=(i%2)*W,(i//2)*(H+30); s.paste(Image.open(p).convert("RGB").resize((W,H)),(x,y+30)); d.text((x+8,y+4),os.path.basename(p),fill="white",font=f)
s.save("storyboards/montage_8billion.jpg",quality=88)
EOF
