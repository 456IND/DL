FROM python:3.11-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

# Install system deps (ffmpeg required by yt-dlp)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "bot.py"]
