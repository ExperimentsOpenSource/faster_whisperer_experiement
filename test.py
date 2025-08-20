from faster_whisper import WhisperModel

model_size = "medium.en"

model = WhisperModel(model_size, device="cpu", compute_type="int8")
# model = WhisperModel(model_size, device="cuda", compute_type="float16")


segment, _ = model.transcribe("test.mp3", language="en", beam_size=5)

for segment in segment:
    print(segment.text)