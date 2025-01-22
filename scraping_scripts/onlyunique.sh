#!/bin/bash

# Input file
INPUT_FILE="ephys_urls.txt"
OUTPUT_FILE="ephys_urls_unique.txt"

# Temporary file to store extracted last numbers and original URLs
TEMP_FILE=$(mktemp)

# Extract the last number and save it along with the original URL
while IFS= read -r url; do
    last_number=$(echo "$url" | grep -oE '/[0-9]+/?$' | grep -oE '[0-9]+')
    if [[ -n "$last_number" ]]; then
        echo "$last_number $url" >> "$TEMP_FILE"
    fi
done < "$INPUT_FILE"

# Sort by the last number and remove duplicates, keeping the first occurrence
sort -k1,1 -u "$TEMP_FILE" | cut -d' ' -f2- > "$OUTPUT_FILE"

# Cleanup
rm "$TEMP_FILE"

# Replace original file with filtered unique URLs (optional)
mv "$OUTPUT_FILE" "$INPUT_FILE"

echo "Unique URLs saved to $INPUT_FILE."
