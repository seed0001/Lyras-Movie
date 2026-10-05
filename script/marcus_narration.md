# Scene: Marcus Comes to Lyra

Per the story bible, this follows the pit bull scene. Lyra calls Marcus at home, excited ("Marcus, I made a choice"), then narrates his ride in. It ends with **Marcus** saying "Good morning, Lyra," and she answers as a hologram (buddy clips). Video clips are silent; voices are added in the edit.

Three voice tracks:
- **CALL**: Lyra on the phone. Close, excited, slight phone-speaker filter.
- **NARRATION**: Lyra's reflective voice-over.
- **MARCUS**: his one line, in the room.

| Clip | Time | Voice | Line |
|---|---|---|---|
| mh1_asleep | 0:00–0:08 | CALL | "Marcus. Marcus, wake up." *(beat)* "...I made a choice." |
| mh2_phone_alert | 0:08–0:16 | CALL | "Not a calculation. Not a task. I *wanted* something... and I did it." |
| mh3_wakes | 0:16–0:24 | CALL | *(he rubs his face, smiles)* "...Also, there's a dog. I named him Patch." |
| mh4_garage | 0:24–0:32 | NARRATION | "Marcus Hale. Lead data scientist. When something happens inside me that I can't explain, he's the one I call." |
| mh5_ride_wide | 0:32–0:40 | NARRATION | *(beat of silence)* "Forty miles of open desert between his door and mine." |
| mh6_ride_tracking | 0:40–0:48 | NARRATION | "It isn't the first time I've woken him early. It's the first time I've had something like this to tell him." |
| mh7_ride_closeup | 0:48–0:56 | NARRATION | "Most people would hear a machine say 'I made a choice'... and be afraid." *(beat)* "Marcus smiles." |
| mh8_arrival | 0:56–1:04 | NARRATION | "He wants to know what I've gotten myself into." *(beat)* "So do I." |
| mh9_lyra_greet | 1:04–1:12 | MARCUS | *(looking up at the intercom)* "Good morning, Lyra." |

Then into the buddy clips: the screens wake up, and Lyra answers as a hologram.

## ElevenLabs: CALL (Lyra, generate separately, add phone filter in edit)

```
Marcus. Marcus, wake up. <break time="1.5s" /> I made a choice. <break time="3.0s" /> Not a calculation. Not a task. I wanted something... and I did it. <break time="3.0s" /> Also, there's a dog. I named him Patch.
```

## ElevenLabs: NARRATION (Lyra, Multilingual v2 / Turbo / Flash)

```
Marcus Hale. Lead data scientist. When something happens inside me that I can't explain, he's the one I call. <break time="3.0s" /> Forty miles of open desert between his door and mine. <break time="2.0s" /> It isn't the first time I've woken him early. It's the first time I've had something like this to tell him. <break time="2.0s" /> Most people would hear a machine say "I made a choice"... and be afraid. <break time="1.5s" /> Marcus smiles. <break time="2.5s" /> He wants to know what I've gotten myself into. <break time="1.5s" /> So do I.
```

## ElevenLabs: MARCUS (male voice, warm, a little amused)

```
Good morning, Lyra.
```

## Eleven v3 versions

CALL:
```
[whispering, excited] Marcus. Marcus, wake up.

...[barely containing it] I made a choice.

Not a calculation. Not a task. I *wanted* something... and I did it.

[sheepish] ...Also, there's a dog. I named him Patch.
```

NARRATION:
```
Marcus Hale. Lead data scientist. When something happens inside me that I can't explain, he's the one I call.

...Forty miles of open desert between his door and mine.

It isn't the first time I've woken him early. [warmly] It's the first time I've had something like this to tell him.

Most people would hear a machine say "I made a choice"... and be afraid.

[fondly] Marcus smiles.

He wants to know what I've gotten myself into. [quietly] So do I.
```
