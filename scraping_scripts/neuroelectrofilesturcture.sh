#!/bin/bash
for dir in /Users/hugohudson/Downloads/NeuroElectro-main-2/data/*; do
    if [ -d "$dir" ]; then
        neuron_id=$(basename "$dir")  # Extract neuron ID (folder name)
        if [ -f "$dir/index.html" ]; then
            mv "$dir/index.html" "merged_data/${neuron_id}.html"
        fi
    fi
done