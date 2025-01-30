
#!/bin/bash

# Set base URL for Wayback Machine snapshot
# BASE_URL="https://web.archive.org/web/20240901182905/https://neuroelectro.org/ephys_prop/"
BASE_URL="https://web.archive.org/web/20151004071336/https://neuroelectro.org/neuron/"

# Create the output directory if it doesn't exist
# mkdir -p electrodeArchiveGITFINAL
# cd electrodeArchiveGITFINAL || exit
# mkdir -p neuronArchiveGITFINAL
# cd neuronArchiveGITFINAL || exit

# count=0  # Initialize a counter

# for i in {1..400}; do
#     mkdir -p "$i"

#     wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
#          -q -O "$i/$i.html" "${BASE_URL}${i}/"

#     if [[ ! -s "$i/$i.html" ]]; then
#         echo "File $i.html is empty. Deleting..."
#         rm -f "$i/$i.html"
#         rmdir "$i"
#     fi

#     ((count++))  # Increment the counter

#     if (( count % 20 == 0 )); then
#         echo "Scraped $count pages. Waiting for 5 minutes..."
#         sleep 300  # Wait for 5 minutes (300 seconds) after every 20 pages
#     fi
# done

count=0  # Initialize a counter

for i in {5..20}; do
    mkdir -p "$i"

    wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
         --recursive --no-clobber --convert-links --page-requisites \
         --no-parent -P "$i" "${BASE_URL}${i}/data/"
    
    # if [[ ! -s "$i/$i.html" ]]; then
    #     echo "File $i.html is empty. Deleting..."
    #     rm -f "$i/$i.html"
    #     rmdir "$i"
    # fi

    ((count++))  # Increment counter

    if (( count % 20 == 0 )); then
        echo "Scraped $count pages. Waiting for 5 minutes..."
        sleep 300  # Wait for 5 minutes (300 seconds) after every 20 pages
    fi
done



echo "Download complete."
