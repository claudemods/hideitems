#!/bin/bash

# Get the selected file's path from the first argument
SELECTED_FILE="$1"

if [ -z "$SELECTED_FILE" ]; then
    echo "No file selected."
    exit 1
fi

if [[ "$(basename "$SELECTED_FILE")" == .* ]]; then
    # File is hidden, so rename it to show it
    NEW_NAME="$(basename "$SELECTED_FILE" | cut -c 2-)"
    mv "$SELECTED_FILE" "$(dirname "$SELECTED_FILE")/$NEW_NAME"
    echo "File is now visible."
else
    # File is visible, so rename it to hide it
    mv "$SELECTED_FILE" "$(dirname "$SELECTED_FILE")/.$(basename "$SELECTED_FILE")"
    echo "File is now hidden."
fi
