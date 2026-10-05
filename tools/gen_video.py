"""Generate a video via OpenRouter (/api/v1/videos).
Usage: python tools/gen_video.py <out_name> "<prompt>" [--first img] [--last img]
       [--model google/veo-3.1] [--duration 8] [--res 1080p] [--aspect 16:9] [--audio]
Audio is OFF by default.
"""
import argparse, base64, json, sys, time, urllib.request, urllib.error, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
env = {}
for line in open(ROOT / ".env", encoding="utf-8-sig"):
    if "=" in line and not line.strip().startswith("#"):
        k, v = line.split("=", 1); env[k.strip()] = v.strip()
H = {"Authorization": "Bearer " + env["OPENROUTER_API_KEY"], "Content-Type": "application/json"}

p = argparse.ArgumentParser()
p.add_argument("name"); p.add_argument("prompt")
p.add_argument("--first"); p.add_argument("--last")
p.add_argument("--model", default="google/veo-3.1")
p.add_argument("--duration", type=int, default=8)
p.add_argument("--res", default="1080p")
p.add_argument("--aspect", default="16:9")
p.add_argument("--audio", action="store_true")
a = p.parse_args()

def data_url(path):
    mime = "image/png" if path.lower().endswith(".png") else "image/jpeg"
    return f"data:{mime};base64," + base64.b64encode(open(path, "rb").read()).decode()

body = {"model": a.model, "prompt": a.prompt, "duration": a.duration,
        "resolution": a.res, "aspect_ratio": a.aspect, "generate_audio": a.audio}
frames = []
if a.first: frames.append({"type": "image_url", "image_url": {"url": data_url(a.first)}, "frame_type": "first_frame"})
if a.last:  frames.append({"type": "image_url", "image_url": {"url": data_url(a.last)}, "frame_type": "last_frame"})
if frames: body["frame_images"] = frames

def call(url, data=None):
    req = urllib.request.Request(url, data=json.dumps(data).encode() if data else None, headers=H)
    try:
        return urllib.request.urlopen(req, timeout=300)
    except urllib.error.HTTPError as e:
        print("HTTP", e.code, e.read().decode()[:1000]); sys.exit(1)

job = json.load(call("https://openrouter.ai/api/v1/videos", body))
jid = job["id"]; print(a.name, "job", jid, job.get("status"), flush=True)
while True:
    time.sleep(20)
    s = json.load(call(f"https://openrouter.ai/api/v1/videos/{jid}"))
    st = s.get("status")
    if st == "completed": break
    if st in ("failed", "cancelled", "error"):
        print(a.name, "FAILED:", json.dumps(s)[:1000]); sys.exit(1)
out = ROOT / "videos" / f"{a.name}.mp4"; out.parent.mkdir(exist_ok=True)
out.write_bytes(call(f"https://openrouter.ai/api/v1/videos/{jid}/content?index=0").read())
print(a.name, "saved", out, "| usage:", json.dumps(s.get("usage", {})))
