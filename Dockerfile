FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y git jq
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD gunicorn app:app & python3 bot.py
