#!/bin/bash

INPUT_AUDIO="$1"
OUTPUT="${INPUT_AUDIO%.*}.mp4"

ffmpeg -f lavfi -i color=c=black:s=1280x720:r=5 -i "$INPUT_AUDIO" -crf 0 -c:a copy -shortest "$OUTPUT"

