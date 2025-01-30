#!/bin/bash

# Directory containing .html files
folder_path="/Users/hugohudson/Downloads/NeuroElectro-main-8/datatable"

# Iterate over all .html files in the directory and subdirectories
find "$folder_path" -type f -name "*.html" | while read -r file; do
  if [[ -f "$file" ]]; then
    # Modify the content of each file
    sed -i '' -E \
      -e 's|(data_table/[0-9]+/)|../../../\1|g' \
      -e 's|(neuron/[0-9]+/)|../../../\1|g' \
      -e 's|(article/[0-9]+/)|../../../\1|g' \
      -e 's|(ephys_prop/[0-9]+/)|../../../\1|g' \
    #   "$file"
    # sed -i '' -E \
    #   -e 's|../../../(data_table/[0-9]+/)|../../\1|g' \
    #   -e 's|../../../(neuron/[0-9]+/)|../../\1|g' \
    #   -e 's|../../../(article/[0-9]+/)|../../\1|g' \
    #   -e 's|../../../(ephys_prop/[0-9]+/)|../../\1|g' \
      "$file"
    echo "Updated $file"
  fi
done
