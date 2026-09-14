#!/bin/bash

# Create output directory if needed
if [ ! -d "ffmpeg-converted" ]; then
  mkdir ffmpeg-converted
fi

# Convert all .mov files to .mp4 (compressed) with faster preset and similar settings
for i in *.mov; do
  ffmpeg -i "$i" -c:v libx264 -crf 23 -preset faster -c:a aac -b:a 192k -y "ffmpeg-converted/${i%.mov}.mp4"
done
