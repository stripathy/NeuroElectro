import re

# Open the HTML file and read its contents
with open('/Users/hugohudson/Downloads/NeuroElectro-main-8/datatable/neuron5/4.html', 'r') as file:
    html_content = file.read()

# Define the pattern to search for
pattern = r'(/web/\d{14}[a-zA-Z0-9_/]+)'

# Replace the matched pattern with the new URL
updated_html_content = re.sub(pattern, r'https://web.archive.org\1', html_content)

# Write the updated content back to a new HTML file
with open('updated_file.html', 'w') as file:
    file.write(updated_html_content)

print("HTML file updated successfully.")
