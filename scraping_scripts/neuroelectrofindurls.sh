#!/bin/bash

# Base URL for the web archive
BASE_URL="https://web.archive.org/web/20211205193428/https://neuroelectro.org/"

# Base directory containing the data
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/data"

# Target directory structure
dir_structure="$DIR/ephys"

# Ensure output file is cleared at the start
output_file="ephys_urls.txt"
> "$output_file"

# Iterate over subdirectories in the target directory
for subdir in "$dir_structure"/*; do
    if [ -d "$subdir" ]; then
        # Extract the number from the directory name (removing the .html suffix)
        NUMBER=$(basename "$subdir" .html)
        
        # Path to the index.html file
        FILE="$subdir/$NUMBER/data/index.html"
        
        if [ -f "$FILE" ]; then
            # Extract and append unique URLs to the output file
            grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/data_table/[0-9]+/" "$FILE" | sort -u >> "$output_file"
            grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/article/[0-9]+/" "$FILE" | sort -u >> "$output_file"
            echo "Processed: $FILE"
        else
            echo "File not found: $FILE"
        fi
    else
        echo "Skipping: $subdir (not a directory)"
    fi
done

echo "URL extraction complete. Results saved to $output_file."


#!/bin/bash

# BASE_URL="https://web.archive.org/web/20211205193428/https://neuroelectro.org/"
# DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/data"


# dir_structure="/Users/hugohudson/Downloads/NeuroElectro-main-2/data/ephys"

# for subdir in "$DIR"/*; do
#     NUMBER=$(basename "$subdir" .html)
#     echo "Dir $DIR"
#     if [ -d "$subdir" ]; then
#         FILE="${subdir}/${NUMBER}/data/index.html"
#         if [ -f "$FILE" ]; then
#             grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/data_table/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt
#             grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/article/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt
#         fi
#         echo "Processed: $FILE"
#     fi
# done



# Create the data folder if it doesn't exist
# mkdir -p "$DATA_DIR"
# for subdir in "$DIR"/*/; do  # Loop through all subdirectories inside $DIR
#     printf "Processing: %s\n" "$subdir"
#     NUMBER=$(basename "$subdir" .html)
#     echo "Number: %s\n" "$NUMBER"
#     if [ -d "$subdir" ]; then
#         FILE="${subdir}${NUMBER}/data/index.html"
#         if [ -n "$FILE" ]; then
#             FILENAME=$(basename "$(dirname "$FILE")")
#             mv "$FILE" "$DIR/${NUMBER}.html"
#             echo "Moved: $FILE -> $DIR/${NUMBER}.html"
#         fi
#     fi
# done