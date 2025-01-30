import os
import re

# Define the directory containing the HTML files
directory = '/Users/hugohudson/Downloads/NeuroElectro-main-8/datatable/neuron5'

# Define the pattern to search for
pattern = r'(/web/\d{14}[a-zA-Z0-9_/]+)'

# Loop through all files in the directory
for filename in os.listdir(directory):
    # Process only HTML files
    if filename.endswith('.html'):
        file_path = os.path.join(directory, filename)

        # Read the content of the HTML file
        with open(file_path, 'r') as file:
            html_content = file.read()

        # Replace the matched pattern with the new URL
        updated_html_content = re.sub(pattern, r'https://web.archive.org\1', html_content)

        # Write the updated content back to the same HTML file
        with open(file_path, 'w') as file:
            file.write(updated_html_content)

        print(f"Updated: {filename}")

print("All HTML files updated successfully.")
