import sounddevice as sd
import numpy as np
import queue
import threading
from faster_whisper import WhisperModel

# Settings
samplerate = 16000
block_duration = 0.5  # seconds
chunk_duration = 2    # seconds
channels = 1

frames_per_block = int(samplerate * block_duration)
frames_per_chunk = int(samplerate * chunk_duration)

audio_queue = queue.Queue()
audio_buffer = []

# Model setup: medium.en + float16 (optimized for 3080)
# model = WhisperModel("medium.en", device="cuda", compute_type="float32")  # use model size "medium.en" for faster results but slightly lower accuracy
model = WhisperModel("medium.en", device="cpu", compute_type="int8")  # use model size "medium.en" for faster results but slightly lower accuracy


def audio_callback(indata, frames, time, status):
    if status:      
        print("audio status:",  status)
    audio_queue.put(indata.copy())

def recorder():
    with sd.InputStream(samplerate=samplerate, channels=channels, 
                        callback=audio_callback, blocksize=frames_per_block):
        print("🎙️ Listening... Press Ctrl+C to stop.")
        while True:
            sd.sleep(100)


def transcriber():
    global audio_buffer
    while True:
        block = audio_queue.get()
        audio_buffer.append(block)

        total_frames = sum(len(b) for b in audio_buffer)
        if total_frames >= frames_per_chunk:
            audio_data = np.concatenate(audio_buffer)[:frames_per_chunk]
            audio_buffer = []  # Clear buffer

            audio_data = audio_data.flatten().astype(np.float32)

            # Transcription without timestamps
            segments, _ = model.transcribe(
                audio_data,
                language="en",
                beam_size=1  # Max speed
            )

            for segment in segments:
                print(f"{segment.text}")  # Just print text, no timestamps

# Start threads
threading.Thread(target=recorder, daemon=True).start()
transcriber()
