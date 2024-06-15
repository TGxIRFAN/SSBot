FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y git jq
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Loop through the bot definitions and clone each repository and install requirements for each bot
RUN bash start.sh

# Set the command to start the bots
CMD python3 bot.py
