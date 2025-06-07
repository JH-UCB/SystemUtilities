#!/bin/bash

# Check if the "ffmpeg-converted" directory exists, if not, create it
if [ ! -d "ffmpeg-converted" ]; then
  mkdir ffmpeg-converted
fi

# Loop through all .flv files in the current directory and convert them to .mp4
for i in *.flv; do
  ffmpeg -i "$i" -c:v libx264 -c:a aac -strict experimental -b:a 192k "ffmpeg-converted/${i%.flv}.mp4"
done
