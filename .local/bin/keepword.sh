#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

text=$(xclip -o)
file="$HOME/Documentos/formats/txt/words.txt"

if [ -z "${text:-}" ]; then
	dunstify "Error: No text selected in clipboard."
	exit 1
fi

# check if text is a link or a number
if [[ $text =~ ^https?://|^www\.|[0-9]+$ ]]; then
	echo "Info: Text is a link or a number. Skipping..."
	exit 0
fi

echo "$text" >>"$file"
sort -u -o "$file" "$file"

file=$(basename "$file")

dunstify "Added to $file" "$text"
