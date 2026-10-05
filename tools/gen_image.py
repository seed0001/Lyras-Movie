"""Generate an image via OpenRouter.
Usage: python tools/gen_image.py <out_name> "<prompt>" [--model M] [--ref path.png ...] [--aspect 16:9]
"""
import argparse, base64, json, os, sys, urllib.request, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
env = {}
for line in open(ROOT / ".env", encoding="utf-8-sig"):
    if "=" in line and not line.strip().startswith("#"):
        k, v = line.split("=", 1); env[k.strip()] = v.strip()

p = argparse.ArgumentParser()
p.add_argument("name"); p.add_argument("prompt")
p.add_argument("--model", default=env.get("IMAGE_MODEL", "google/gemini-3.1-flash-image"))
p.add_argument("--ref", nargs="*", default=[])
p.add_argument("--aspect", default="16:9")
a = p.parse_args()

content = [{"type": "text", "text": a.prompt}]
for r in a.ref:
    b64 = base64.b64encode(open(r, "rb").read()).decode()
    mime = "image/png" if r.lower().endswith(".png") else "image/jpeg"
    content.append({"type": "image_url", "image_url": {"url": f"data:{mime};base64,{b64}"}})

body = {"model": a.model, "modalities": ["image", "text"],
        "messages": [{"role": "user", "content": content}],
        "image_config": {"aspect_ratio": a.aspect}}
req = urllib.request.Request("https://openrouter.ai/api/v1/chat/completions",
    data=json.dumps(body).encode(),
    headers={"Authorization": "Bearer " + env["OPENROUTER_API_KEY"], "Content-Type": "application/json"})
resp = json.load(urllib.request.urlopen(req, timeout=300))
msg = resp["choices"][0]["message"]
imgs = msg.get("images") or []
if not imgs:
    print("No image returned:", msg.get("content")); sys.exit(1)
out_dir = ROOT / "images"; out_dir.mkdir(exist_ok=True)
for i, im in enumerate(imgs):
    data = im["image_url"]["url"].split(",", 1)[1]
    path = out_dir / (f"{a.name}.png" if i == 0 else f"{a.name}_{i}.png")
    path.write_bytes(base64.b64decode(data)); print("saved", path)
