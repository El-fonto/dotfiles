#!/bin/bash

WAV_INPUT="$1"
MP3_OUTPUT="${WAV_INPUT%.*}.mp3"

fmmpeg -i "$WAV_INPUT" -codec:a libmp3lame -b:a 192k "$MP3_OUTPUT"
