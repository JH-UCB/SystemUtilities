# FLV to MP4 Converter

This shell script allows you to convert all .mov files in a directory to .mp4 format using FFmpeg.

## Prerequisites

- [FFmpeg](https://ffmpeg.org/download.html) installed on your system.

## Usage

1. Place the `convert_mov_to_mp4.sh` script in the directory containing the .mov files you want to convert.
2. Open a terminal (or Command Prompt) and navigate to the directory containing the .mov files and the `convert_mov_to_mp4.sh` script.
3. Make the script executable by running the following command:

    chmod +x convert_mov_to_mp4.sh

4. Run the script by executing the following command:

    ./convert_mov_to_mp4.sh

The script will create a directory called `ffmpeg-converted` within the same folder and save the converted .mp4 files there.
