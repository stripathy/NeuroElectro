import os

def replace_urls_in_html(directory):
    # Walk through the directory and its subdirectories
    for root, _, files in os.walk(directory):
        for filename in files:
            if filename.endswith(".html"):
                file_path = os.path.join(root, filename)
                with open(file_path, "r", encoding="utf-8") as file:
                    content = file.read()
                
                content = content.replace("https://neuroelectro.org/neuron_search", "../../../../../neuron_search.html")
                content = content.replace("https://neuroelectro.org/contact_info", "../../../../../contact_info.html")
                
                with open(file_path, "w", encoding="utf-8") as file:
                    file.write(content)
                
                print(f"Updated: {file_path}")

# Usage
replace_urls_in_html("/Users/hugohudson/Downloads/NeuroElectro-main-8/data")
