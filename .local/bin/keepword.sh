#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

text=$(xclip -o)
list="$HOME/Documentos/formats/txt/lists/words.txt"

if [ -z "${text:-}" ]
then
	dunstify "Error: No text selected in clipboard."
	exit 1
fi

if [[ $text =~ ^https?://|^www\.|[0-9]+$ ]]
then
	echo "Info: Text is a link or a number. Skipping..."
	exit 0
fi

echo "$text" >>"$list"
sort -u -o "$list" "$list"

list=$(basename "$list")

dunstify "Added to $list" "$text"
