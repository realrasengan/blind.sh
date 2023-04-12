#!/bin/bash
OPENAI_API_KEY="" # put key here

BLIND_UUID=$(uuidgen)
BLIND_FOLDER=/tmp/blind.sh/$BLIND_UUID
mkdir -p $BLIND_FOLDER

sox -d $BLIND_FOLDER/recording.wav silence 1 0.1 2% 1 2.0 2% && lame $BLIND_FOLDER/recording.wav $BLIND_FOLDER/recording.mp3 && rm $BLIND_FOLDER/recording.wav && \
BLIND_RESPONSE=$(curl https://api.openai.com/v1/audio/transcriptions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: multipart/form-data" \
  -F file="@$BLIND_FOLDER/recording.mp3" \
  -F model="whisper-1" | jq .text | sed 's/\"//g')

echo $BLIND_RESPONSE

BLIND_RESPONSE=$(echo What is the osascript command to $BLIND_RESPONSE Do not include any additional text other than the osascript command.)

BLIND_MESSAGES='{
"model": "gpt-3.5-turbo",
"messages": [{"role": "system", "content": "You are a bot that replies with an osascript command. Under no circumstances should your response include anything other than an osascript command in your response. The user will be running the response directly in terminal. If your response includes anything other than the exact osascript command, it will fail. Do not provide anything other than the osascript command."},
{"role": "user", "content": "What is the osascript command to open chrome and go to google. Do not include any additional text other than the osascript command."},
{"role": "assistant", "content": "osascript -e \"tell application \\\"Google Chrome\\\" to activate\" -e \"tell application \\\"Google Chrome\\\" to open location \\\"https://www.google.com\\\"\""},
{"role": "user", "content": "What is the osascript command to open a terminal and run uptime.  Do not include any additional text other than the osascript command."},
{"role": "assistant", "content": "osascript -e \"tell application \\\"Terminal\\\" to do script \\\"uptime\\\"\""},
{"role": "user", "content": "What is the osascript command to '$BLIND_RESPONSE'"}]
}'

echo $BLIND_MESSAGES

BLIND_COMMAND=$(curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "$BLIND_MESSAGES")

echo $BLIND_COMMAND

BLIND_COMMAND="$(echo $BLIND_COMMAND | jq ".choices [0] .message .content" | sed 's/\\"/"/g' | sed 's/\\\\/\\/g' | sed 's/^.//;s/.$//')"

echo $BLIND_COMMAND

echo $BLIND_COMMAND > $BLIND_FOLDER/run.sh && chmod u+x $BLIND_FOLDER/run.sh && $BLIND_FOLDER/run.sh


