FROM gcr.io/deeplearning-platform-release/tf2-gpu.2-6:latest

# Getting frame-interpolation
WORKDIR /app
RUN git clone https://github.com/google-research/frame-interpolation
WORKDIR /app/frame-interpolation
RUN pip install -r requirements.txt

RUN apt update && apt install -y ffmpeg

RUN mkdir Models
COPY start.sh .

# Launch the web installer
CMD ["./start.sh"]
