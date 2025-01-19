#!/bin/bash

# Folder path to search for .html files
folder_path="/Users/hugohudson/Downloads/NeuroElectro-main-8/datatable"

# Find all .html files in the folder and subdirectories
find "$folder_path" -type f -name "*.html" | while read file; do
  if [[ -f "$file" ]]; then
    sed -i '' -E \
    -e 's|https://web.archive.org/web/[0-9]+/||g' \
    -e 's|/web/[0-9]+/https://neuroelectro.org/||g' \
    -e 's|/web/[0-9]+/https://www.neuroelectro.org/||g' \
    -e 's|https://neuroelectro.org/article/neuron/([0-9]+)|../../../article/neuron/\1.html|g' \
    -e 's|https://neuroelectro.org/data_table/neuron/([0-9]+)|../../../datatable/neuron/\1.html|g' \
    -e 's|https://neuroelectro.org/article/ephys_prop/([0-9]+)|../../../article/ephys_prop/\1.html|g' \
    -e 's|https://neuroelectro.org/data_table/ephys_prop/([0-9]+)|../../../datatable/ephys_prop/\1.html|g' \
    -e 's|https://neuroelectro.org/neuron/([0-9]+)|../../../neuron/\1.html|g' \
    -e 's|https://neuroelectro.org/ephys_prop/([0-9]+)|../../../ephys_prop/\1.html|g' \
    -e 's|https://www.neuroelectro.org/article/neuron/([0-9]+)|../../../article/neuron/\1.html|g' \
    -e 's|https://www.neuroelectro.org/data_table/neuron/([0-9]+)|../../../datatable/neuron/\1.html|g' \
    -e 's|https://www.neuroelectro.org/article/ephys_prop/([0-9]+)|../../../article/ephys_prop/\1.html|g' \
    -e 's|https://www.neuroelectro.org/data_table/ephys_prop/([0-9]+)|../../../datatable/ephys_prop/\1.html|g' \
    -e 's|https://www.neuroelectro.org/neuron/([0-9]+)|../../../neuron/\1.html|g' \
    -e 's|https://www.neuroelectro.org/ephys_prop/([0-9]+)|../../../ephys_prop/\1.html|g' \
    "$file"
    echo "Updated $file"
  fi
done
